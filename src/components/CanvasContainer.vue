<template>
  <div class="canvas-container">
    <canvas ref="canvas"></canvas>
  </div>
</template>

<script>
import * as THREE from 'three';
import { createStars } from '@/3D/starrySky.js';

export default {
  name: 'CanvasContainer',

  mounted() {
    this.initThreeJS();
  },

  beforeUnmount() {
    window.removeEventListener('resize', this.onWindowResize);
  },

  methods: {
    initThreeJS() {
      this.scene = new THREE.Scene();

      this.camera = new THREE.PerspectiveCamera(
        75,
        window.innerWidth / window.innerHeight,
        0.1,
        1000
      );
      this.camera.position.z = 500;

      this.renderer = new THREE.WebGLRenderer({
        canvas: this.$refs.canvas,
      });
      this.renderer.setSize(window.innerWidth, window.innerHeight);

      createStars(this.scene);

      this.animate();

      window.addEventListener('resize', this.onWindowResize);
    },

    animate() {
      requestAnimationFrame(this.animate);

      this.renderer.render(this.scene, this.camera);
      this.scene.children.forEach((child) => {
        if (child instanceof THREE.Points) {
          child.rotation.y += 0.001;
        }
      });
    },

    onWindowResize() {
      this.camera.aspect = window.innerWidth / window.innerHeight;
      this.camera.updateProjectionMatrix();
      this.renderer.setSize(window.innerWidth, window.innerHeight);
    },
  },
};
</script>

<style scoped>
.canvas-container {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.canvas-container canvas {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: -1;
}
</style>
