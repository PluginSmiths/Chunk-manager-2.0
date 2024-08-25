<#include "procedures.java.ftl">
@Mod.EventBusSubscriber
public class ${name}Procedure {
    @SubscribeEvent
    public static void onEventTriggered(net.minecraftforge.event.level.ChunkEvent.Load event) {
        <#assign dependenciesCode><#compress>
            <@procedureDependenciesCode dependencies, {
            "x": "event.getChunk().getPos().x",
            "y": "0",
            "z": "event.getChunk().getPos().z",
            "world": "event.getChunk().getWorldForge()",
            "chunk": "(LevelChunk) event.getChunk()",
            "NewChunk": "event.isNewChunk()",
            "event": "event"
            }/>
        </#compress></#assign>
        execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
    }