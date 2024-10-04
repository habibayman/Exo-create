<template>
  <div class="slide-container">
    <component
      :is="currentChapter"
      @nextChapter="goToNextChapter"
      @prevChapter="goToPrevChapter"></component>
  </div>
</template>

<script>
import Chapter1Slides from './Chapters/Chapter1Slides.vue';
import Chapter2Slides from './Chapters/Chapter2Slides.vue';
import Chapter3Slides from './Chapters/Chapter3Slides.vue';
import Chapter4Slides from './Chapters/Chapter4Slides.vue';
import Chapter5Slides from './Chapters/Chapter5Slides.vue';

export default {
  components: {
    Chapter1Slides,
    Chapter2Slides,
    Chapter3Slides,
    Chapter4Slides,
    Chapter5Slides,
  },
  data() {
    return {
      chapters: [
        Chapter1Slides, 
        Chapter2Slides,
        Chapter3Slides,
        Chapter4Slides,
        Chapter5Slides,
      ],
      currentChapterIndex: 0,
      toggleNextChapter: false,
    };
  },
  computed: {
    currentChapter() {
      return this.chapters[this.currentChapterIndex];
    },
  },
  methods: {
    goToNextChapter() {
      if (this.currentChapterIndex < this.chapters.length - 1) {
        this.currentChapterIndex++;
      }
    },
    goToPrevChapter() {
      if (this.currentChapterIndex > 0) {
        this.currentChapterIndex--;
      }
    },

  },
};
</script>

<style scoped>
.slide-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
  width: 100%;
  height: 75%;
  margin: 2rem auto;
  border-radius: 8px;
}
</style>
