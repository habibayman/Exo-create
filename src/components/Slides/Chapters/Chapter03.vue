<template>
  <parallax-wrapper
    :backgroundColor="'linear-gradient(to right, #e46b9b, #993d7c)'">
    <background
      :frontImage="'/src/assets/images/red-planet-front.png'"
      :backImage="'/src/assets/images/red-planet-back.png'"
      :skyImage="'/src/assets/images/red-planet-sky.png'"
      :frontTranslateZ="-4"
      :frontScale="1.71"
      :backTranslateZ="-8"
      :backScale="2.3"
      :skyTranslateZ="-12"
      :skyScale="2.8">
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
