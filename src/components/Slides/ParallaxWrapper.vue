<template>
  <div class="parallax-wrapper" :style="{ background: backgroundColor }">
    <slot></slot>
  </div>
</template>


<script>
export default {
  props: {
    backgroundColor: {
      type: String,
    }
  }
};
</script>

<style scoped>
.parallax-wrapper {
  overflow-y: auto;
  overflow-x: hidden;
  perspective: 10px;
  height: 80vh;
  width: 80vw; 
  margin: 2rem auto;
  font-size: 1.2em;
  border-radius: 8px;
  position: relative;
}

.parallax-wrapper::-webkit-scrollbar {
  display: none; 
}
</style>
 