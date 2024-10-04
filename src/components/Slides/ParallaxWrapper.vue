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
  width: 845px; 
  height: 470px;
  font-size: 1.2em;
  border-radius: 8px;
  position: relative;
  /* z-index: 1; */
}

.parallax-wrapper::-webkit-scrollbar {
  display: none; 
}
</style>
 