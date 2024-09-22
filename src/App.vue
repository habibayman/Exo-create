<script setup>
import { Suspense } from "vue";
import { TresCanvas } from "@tresjs/core";
import { OrbitControls, Stars } from "@tresjs/cientos";
import { PCFSoftShadowMap, SRGBColorSpace } from "three";
import Planets from "./components/Planets.vue";

const gl = {
    clearColor: "#00000e",
    shadows: true,
    alpha: false,
    outputColorSpace: SRGBColorSpace,
    shadowMapType: PCFSoftShadowMap,
};
</script>

<template>
    <TresCanvas v-bind="gl" window-size>
        <TresPerspectiveCamera :position="[0, 1, 5]" :fov="75" :near="0.1" :far="1000" />

        <OrbitControls />

        <TresAmbientLight color="#484068" :intensity="1" />

        <Suspense>
            <Planets />
        </Suspense>

        <Stars :radius="50" :depth="50" :count="5000" :size="0.3" :size-attenuation="true" />

        <TresPointLight color="#1BFFEF" :position="[0, 0, -8]" :intensity="80" cast-shadow />

        <TresDirectionalLight :position="[0, 2, 4]" :intensity="3" cast-shadow :shadow-mapSize-width="2048" :shadow-mapSize-height="2048" />
    </TresCanvas>
</template>
