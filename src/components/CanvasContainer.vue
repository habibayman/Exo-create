<template>
  <div class="canvas-container">
    <canvas ref="canvas"></canvas>
  </div>

  <div class="flag-container">
    <transition
      appear
      enter-active-class="animate__animated animate__lightSpeedInRight animate__faster"
      leave-active-class="animate__animated animate__bounceOutUp animate__faster"
      mode="out-in">
      <div v-if="showFlagContent">
        <img
          :src="flagsContent[currentPlanet].image"
          alt="Flag"
          class="flag-image" />
        <h1 class="flag-title">
          {{ flagsContent[currentPlanet].title }}
        </h1>
        <h2 class="flag-subtitle">
          {{ flagsContent[currentPlanet].subtitle }}
        </h2>
        <div class="flag-buttons">
          <button
            v-if="currentPlanet > 0"
            class="flag-button"
            @click="toggleWarp(false)">
            Previous Planet
          </button>
          <button class="flag-button" @click="onFlagButtonClick">
            {{ flagsContent[currentPlanet].buttonText }}
          </button>
          <button
            v-if="currentPlanet < 2"
            class="flag-button"
            @click="toggleWarp(true)">
            Next Planet
          </button>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
import * as THREE from 'three';
import gsap from 'gsap';

import { createStars } from '@/3D/starrySky.js';
import { createPlanet } from '@/3D/planet.js';
import warpSound from '@/assets/sounds/warp.mp3';
import learnImage from '@/assets/images/learn.png';
import quizImage from '@/assets/images/quiz.png';
import designImage from '@/assets/images/design.png';

export default {
  name: 'CanvasContainer',

  emits: ['openCurrentMode', 'changeCurrentMode'],

  data() {
    return {
      showFlagContent: false,

      currentPlanet: -1,
    };
  },

  mounted() {
    this.flagsContent = [
      {
        title: 'Exoplanets 101',
        subtitle: 'Learn about exoplanets and how they are discovered.',
        buttonText: 'Start Learning',
        image: learnImage,
      },
      {
        title: 'Quiz Time!',
        subtitle: 'Test your knowledge about exoplanets with a fun quiz.',
        buttonText: 'Start Quiz',
        image: quizImage,
      },
      {
        title: 'Planet Designer',
        subtitle: 'Foster your creativity and design your own exoplanet.',
        buttonText: 'Start Exploring',
        image: designImage,
      },
    ];

    this.initThreeJS();
  },

  beforeUnmount() {
    window.removeEventListener('resize', this.onWindowResize);
  },

  methods: {
    async initThreeJS() {
      this.scene = new THREE.Scene();

      this.camera = new THREE.PerspectiveCamera(
        75,
        window.innerWidth / window.innerHeight,
        0.1,
        800
      );
      this.camera.position.z = 500;
      this.camera.position.y = 200;

      this.renderer = new THREE.WebGLRenderer({
        canvas: this.$refs.canvas,
      });
      this.renderer.setSize(window.innerWidth, window.innerHeight);

      // Create stars
      this.stars = createStars(this.scene);

      // Create planets
      const planet1 = await createPlanet(
        '/assets/3D/planet1.glb',
        0,
        0,
        -550,
        190
      );

      const planet2 = await createPlanet(
        '/assets/3D/planet2.glb',
        0,
        0,
        -1550,
        104
      );

      const planet3 = await createPlanet(
        '/assets/3D/planet3.glb',
        0,
        0,
        -2550,
        94
      );

      this.scene.add(planet1, planet2, planet3);
      this.planets = [planet1, planet2, planet3];

      // Add lighting for the planets
      const light = new THREE.AmbientLight(0xffffff);
      this.scene.add(light);

      this.animate();

      window.addEventListener('resize', this.onWindowResize);
    },

    animate() {
      requestAnimationFrame(this.animate);

      // Move & rotate stars
      const starPositions = this.stars.geometry.attributes.position.array;
      for (let i = 0; i < starPositions.length; i += 3) {
        starPositions[i + 2] += 0.2;

        // Reset star when it passes the camera
        if (
          Math.abs(this.camera.position.z - starPositions[i + 2]) > 900
        ) {
          starPositions[i + 2] = this.camera.position.z - 900;
        }

        // Add a slight parallax effect
        starPositions[i] += Math.sin(i) * 0.01;
        starPositions[i + 1] += Math.cos(i) * 0.01;

        // Add a slight rotation effect
        starPositions[i] += Math.sin(i) * 0.01;
        starPositions[i + 1] += Math.cos(i) * 0.01;
      }
      this.stars.geometry.attributes.position.needsUpdate = true;

      this.renderer.render(this.scene, this.camera);
    },

    onWindowResize() {
      this.camera.aspect = window.innerWidth / window.innerHeight;
      this.camera.updateProjectionMatrix();
      this.renderer.setSize(window.innerWidth, window.innerHeight);
    },

    toggleWarp(forward = true) {
      if (this.currentPlanet === 0) {
        forward = true;
      }

      if (this.currentPlanet === 2) {
        forward = false;
      }

      if (forward) this.currentPlanet++;
      else this.currentPlanet--;

      this.$emit('changeCurrentMode', this.currentPlanet);

      this.showFlagContent = false;
      this.playWarpSound();

      return new Promise((resolve) => {
        // Speed up camera movement for warp effect
        gsap.to(this.camera.position, {
          z: forward ? '-=1000' : '+=1000',
          duration: 4.5,
          ease: 'power2.inOut',
          onComplete: () => {
            this.showFlagContent = true;
            resolve();
          },
        });

        // Speed up stars for a warp effect
        gsap.to(this.stars.geometry.attributes.position.array, {
          z: forward ? '+=800' : '-=800',
          duration: 4,
          ease: 'power2.inOut',
        });

        // Add subtle camera shake for more realism
        gsap.to(this.camera.rotation, {
          x: '+=0.1',
          duration: 0.1,
          yoyo: true,
          repeat: 1,
          ease: 'power1.inOut',
        });
      });
    },

    playWarpSound() {
      const audio = new Audio(warpSound);
      audio.play();
    },

    onFlagButtonClick() {
      this.$emit('openCurrentMode');
    },
  },
};
</script>

<style scoped>
.canvas-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: -1;
}

.canvas-container canvas {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.flag-container {
  position: absolute;
  left: 50%;
  top: 40%;
  transform: translate(-50%, -50%);
  text-align: center;
  color: white;
  z-index: 8;
  padding: 20px;
  width: 100%;
  max-width: 500px;
}

.flag-image {
  width: 100%;
  max-width: 150px;
  margin-bottom: 20px;
}

.flag-title {
  font-size: 24px;
  margin: 0;
  color: #00eaff;
  text-shadow:
    0 0 15px rgba(0, 234, 255, 0.7),
    0 0 20px rgba(0, 234, 255, 0.6);
}

.flag-subtitle {
  font-size: 18px;
  margin-top: 10px;
  color: #00eaff;
  text-shadow:
    0 0 15px rgba(0, 234, 255, 0.7),
    0 0 20px rgba(0, 234, 255, 0.6);
}

.flag-buttons {
  margin-top: 20px;
  display: flex;
  justify-content: center;
  gap: 20px;
  flex-direction: column;
}

.flag-button {
  background-color: rgba(255, 255, 255, 0.1);
  border: 1px solid #00eaff;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  font-size: 15px;
  color: #00eaff;
  transition:
    background-color 0.3s,
    box-shadow 0.3s;
  font-weight: bold;
}

.flag-button:hover {
  background-color: rgba(255, 255, 255, 1);
}

@media (min-width: 768px) {
  .flag-buttons {
    flex-direction: row;
  }

  .flag-container {
    max-width: 800px;
  }

  .flag-title {
    font-size: 32px;
  }

  .flag-subtitle {
    font-size: 24px;
  }

  .flag-button {
    font-size: 18px;
  }
}
</style>
