<template>
  <div v-if="!slidesStarted">
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
      <button @click="startSlides" class="start-slides">Start</button>
    </parallax-wrapper>
  </div>

  <div v-else class="container">
    <slide-wrapper
      :key="chapterSlides[currentSlideIndex].slideId"
      :title="chapterSlides[currentSlideIndex].title"
      :content="chapterSlides[currentSlideIndex].content">
    </slide-wrapper>

    <button @click="prevSlide">Previous</button>
    <button @click="nextSlide">Next</button>

    <button
      v-if="currentSlideIndex === chapterSlides.length - 1"
      @click="nextChapter">
      Next Chapter
    </button>

    <button
      v-if="currentSlideIndex === 0 && chapterIndex > 0"
      @click="prevChapter">
      Previous Chapter
    </button>
  </div>
</template>

<script>
import SlideWrapper from '../SlideWrapper.vue';
import ParallaxWrapper from '@/components/Slides/ParallaxWrapper.vue';
import slidesContent from '@/data/slidesContent.js';
import Background from '../Background.vue';
import Content from '../Content.vue';

export default {
  components: {
    SlideWrapper,
    ParallaxWrapper,
    Background,
    Content,
  },
  data() {
    return {
      currentSlideIndex: 0,
      chapterIndex: 3,
      slidesStarted: false,
    };
  },
  computed: {
    chapterSlides() {
      return slidesContent[this.chapterIndex].slides;
    },
  },
  methods: {
    startSlides() {
      this.slidesStarted = true;
      this.currentSlideIndex = 0;
    },
    nextSlide() {
      if (this.currentSlideIndex < this.chapterSlides.length - 1) {
        this.currentSlideIndex++;
      }
    },
    prevSlide() {
      if (this.currentSlideIndex > 0) {
        this.currentSlideIndex--;
      }
    },
    nextChapter() {
      this.$emit('nextChapter');
      this.currentSlideIndex = 0;
    },
    prevChapter() {
      this.$emit('prevChapter');
      this.currentSlideIndex = 0;
    },
  },
};
</script>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100%;
  max-width: 845px;

  background: linear-gradient(to bottom, #8d398e, #6e2a6a);
  padding: 2rem;
  position: relative;
  border-radius: 15px;
  box-shadow: 0 0 10px #993d7c;
}

.start-slides {
  position: absolute;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  padding: 10px 20px;
  font-size: 1.2rem;
  background: #993d7c;
  color: black;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  z-index: 5;
}
</style>
