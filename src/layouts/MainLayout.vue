<template>
  <div class="main-layout">
    <CanvasContainer />
    <NavigationContainer />
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
  },
};
</script>

<style scoped>
.main-layout {
  height: 100vh;
}
</style>
