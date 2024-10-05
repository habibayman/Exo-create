<template>
  <parallax-wrapper
    :backgroundColor="'linear-gradient(to bottom, #3e6fbf, #0f1b4d)'">
    <background
      :frontImage="'/src/assets/images/blue-planet-front.png'"
      :backImage="'/src/assets/images/blue-planet-back.png'"
      :skyImage="'/src/assets/images/blue-planet-sky.png'"
      :frontTranslateZ="-4"
      :frontScale="1.68"
      :backTranslateZ="-7"
      :backScale="2.2"
      :skyTranslateZ="-13"
      :skyScale="2.5">
    </background>

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
