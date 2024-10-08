<#include "procedures.java.ftl">
@Mod.EventBusSubscriber
public class ${name}Procedure {
    @SubscribeEvent
    public static void onEventTriggered(ChunkWatchEvent.UnWatch event) {
        <#assign dependenciesCode><#compress>
            <@procedureDependenciesCode dependencies, {
            "x": "event.getPos().x",
            "y": "0",
            "z": "event.getPos().z",
            "entity": "event.getPlayer()",
            "world": "event.getLevel()",
            "dimension": "event.getLevel().dimension()",
            "event": "event"
            }/>
        </#compress></#assign>
        execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
    }