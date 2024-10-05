<template>
  <div class="main-layout">
    <CanvasContainer />
    <div class="main-content">
      <main-slide-container></main-slide-container>
    </div>
  </div>
</template>

<script>
import CanvasContainer from '@/components/CanvasContainer.vue';
import MainSlideContainer from '../components/Slides/MainSlideContainer.vue';

export default {
  name: 'MainLayout',

  components: {
    CanvasContainer,
    MainSlideContainer,
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
