<template>
  <div class="quiz-result">
    <h2>You scored {{ score }} out of {{ total }}</h2>
    <button @click="$emit('restart')">Restart Quiz</button>
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
  emits: ['restart'],
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
</style>
