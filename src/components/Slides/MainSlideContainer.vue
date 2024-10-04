<template>
  <div class="slide-container">
    <component :is="currentChapter"></component>
    <button class="prev-button" @click="previousChapter">Previous</button>
    <button class="next-button" @click="nextChapter">Next</button>
  </div>
</template>

<script>
import Chapter01 from './Chapters/Chapter01.vue';
import Chapter02 from './Chapters/Chapter02.vue';
import Chapter03 from './Chapters/Chapter03.vue';
import Chapter04 from './Chapters/Chapter04.vue';
import Chapter05 from './Chapters/Chapter05.vue';

export default {
  components: {
    Chapter01,
    Chapter02,
    Chapter03,
    Chapter04, 
    Chapter05
  },
  data() {
    return {
      chapters: ['Chapter01', 'Chapter02', 'Chapter03', 'Chapter04', 'Chapter05'],
      currentChapterIndex: 0,
    };
  },
  methods: {
    previousChapter() {
      if (this.currentChapterIndex > 0) {
        this.currentChapterIndex--;
      }
    },
    nextChapter() {
      if (this.currentChapterIndex < this.chapters.length - 1) {
        this.currentChapterIndex++;
      }
    },
  },
  computed: {
    currentChapter() {
      return this.chapters[this.currentChapterIndex];
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
  height: 80vh;
  width: 80vw; 
  margin: 2rem auto;
  border-radius: 8px;
}

/* temp styling will adjust later */
button {
  margin: 10px;
  padding: 10px 20px;
  font-size: 16px;
  background-color: #777;
  color: black;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  position: absolute;
}

button:hover {
  background-color: #333;
}

.prev-button {
  left: 0;
  transform: translateY(-50%);
  bottom: 5%;
}

.next-button {
  right: 0;
  transform: translateY(-50%);
  bottom: 5%;
}
</style>
