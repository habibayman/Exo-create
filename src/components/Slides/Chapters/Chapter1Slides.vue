<template>
  <div v-if="!slidesStarted">
    <parallax-wrapper
      :background-color="'linear-gradient(to bottom, #3e6fbf, #0f1b4d'">
      <slide-background
        :front-image="'src/assets/images/blue-planet-front.png'"
        :back-image="'src/assets/images/blue-planet-back.png'"
        :sky-image="'src/assets/images/blue-planet-sky.png'"
        :front-translate-z="-4"
        :front-scale="1.68"
        :back-translate-z="-7"
        :back-scale="2.2"
        :sky-translate-z="-13"
        :sky-scale="2.5">
      </slide-background>
      <button class="start-slides" @click="startSlides">Start</button>
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
        :header-color="'white'"
        :content-color="'white'">
      </slide-wrapper>
    </transition>

    <button
      v-if="currentSlideIndex > 0"
      class="prev-button"
      @click="prevSlide">
      Previous
    </button>
    <button
      v-if="currentSlideIndex < chapterSlides.length - 1"
      class="next-button"
      @click="nextSlide">
      Next
    </button>

    <button
      v-if="currentSlideIndex === chapterSlides.length - 1"
      class="next-chapter-button"
      @click="nextChapter">
      Next Chapter
    </button>

    <button
      v-if="currentSlideIndex === 0 && chapterIndex > 0"
      class="prev-chapter-button"
      @click="prevChapter">
      Previous Chapter
    </button>
  </div>
</template>

<script>
import SlideWrapper from '@/components/Slides/SlideWrapper.vue';
import ParallaxWrapper from '@/components/Slides/ParallaxWrapper.vue';
import slidesContent from '@/data/slidesContent.js';
import SlideBackground from '@/components/Slides/SlideBackground.vue';

export default {
  components: {
    SlideWrapper,
    ParallaxWrapper,
    SlideBackground,
  },
  emits: ['nextChapter'],
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
