<template>
  <div class="main-layout">
    <CanvasContainer />
    <div class="main-content">
      <GameContainer />
    </div>
  </div>
</template>

<script>
import CanvasContainer from '@/components/CanvasContainer.vue';
import QuizContainer from '@/components/Quiz/QuizContainer.vue';
import MainSlideContainer from '@/components/Slides/MainSlideContainer.vue';
import GameContainer from '@/components/Game/GameContainer.vue';

export default {
  name: 'MainLayout',

  components: {
    CanvasContainer,
    QuizContainer,
    MainSlideContainer,
    GameContainer,
  },
};
</script>

<style scoped>
.main-layout {
  height: 100vh;
}
.main-content {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  width: 100%;
  max-width: 1024px;
  margin: 0 auto;
  padding: 20px;
}
</style>
