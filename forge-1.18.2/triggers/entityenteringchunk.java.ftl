<#include "procedures.java.ftl">
@Mod.EventBusSubscriber
public class ${name}Procedure {
    @SubscribeEvent
    public static void onEventTriggered(EntityEvent.EnteringChunk event) {
        <#assign dependenciesCode><#compress>
            <@procedureDependenciesCode dependencies, {
            "x": "event.getEntity().getX()",
            "y": "event.getEntity().getY()",
            "z": "event.getEntity().getZ()",
            "entity": "event.getEntity()",
            "world": "event.getEntity().level()",
            "NewChunkX": "event.getNewChunkX()",
            "NewChunkZ": "event.getNewChunkZ()",
            "OldChunkX": "event.getOldChunkX()",
            "OldChunkZ": "event.getOldChunkZ()",
            "Dimension": "event.getEntity().level().dimension()",
            "event": "event"
            }/>
        </#compress></#assign>
        execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
    }