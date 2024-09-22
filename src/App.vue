<script setup>
import { PCFSoftShadowMap, SRGBColorSpace } from "three";
import { Suspense } from "vue";
import { TresCanvas } from "@tresjs/core";
import { OrbitControls } from "@tresjs/cientos";
import Planet from "./components/Planet.vue";
import { Stars } from "@tresjs/cientos";

const gl = {
  clearColor: "#11101B",
  shadows: true,
  alpha: false,
  outputColorSpace: SRGBColorSpace,
  shadowMapType: PCFSoftShadowMap,
};
</script>

<template>
  <TresCanvas v-bind="gl" window-size>
    <TresPerspectiveCamera
      :position="[0, 1, 5]"
      :fov="75"
      :near="0.1"
      :far="1000"
    />

    <OrbitControls />

    <TresAmbientLight color="#484068" :intensity="1" />

    <Suspense>
      <Planet />
    </Suspense>

    <Stars />

    <TresPointLight
      color="#1BFFEF"
      :position="[0, 0, -8]"
      :intensity="80"
      cast-shadow
    />

    <TresDirectionalLight
      :position="[0, 2, 4]"
      :intensity="3"
      cast-shadow
      :shadow-mapSize-width="2048"
      :shadow-mapSize-height="2048"
    />
  </TresCanvas>
</template>
