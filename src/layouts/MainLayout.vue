<template>
  <div class="main-layout">
    <CanvasContainer />
    <div class="main-content">
    </div>
  </div>
</template>

<script>
import CanvasContainer from '@/components/CanvasContainer.vue';
import NavigationContainer from '@/components/NavigationContainer.vue';


export default {
  name: 'MainLayout',

  components: {
    CanvasContainer,
    NavigationContainer,
    Chapter01,
    Chapter02,
    ChapterTest,
  },
};
</script>

<style scoped>
.main-layout {
  height: 100vh;
}
</style>
