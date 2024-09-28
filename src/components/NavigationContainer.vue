<template>
  <div class="navigation-container">
    <div class="navigation-card">
      <!-- Add different navigation cards -->
    </div>
  </div>
</template>

<script>
export default {
  name: 'NavigationContainer',
};
</script>

<style scoped>
.navigation-container {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.navigation-card {
  background-color: #cbc1c1;
  border-radius: 1rem;
  width: 60rem; /* Example width */
  height: 35rem; /* Example height */
  z-index: 1;
}
</style>
