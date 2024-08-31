if(world instanceof ServerLevel _world) {
ForgeChunkManager.forceChunk(_world, "${modid}", new BlockPos((int) ${input$chunk}.getPos().x, 0,(int) ${input$chunk}.getPos().z), ${input$chunk}.getPos().x, ${input$chunk}.getPos().z, ${input$add}, ${input$ticking});
}