<template>
  <div class="main-layout">
    <CanvasContainer
      ref="canvasContainer"
      @open-current-mode="enterCurrentSlide"
      @change-current-mode="changeCurrentMode" />

    <div v-if="isContainerOpen" ref="mainContainer" class="main-container">
      <div
        ref="mainContainerBackdrop"
        class="backdrop animate__animated animate__faster"></div>

      <button type="button" class="close-button" @click="exitCurrentSlide">
        &times;
      </button>

      <div ref="mainContent" class="main-content animate__animated">
        <MainSlideContainer v-if="currentMode === 0" />

        <QuizContainer v-else-if="currentMode === 1" />

        <GameContainer v-else-if="currentMode === 2" />
      </div>
    </div>
  </div>
</template>

<script>
import CanvasContainer from '@/components/CanvasContainer.vue';
import QuizContainer from '@/components/Quiz/QuizContainer.vue';
import MainSlideContainer from '@/components/Slides/MainSlideContainer.vue';
import GameContainer from '@/components/Game/GameContainer.vue';

export default {
  name: 'MainLayout',

  components: {
    CanvasContainer,
    QuizContainer,
    MainSlideContainer,
    GameContainer,
  },

  data() {
    return {
      currentMode: 1,
      isContainerOpen: false,
    };
  },

  mounted() {
    this.$refs.canvasContainer.toggleWarp(true);
  },

  methods: {
    enterCurrentSlide() {
      return new Promise((resolve) => {
        this.isContainerOpen = true;

        this.$nextTick(() => {
          this.$refs.mainContent.classList.add('animate__fadeInUpBig');
          this.$refs.mainContainerBackdrop.classList.add(
            'animate__fadeIn'
          );

          this.$refs.mainContent.addEventListener(
            'animationend',
            () => {
              this.$refs.mainContent.classList.remove(
                'animate__fadeInUpBig'
              );

              this.$refs.mainContainerBackdrop.classList.remove(
                'animate__fadeIn'
              );

              resolve();
            },
            {
              once: true,
            }
          );
        });
      });
    },

    exitCurrentSlide() {
      return new Promise((resolve) => {
        this.$refs.mainContent.classList.add('animate__fadeOutDownBig');
        this.$refs.mainContainerBackdrop.classList.add('animate__fadeOut');

        this.$refs.mainContent.addEventListener(
          'animationend',
          () => {
            this.$refs.mainContent.classList.remove(
              'animate__fadeOutDownBig'
            );

            this.$refs.mainContainerBackdrop.classList.remove(
              'animate__fadeOut'
            );

            this.isContainerOpen = false;

            resolve();
          },
          {
            once: true,
          }
        );
      });
    },

    changeCurrentMode(mode) {
      this.currentMode = mode;
    },
  },
};
</script>

<style scoped>
.main-layout {
  height: 100vh;
}

.main-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  z-index: 10;
  padding: 40px;
}

.close-button {
  position: absolute;
  top: 15px;
  right: 15px;
  font-size: 2em;
  background: none;
  border: none;
  color: #66fcf1;
  cursor: pointer;
  z-index: 20;
}

.backdrop {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.8);
  z-index: 10;
}

.main-content {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  max-width: 1500px;
  margin: 0 auto;
  background: rgba(0, 0, 0, 0.5);
  border-radius: 15px;
  box-shadow: 0 0 10px #66fcf1;
  z-index: 20;
}
</style>
