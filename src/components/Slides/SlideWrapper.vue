<template>
  <div class="slide-wrapper">
    <h2 v-if="title">{{ title }}</h2>
    <p>{{ content }}</p>
  </div>
</template>

<script>
export default {
  name: 'SlideWrapper',
  props: {
    title: {
      type: String,
      required: false,
    },
    content: {
      type: String,
      required: true, 
    },
  },
};
</script>

<style scoped>
.slide-wrapper {
  flex-direction: column;
  display: flex;
  overflow: hidden;
  align-content: center;
  justify-content: center;
  color:black;
}
</style>
