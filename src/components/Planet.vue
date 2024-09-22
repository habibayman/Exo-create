<script setup>
import { useRenderLoop } from "@tresjs/core";
import { ref } from "vue";

const props = defineProps({
    texture: {
        required: true,
    },
    index: {
        required: true,
    },
});

const { resume, onLoop } = useRenderLoop();
const planet = ref(null);

onLoop(({ delta }) => {
    if (!planet.value) return;

    planet.value.rotation.x += delta * 0.04;
    planet.value.rotation.y += delta * 0.02;
    planet.value.rotation.z += delta * 0.05;
});
</script>

<template>
    <TresMesh :ref="planet" :position="[(index - 2) * 3, 0, 0]">
        <TresSphereGeometry :args="[1, 100, 100]" />
        <TresMeshStandardMaterial v-bind="texture" displacement-scale="0.2" bump-scale="0.1" />
    </TresMesh>
</template>
