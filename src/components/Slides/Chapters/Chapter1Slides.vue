<template>
  <div v-if="!slidesStarted">
    <parallax-wrapper
      :backgroundColor="'linear-gradient(to bottom, #3e6fbf, #0f1b4d'">
      <background
        :frontImage="'src/assets/images/blue-planet-front.png'"
        :backImage="'src/assets/images/blue-planet-back.png'"
        :skyImage="'src/assets/images/blue-planet-sky.png'"
        :frontTranslateZ="-4"
        :frontScale="1.68"
        :backTranslateZ="-7"
        :backScale="2.2"
        :skyTranslateZ="-13"
        :skyScale="2.5">
      </background>
      <button @click="startSlides" class="start-slides">Start</button>
    </parallax-wrapper>
  </div>

  <div v-else class="container">
    <transition
      enter-active-class="animate__animated animate__fadeInLeft"
      leave-active-class="animate__animated animate__fadeOutLeft">
      <slide-wrapper
        :key="chapterSlides[currentSlideIndex].slideId"
        :title="chapterSlides[currentSlideIndex].title"
        :content="chapterSlides[currentSlideIndex].content"
        :headerColor="'white'"
        :contentColor="'white'">
      </slide-wrapper>
    </transition>

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
      chapterIndex: 0,
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
  background: rgba(0, 0, 255, 0.75);
  position: relative;
  border-radius: 15px;
  box-shadow: 0 0 10px #3e6fbf;
}

.start-slides {
  position: absolute;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  padding: 10px 20px;
  font-size: 1.2rem;
  background: #3e6fbf;
  color: white;
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
  background: #3e6fbf;
  color: white;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  z-index: 5;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  margin-left: 1em;
  margin-right: 1em;
}

button:hover {
  background: #2e5a9f;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.prev-button {
  left: 10px;
}

.next-button {
  right: 10px;
}

.animate__fadeInLeft {
  animation-duration: 0.7s;
}
.animate__fadeOutLeft {
  animation-duration: 0.7s;
}


/* .planet-img {
  position: absolute;
  bottom: 0;
  left: -10%;
  width: 300px;
  z-index: 0;
  opacity: 0.6;
  overflow: hidden;
}

.planet img {
  max-width: 100%;
  height: auto; 
} */
</style>
