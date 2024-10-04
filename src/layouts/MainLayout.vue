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
import NavigationContainer from '@/components/NavigationContainer.vue';
import Chapter01 from '../components/Slides/Chapters/Chapter01.vue';
import Chapter02 from '../components/Slides/Chapters/Chapter02.vue';
import Chapter03 from '../components/Slides/Chapters/Chapter03.vue';
import MainSlideContainer from '../components/Slides/MainSlideContainer.vue';

export default {
  name: 'MainLayout',

  components: {
    CanvasContainer,
    NavigationContainer,
    Chapter01,
    Chapter02,
    Chapter03,
    MainSlideContainer
  },
};
</script>

<style scoped>
.main-layout {
  height: 100vh;
}
</style>
