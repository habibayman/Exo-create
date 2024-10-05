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

    <button
      v-if="currentSlideIndex > 0"
      @click="prevSlide"
      class="prev-button">
      Previous
    </button>
    <button
      v-if="currentSlideIndex < chapterSlides.length - 1"
      @click="nextSlide"
      class="next-button">
      Next
    </button>

    <button
      v-if="currentSlideIndex === chapterSlides.length - 1"
      @click="nextChapter"
      class="next-chapter-button">
      Next Chapter
    </button>

    <button
      v-if="currentSlideIndex === 0 && chapterIndex > 0"
      @click="prevChapter"
      class="prev-chapter-button">
      Previous Chapter
    </button>
  </div>
</template>

<script>
import SlideWrapper from '../SlideWrapper.vue';
import ParallaxWrapper from '@/components/Slides/ParallaxWrapper.vue';
import slidesContent from '@/data/slidesContent.js';
import Background from '../Background.vue';

export default {
  components: {
    SlideWrapper,
    ParallaxWrapper,
    Background,
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

  background: linear-gradient(
    to bottom,
    rgba(141, 57, 142, 0.5),
    rgba(110, 42, 106, 0.5)
  );
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

button {
  position: absolute;
  bottom: 20px;
  padding: 10px 20px;
  font-size: 1rem;
  color: white;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  z-index: 5;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  margin-left: 1em;
  margin-right: 1em;
  background: #6e2a6a;
}

button:hover {
  background: #8d398e;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.prev-button {
  left: 10px;
}

.next-button {
  right: 10px;
}
</style>
