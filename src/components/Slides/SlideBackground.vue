<template>
  <header>
    <img
      :src="frontImage"
      alt="front"
      :style="{
        transform: `translateZ(${frontTranslateZ}px) scale(${frontScale})`,
      }" />
    <img
      :src="backImage"
      alt="back"
      :style="{
        transform: `translateZ(${backTranslateZ}px) scale(${backScale})`,
      }" />
    <img
      :src="skyImage"
      alt="sky"
      :style="{
        transform: `translateZ(${skyTranslateZ}px) scale(${skyScale})`,
      }" />
  </header>
</template>

<script>
export default {
  props: {
    frontImage: {
      type: String,
      required: true,
    },
    backImage: {
      type: String,
      required: true,
    },
    skyImage: {
      type: String,
      required: true,
    },
    frontTranslateZ: {
      type: Number,
      required: true,
    },
    frontScale: {
      type: Number,
      required: true,
    },
    backTranslateZ: {
      type: Number,
      required: true,
    },
    backScale: {
      type: Number,
      required: true,
    },
    skyTranslateZ: {
      type: Number,
      required: true,
    },
    skyScale: {
      type: Number,
      required: true,
    },
  },
};
</script>

<style scoped>
img {
  position: absolute;
  height: 100%;
  width: 100%;
  object-fit: contain; /* might change later to cover */
  z-index: 1;
}

header {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  width: 100;
  transform-style: preserve-3d;
  z-index: 1;
}
</style>
