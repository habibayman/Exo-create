<template>
  <div class="main-layout">
    <CanvasContainer />
    <MainNavigation />
  </div>
</template>

<script>
import CanvasContainer from '@/components/CanvasContainer.vue';
import MainNavigation from '@/components/MainNavigation.vue';

export default {
  name: 'MainLayout',

  components: {
    CanvasContainer,
    MainNavigation,
  },
};
</script>
