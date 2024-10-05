<template>
  <parallax-wrapper
    :backgroundColor="'linear-gradient(to bottom, #8d398e, #6e2a6a)'">
    <background
      :frontImage="'/src/assets/images/purple-planet-front.png'"
      :backImage="'/src/assets/images/purple-planet-back.png'"
      :skyImage="'/src/assets/images/purple-planet-sky.png'"
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
