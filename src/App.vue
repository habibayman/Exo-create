<template>
  <div>
    <starry-sky>
      <template #main>
        <main-container></main-container>
      </template>
    </starry-sky>
  </div>
</template>

<script>
import MainContainer from "./components/UI/MainContainer.vue";
import StarrySky from "./components/Views/StarrySky.vue";

export default {
  name: "App",
  components: {
    MainContainer,
    StarrySky,
  },
};
</script>
