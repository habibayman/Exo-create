<template>
  <parallax-wrapper
    :backgroundColor="'linear-gradient(to right, #80d98f, #56c66d)'">
    <background
      :frontImage="'/src/assets/images/green-planet-front.png'"
      :backImage="'/src/assets/images/green-planet-back.png'"
      :skyImage="'/src/assets/images/green-planet-sky.png'"
      :frontTranslateZ="-5"
      :frontScale="2"
      :backTranslateZ="-8"
      :backScale="2.3"
      :skyTranslateZ="-10"
      :skyScale="2.1">
    </background>
    <content>
      Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dolores,
      quasi ut. Qui sequi saepe exercitationem ab corporis alias laborum
      amet, similique harum dolore aut quos in nulla excepturi ipsam vel!
    </content>
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
