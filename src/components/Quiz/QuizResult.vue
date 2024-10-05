<template>
  <div class="quiz-result">
    <h2>You scored {{ score }} out of {{ total }}</h2>
    <div class="button-group">
      <button @click="$emit('restart')">Restart Quiz</button>
      <button @click="$emit('goToGame')">Go to Game</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'QuizResult',
  props: {
    score: {
      type: Number,
      required: true,
    },
    total: {
      type: Number,
      required: true,
    },
  },
  emits: ['restart', 'goToGame'],
};
</script>

<style>
.quiz-result h2 {
  font-size: 2.2em;
}

.quiz-result button {
  font-size: 1.2em;
  padding: 15px;
}

.quiz-result .button-group {
  display: flex;
  justify-content: center;
  margin-top: 20px;
  flex-wrap: wrap;
  gap: 10px;
}
</style>
