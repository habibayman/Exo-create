<script setup>
import { useTexture } from "@tresjs/core";
import Planet from "./Planet.vue";

const planetsTextures = [
    await useTexture({
        map: "/assets/textures/IcePlanet/diffuse.png",
        bumpMap: "/assets/textures/IcePlanet/bump.png",
        roughnessMap: "/assets/textures/IcePlanet/roughness.png",
        displacementMap: "/assets/textures/IcePlanet/elevation.png",
        emissiveMap: "/assets/textures/IcePlanet/lightUrban.png",
    }),

    await useTexture({
        map: "/assets/textures/ExoticPlanet/diffuse.png",
        bumpMap: "/assets/textures/ExoticPlanet/bump.png",
        roughnessMap: "/assets/textures/ExoticPlanet/roughness.png",
        displacementMap: "/assets/textures/ExoticPlanet/elevation.png",
        emissiveMap: "/assets/textures/ExoticPlanet/lightUrban.png",
    }),
];
</script>

<template>
    <Planet v-for="(texture, index) in planetsTextures" :key="index" :texture="texture" :index="index" />
</template>
