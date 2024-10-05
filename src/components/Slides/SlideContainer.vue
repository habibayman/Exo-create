<!-- eslint-disable vue/no-v-html -->
<template>
  <div class="presentation" :style="backgroundStyle">
    <transition @before-enter="beforeEnter" @enter="enter" @leave="leave">
      <div v-if="currentSlide" :key="currentSlideIndex" class="slide">
        <h1 v-if="isChapterIntro" ref="slideTitle" class="chapter-title">
          {{ currentSlide.title }}
        </h1>
        <div v-else>
          <h2 ref="slideTitle" class="slide-title">
            {{ currentSlide.title }}
          </h2>
          <p
            ref="slideContent"
            class="slide-content"
            v-html="
              currentSlide.content
                .split('\n')
                .map((line) => `<span>${line}</span>`)
                .join('')
            "></p>

          <div v-if="currentSlide.videoUrl" class="video-container">
            <video
              controls
              :src="currentSlide.videoUrl"
              class="video-player"></video>
          </div>
        </div>
      </div>
    </transition>

    <div class="navigation">
      <button
        :style="{ visibility: isFirstSlide ? 'hidden' : 'visible' }"
        class="prev-button"
        @click="prevSlide">
        Previous
      </button>

      <button
        v-if="isLastSlide"
        class="next-button"
        type="button"
        @click="$emit('goToQuiz')">
        Go to Quiz
      </button>
      <button v-else class="next-button" @click="nextSlide">Next</button>
    </div>
  </div>
</template>

<script>
import slidesData from '@/data/slidesContent.js';
import { gsap } from 'gsap';
import 'animate.css';

export default {
  emits: ['goToQuiz'],

  data() {
    return {
      slides: [],
      currentSlideIndex: 0,
      currentChapterIndex: 0,
      entering: false,
    };
  },

  computed: {
    currentSlide() {
      const chapter = this.slides[this.currentChapterIndex];
      return chapter ? chapter.slides[this.currentSlideIndex] : null;
    },

    backgroundStyle() {
      const chapter = this.slides[this.currentChapterIndex];
      if (chapter && chapter.backgroundImage) {
        return {
          backgroundImage: `url(${chapter.backgroundImage})`,
          transition: 'background-image 1s ease-in-out',
        };
      }
      return {};
    },

    isChapterIntro() {
      return this.currentSlide && this.currentSlide.isChapterIntro;
    },

    isFirstSlide() {
      return (
        this.currentChapterIndex === 0 && this.currentSlideIndex === 0
      );
    },

    isLastSlide() {
      const chapter = this.slides[this.currentChapterIndex];
      return (
        this.currentChapterIndex === this.slides.length - 1 &&
        this.currentSlideIndex === chapter.slides.length - 1
      );
    },
  },

  created() {
    this.slides = slidesData.map((chapter) => ({
      ...chapter,
      slides: [
        { title: chapter.title, isChapterIntro: true },
        ...chapter.slides,
      ],
    }));
  },

  methods: {
    nextSlide() {
      this.animateSlideTransition('next');
    },

    prevSlide() {
      this.animateSlideTransition('prev');
    },

    animateSlideTransition(direction) {
      const slideTitle = this.$refs.slideTitle;
      const slideContent = this.$refs.slideContent;

      // Exit animations
      gsap.to(slideTitle, {
        opacity: 0,
        x: direction === 'next' ? -100 : 100,
        duration: 0.5,
      });
      gsap.to(slideContent, {
        opacity: 0,
        x: direction === 'next' ? -100 : 100,
        duration: 0.5,
      });

      setTimeout(() => {
        if (direction === 'next') {
          const chapter = this.slides[this.currentChapterIndex];
          if (this.currentSlideIndex < chapter.slides.length - 1) {
            this.currentSlideIndex++;
          } else if (this.currentChapterIndex < this.slides.length - 1) {
            this.currentChapterIndex++;
            this.currentSlideIndex = 0;
          }
        } else {
          if (this.currentSlideIndex > 0) {
            this.currentSlideIndex--;
          } else if (this.currentChapterIndex > 0) {
            this.currentChapterIndex--;
            this.currentSlideIndex =
              this.slides[this.currentChapterIndex].slides.length - 1;
          }
        }

        // Entrance animations
        this.applySlideEntranceAnimation(
          slideTitle,
          slideContent,
          direction
        );
      }, 500);
    },

    applySlideEntranceAnimation(slideTitle, slideContent, direction) {
      // Reset positions for entrance
      gsap.set(slideTitle, {
        opacity: 0,
        x: direction === 'next' ? 100 : -100,
      });
      gsap.set(slideContent, {
        opacity: 0,
        x: direction === 'next' ? 100 : -100,
      });

      // Entrance animations
      gsap.to(slideTitle, {
        opacity: 1,
        x: 0,
        duration: 1,
        ease: 'power2.out',
      });
      gsap.to(slideContent, {
        opacity: 1,
        x: 0,
        duration: 1,
        delay: 0.3,
        ease: 'power2.out',
      });
    },

    beforeEnter(el) {
      gsap.from(el, {
        opacity: 0,
        scale: 0.8,
        duration: 0.7,
        ease: 'back.out(1.7)',
      });
    },

    enter(el) {
      gsap.to(el, { opacity: 1, scale: 1, duration: 0.7 });
    },

    leave(el) {
      gsap.to(el, { opacity: 0, scale: 0.8, duration: 0.5 });
    },
  },
};
</script>

<style scoped>
.presentation {
  background-size: cover;
  background-position: center;
  height: 70vh;
  max-height: 800px;
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  color: white;
  position: relative;
  overflow: hidden;
  transition: background-image 1s ease-in-out;
}

.slide {
  text-align: center;
  padding: 30px;
  width: 100%;
  max-height: calc(100% - 100px);
  overflow: auto;
}

.chapter-title {
  font-size: 3em;
  margin-bottom: 30px;
  color: #ffcc00;
  text-transform: uppercase;
  letter-spacing: 2px;
}

.slide-title {
  font-size: 2.5em;
  margin-bottom: 20px;
  letter-spacing: 1px;
  color: #ffcc00;
}

.slide-content {
  font-size: 1.3em;
  line-height: 1.8;
  padding: 0 30px;
  color: rgba(255, 255, 255, 0.9);
}

@media (min-width: 768px) {
  .slide-content {
    font-size: 1.5em;
  }
}

.video-container {
  margin-top: 20px;
}

.video-player {
  width: 100%;
  max-width: 800px;
  border-radius: 10px;
  max-height: 350px;
}

.presentation::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  z-index: 0;
}

.slide {
  position: relative;
  z-index: 1;
}

.navigation {
  margin-top: 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  height: 50px;
  position: absolute;
  bottom: 0;
}

button {
  background: linear-gradient(145deg, #ffcc00, #ffa500);
  border: none;
  padding: 12px 25px;
  font-size: 1.2em;
  color: #fff;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow:
    0 5px 15px rgba(255, 204, 0, 0.5),
    0 0 5px rgba(255, 204, 0, 0.5);
  position: relative;
  overflow: hidden;
  z-index: 1;
  outline: none;
}

button.prev-button {
  border-top-right-radius: 20px;
  font-size: 1.3em;
}

button.next-button {
  border-top-left-radius: 20px;
  font-size: 1.3em;
}

@media (min-width: 768px) {
  button.prev-button {
    font-size: 1.6em;
  }

  button.next-button {
    font-size: 1.6em;
  }
}

button::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 300%;
  height: 300%;
  background: radial-gradient(
    circle at 50% 50%,
    rgba(255, 255, 255, 0.3),
    rgba(255, 255, 255, 0)
  );
  transition: all 0.5s ease;
  transform: translate(-50%, -50%) scale(0);
  z-index: -1;
}

button:hover::before {
  transform: translate(-50%, -50%) scale(1);
}

button:hover {
  background: linear-gradient(145deg, #ffa500, #ff8c00);
  box-shadow:
    0 10px 30px rgba(255, 204, 0, 0.8),
    0 0 10px rgba(255, 204, 0, 0.8);
}

button:disabled {
  background-color: grey;
  cursor: not-allowed;
  box-shadow: none;
}

button:active {
  transform: scale(0.95);
  box-shadow:
    0 5px 10px rgba(255, 204, 0, 0.4),
    0 0 5px rgba(255, 204, 0, 0.4);
}

button:focus {
  outline: none;
}

@keyframes button-glow {
  0% {
    box-shadow:
      0 0 10px rgba(255, 204, 0, 0.5),
      0 0 5px rgba(255, 204, 0, 0.5);
  }
  50% {
    box-shadow:
      0 0 20px rgba(255, 204, 0, 0.8),
      0 0 10px rgba(255, 204, 0, 0.8);
  }
  100% {
    box-shadow:
      0 0 10px rgba(255, 204, 0, 0.5),
      0 0 5px rgba(255, 204, 0, 0.5);
  }
}

button:hover {
  animation: button-glow 1.5s infinite alternate;
}
</style>
