<template>
  <div class="quiz-question">
    <h2>{{ question.text }}</h2>
    <div class="options">
      <div
        v-for="option in question.options"
        :key="option.text"
        class="option"
        @click="selectOption(option)">
        <button :class="getButtonClass(option)">
          {{ option.text }}
        </button>
      </div>
    </div>
    <button
      v-if="showNextButton"
      class="next-button"
      @click="nextQuestion">
      Next Question
    </button>
  </div>
</template>

<script>
export default {
  name: 'QuizQuestion',
  props: {
    question: {
      type: Object,
      required: true,
    },
  },
  emits: ['answer', 'next'],
  data() {
    return {
      selectedOption: null,
      showNextButton: false,
    };
  },
  methods: {
    selectOption(option) {
      if (!this.selectedOption) {
        this.selectedOption = option;
        this.question.options.forEach((opt) => (opt.selected = false));
        option.selected = true;
        this.showFeedback(option.correct);
        this.$emit('answer', option.correct);
      }
    },
    showFeedback(isCorrect) {
      if (!isCorrect) {
        this.highlightCorrectAnswer();
      }

      this.showNextButton = true;
    },
    highlightCorrectAnswer() {
      this.question.options.forEach((opt) => {
        if (opt.correct) {
          opt.highlight = true;
        }
      });
    },
    nextQuestion() {
      this.selectedOption = null;
      this.showNextButton = false;
      this.question.options.forEach((opt) => {
        opt.selected = false;
        opt.highlight = false;
      });
      this.$emit('next');
    },
    getButtonClass(option) {
      if (this.selectedOption) {
        if (option === this.selectedOption) {
          return option.correct ? 'correct' : 'wrong';
        } else if (option.correct) {
          return 'highlight';
        } else {
          return 'disabled';
        }
      }
      return '';
    },
  },
};
</script>

<style>
.quiz-question {
  text-align: center;
}

.quiz-question h2 {
  margin: 0;
  font-size: 2.2em;
}

.quiz-question .options {
  margin-top: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
}

.quiz-question .option {
  width: 100%;
}

@media (min-width: 768px) {
  .quiz-question .option {
    width: 100%;
  }
}

.quiz-question .option button {
  display: block;
  margin: 10px auto;
  width: 100%;
  text-align: center;
  font-size: 1.2em;
  padding: 15px;
  border: none;
  border-radius: 8px;
  background-color: #1f2833;
  color: #c5c6c7;
  transition:
    background-color 0.3s,
    color 0.3s,
    transform 0.3s;
}

.quiz-question button.correct {
  background-color: #28a745;
  color: #fff;
  transform: scale(1.05);
}

.quiz-question button.correct:hover {
  background-color: #28a745;
}

.quiz-question button.wrong {
  background-color: #dc3545;
  color: #fff;
  animation: shake 0.5s;
}

.quiz-question button.highlight {
  background-color: #28a745;
  color: #fff;
}

.quiz-question button.disabled {
  background-color: #1f2833;
  color: gray;
  pointer-events: none;
}

.quiz-question .next-button {
  background-color: #ff9800;
  color: #fff;
  width: 60%;
  font-size: 1.4em;
  margin-top: 20px;
  padding: 15px;
  border: none;
  border-radius: 25px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  transition:
    background-color 0.3s ease-out,
    transform 0.2s ease-out;
  cursor: pointer;
  margin: 20px auto;
}

.quiz-question .next-button:hover {
  background-color: #fb8c00;
  transform: translateY(-3px);
}

.quiz-question .next-button:active {
  background-color: #ef6c00;
  transform: translateY(0);
}

@keyframes shake {
  0% {
    transform: translateX(0);
  }
  25% {
    transform: translateX(-5px);
  }
  50% {
    transform: translateX(5px);
  }
  75% {
    transform: translateX(-5px);
  }
  100% {
    transform: translateX(0);
  }
}
</style>
