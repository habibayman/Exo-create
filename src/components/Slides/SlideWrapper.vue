<template>
  <div class="slide-wrapper">
    <h2 v-if="title" :style="{ color: headerColor }">{{ title }}</h2>
    <p :style="{ color: contentColor }">{{ content }}</p>
  </div>
</template>

<script>
export default {
  name: 'SlideWrapper',
  props: {
    title: {
      type: String,
      required: true,
    },
    content: {
      type: String,
      required: true,
    },
    headerColor: {
      type: String,
      default: 'white',
    },
    contentColor: {
      type: String,
      default: 'black',
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
  line-height: 1.6;
  padding: 30px;
  position: relative;
  height: 100%;
}

h2 {
  font-size: 2em;
  margin-bottom: 10px;
  z-index: 1;
}

p {
  font-family: 'Exo 2', sans-serif;
  font-size: 1.1em;
  z-index: 1;
}
</style>
