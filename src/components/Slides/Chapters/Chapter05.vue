<template>
    <parallax-wrapper
      :backgroundColor="'linear-gradient(to bottom, #3e6fbf, #0f1b4d)'">
      <background
        :frontImage="'/src/assets/images/bluish-planet-front.png'"
        :backImage="'/src/assets/images/bluish-planet-back.png'"
        :skyImage="'/src/assets/images/bluish-planet-sky.png'"
        :frontTranslateZ="-3"
        :frontScale="1.71"
        :backTranslateZ="-8"
        :backScale="2.3"
        :skyTranslateZ="-12"
        :skyScale="2.8">
      </background>
      <div class="gradient-overlay"></div>
      <content> </content>
    </parallax-wrapper>
  </template>
  
  <script>
  import ParallaxWrapper from '@/components/Slides/ParallaxWrapper.vue';
  import Background from '../Background.vue';
  import Content from '../Content.vue';
  
  export default {
    components: {
      ParallaxWrapper,
      Background,
      Content,
    },
  };
  </script>
  