<#include "procedures.java.ftl">
@Mod.EventBusSubscriber
public class ${name}Procedure {
    @SubscribeEvent
    public static void onEventTriggered(ChunkEvent.Load event) {
        <#assign dependenciesCode><#compress>
            <@procedureDependenciesCode dependencies, {
            "x": "event.getChunk().getPos().x",
            "y": "0",
            "z": "event.getChunk().getPos().z",
            "world": "event.getChunk().getWorldForge()",
            "chunk": "(ChunkLevel) event.getChunk()",
            "NewChunk": "event.isNewChunk()",
            "event": "event"
            }/>
        </#compress></#assign>
        execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
    }