<template>
  <div class="quiz-container">
    <div class="quiz-background">
      <QuizBackground />
    </div>

    <div ref="rocket" class="quiz-rocket">
      <QuizRocket />
    </div>

    <div class="quiz-content">
      <div
        v-if="currentIndex < questions.length && !showIntro"
        class="progress-dash">
        <div
          v-for="(question, index) in questions"
          :key="index"
          class="dash"
          :class="{ active: index === currentIndex }"></div>
      </div>

      <transition name="fade" mode="out-in">
        <div v-if="showIntro" key="intro">
          <div class="intro-message">
            <h2>Welcome to the Exoplanet Quiz!</h2>
            <p>
              Test your knowledge about exoplanets and learn about the
              fascinating discoveries beyond our solar system.
            </p>
            <button @click="startQuiz">Start Quiz</button>
          </div>
        </div>

        <div
          v-else-if="currentIndex < questions.length"
          key="question"
          ref="question"
          class="question-content">
          <QuizQuestion
            :class="{}"
            :question="questions[currentIndex]"
            @answer="processAnswer"
            @next="nextQuestion" />
        </div>

        <div v-else key="result">
          <QuizResult
            :score="score"
            :total="questions.length"
            @restart="restartQuiz" />
        </div>
      </transition>
    </div>
  </div>
</template>

<script>
import QuizBackground from '@/components/Quiz/QuizBackground.vue';
import QuizRocket from '@/components/Quiz/QuizRocket.vue';
import QuizQuestion from '@/components/Quiz/QuizQuestion.vue';
import QuizResult from '@/components/Quiz/QuizResult.vue';
import quizQuestions from '@/data/quizQuestions';

import showQuestionSound from '@/assets/sounds/show-question.mp3';
import correctSound from '@/assets/sounds/correct.mp3';
import wrongSound from '@/assets/sounds/wrong.mp3';
import finishSound from '@/assets/sounds/finish.mp3';

export default {
  name: 'QuizContainer',
  components: {
    QuizBackground,
    QuizRocket,
    QuizQuestion,
    QuizResult,
  },
  data() {
    return {
      showIntro: true,
      questions: quizQuestions,
      currentIndex: 0,
      score: 0,
      nextQuestionTransition: false,
    };
  },
  methods: {
    startQuiz() {
      this.showIntro = false;
      this.playSound('show-question');
    },
    processAnswer(correct) {
      if (correct) {
        this.playSound('correct');
        this.score++;
      } else {
        this.playSound('wrong');
      }
    },
    nextQuestion() {
      if (this.currentIndex + 1 >= this.questions.length) {
        this.currentIndex++;
        this.currentIndex = this.questions.length;
        this.playSound('finish');
      } else {
        this.$refs.rocket.classList.add('active');

        setTimeout(() => {
          this.playSound('show-question');
          this.$refs.question.classList.add('fade-out');
        }, 200);

        setTimeout(() => {
          this.$refs.question.classList.remove('fade-out');
          this.currentIndex++;
        }, 750);

        setTimeout(() => {
          this.$refs.rocket.classList.remove('active');
        }, 1300);
      }
    },
    restartQuiz() {
      this.currentIndex = 0;
      this.score = 0;
      this.showIntro = true;
    },
    playSound(effect) {
      let audio;
      switch (effect) {
        case 'show-question':
          audio = new Audio(showQuestionSound);
          break;
        case 'correct':
          audio = new Audio(correctSound);
          break;
        case 'wrong':
          audio = new Audio(wrongSound);
          break;
        case 'finish':
          audio = new Audio(finishSound);
          break;
      }
      audio.play();
    },
  },
};
</script>

<style>
.quiz-container a {
  color: #66fcf1;
  text-decoration: none;
}

.quiz-container button {
  background-color: #1f2833;
  color: #c5c6c7;
  border: none;
  padding: 12px 24px;
  margin: 10px 0;
  font-size: 1.2em;
  border-radius: 8px;
  cursor: pointer;
  transition: background-color 0.3s;
  position: relative;
  overflow: hidden;
}

.quiz-container button:hover {
  background-color: #66fcf1;
  color: #0b0c10;
}

.quiz-container h2 {
  color: #66fcf1;
  font-size: 2.5em;
}

.quiz-container h3 {
  color: #66fcf1;
  font-size: 2em;
  margin-top: 20px;
}

.quiz-container p,
.quiz-container li {
  font-size: 1.2em;
  line-height: 1.6em;
}

.quiz-container {
  text-align: center;
  background: rgba(0, 0, 0, 0.5);
  border-radius: 15px;
  box-shadow: 0 0 10px #66fcf1;
  transition: all 0.3s ease-out;
  font-size: 1.2em;
  overflow: hidden;
  position: relative;
  padding: 30px;
  width: 100%;
}

@media (min-width: 768px) {
  .quiz-container {
    padding: 45px;
  }
}

.quiz-background {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
  z-index: 0;
  filter: blur(2px);
}

.quiz-rocket {
  position: absolute;
  left: -100%;
  transform: rotate(45deg) scale(1.8);
  z-index: 5;
}

.quiz-rocket.active {
  animation: moveRocket 1.3s ease-in-out forwards;
}

@keyframes moveRocket {
  0% {
    bottom: 0;
    left: 0;
    transform: translate(0%, 0%) rotate(45deg);
  }

  25% {
    transform: translate(-25%, -25%) rotate(35deg);
  }

  50% {
    transform: translate(-50%, -50%) rotate(55deg);
  }

  75% {
    transform: translate(-75%, -75%) rotate(65deg);
  }

  100% {
    bottom: 150%;
    left: 150%;
    transform: translate(-100%, -100%) rotate(45deg);
  }
}

.quiz-content {
  position: relative;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.question-content {
  position: relative;
  z-index: 1;
  transition: all 0.75s;
  opacity: 1;
}

.question-content.fade-out {
  opacity: 0;
}

.progress-dash {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}

.dash {
  width: 20px;
  height: 10px;
  background-color: #1f2833;
  margin: 0 5px;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}

.dash.active {
  background-color: #66fcf1;
}
</style>
