<#include "procedures.java.ftl">
@Mod.EventBusSubscriber
public class ${name}Procedure {
    @SubscribeEvent
    public static void onEventTriggered(ChunkEvent.Unload event) {
        <#assign dependenciesCode><#compress>
            <@procedureDependenciesCode dependencies, {
            "x": "event.getChunk().getPos().x",
            "y": "0",
            "z": "event.getChunk().getPos().z",
            "world": "event.getChunk().getWorldForge()",
            "chunk": "(LevelChunk) event.getChunk()",
            "dimension": "event.getChunk().getWorldForge().dimension()",
            "event": "event"
            }/>
        </#compress></#assign>
        execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
    }