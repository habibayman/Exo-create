<template>
  <div class="game-container">
    <div class="canvas-container">
      <canvas ref="canvasElement"></canvas>
    </div>

    <div class="game-content-container" @input="onSliderInputHandler">
      <div class="slider-row">
        <label for="slider1">Water Color</label>
        <input
          id="slider1"
          type="range"
          class="uWaterColor"
          min="0"
          max="100"
          value="0" />
      </div>

      <div class="slider-row">
        <label for="slider2">Temperature</label>
        <input
          id="slider2"
          type="range"
          class="uTemperature"
          min="-50"
          max="100"
          value="-35" />
      </div>
      <div class="slider-row">
        <label for="slider3">Land Percentage</label>
        <input
          id="slider3"
          type="range"
          class="uLandPercentage"
          min="0"
          max="65"
          value="34" />
      </div>
    </div>
  </div>
</template>

<script>
import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import vertexShader from '@/assets/shaders/vertex.glsl';
import fragmentShader from '@/assets/shaders/fragment.glsl';

export default {
  name: 'GameContainer',

  mounted() {
    this.initThreeJS();
  },

  methods: {
    initThreeJS() {
      // Scene
      this.scene = new THREE.Scene();

      // Camera
      this.camera = new THREE.PerspectiveCamera(
        75,
        this.$refs.canvasElement.clientWidth /
          this.$refs.canvasElement.clientHeight,
        0.1,
        1000
      );
      if (window.innerWidth < 768) {
        this.camera.position.z = 9;
      } else {
        this.camera.position.z = 12;
      }

      // Renderer
      this.renderer = new THREE.WebGLRenderer({
        canvas: this.$refs.canvasElement,
        alpha: true,
      });
      this.renderer.setSize(
        this.$refs.canvasElement.clientWidth,
        this.$refs.canvasElement.clientHeight,
        false
      );
      this.renderer.setPixelRatio(window.devicePixelRatio);

      // Controls
      const controls = new OrbitControls(
        this.camera,
        this.renderer.domElement
      );
      controls.enableDamping = true;
      controls.maxDistance = this.camera.position.z;
      controls.minDistance = this.camera.position.z;

      // Main Sphere
      this.material = {
        vertexShader,
        fragmentShader,
        uniforms: {
          uTime: { value: 0 },
          uTemperature: { value: -0.4375 },
          uMountainHeight: { value: 0.5 },
          uLandPercentage: { value: 1 },
          uWaterColor: { value: 0.0 },
          uLightDirection: {
            value: new THREE.Vector3(0.5, 1.0, 0.5).normalize(),
          },
        },
      };

      const sphereGeometry = new THREE.SphereGeometry(5, 64, 64);
      this.sphereMaterial = new THREE.ShaderMaterial(this.material);
      this.sphere = new THREE.Mesh(sphereGeometry, this.sphereMaterial);
      this.scene.add(this.sphere);

      // Clock
      this.clock = new THREE.Clock();

      this.animate();

      window.addEventListener('resize', this.onWindowResize);
    },

    animate() {
      requestAnimationFrame(this.animate);

      const elapsedTime = this.clock.getElapsedTime();
      this.sphere.rotation.y = elapsedTime * 0.1;
      this.sphere.rotation.z = elapsedTime * 0.1;

      this.renderer.render(this.scene, this.camera);
    },

    onWindowResize() {
      this.camera.aspect =
        this.$refs.canvasElement.clientWidth /
        this.$refs.canvasElement.clientHeight;

      this.renderer.setSize(
        this.$refs.canvasElement.clientWidth,
        this.$refs.canvasElement.clientHeight,
        false
      );

      if (window.innerWidth < 768) {
        this.camera.position.z = 9;
      } else {
        this.camera.position.z = 12;
      }

      this.camera.updateProjectionMatrix();
    },

    onSliderInputHandler(e) {
      const value = e.target.value;

      if (
        e.target.classList[0] === 'uWaterColor' ||
        e.target.classList[0] === 'uTemperature'
      ) {
        this.sphereMaterial.uniforms[e.target.classList[0]].value =
          value / 80;
      } else {
        this.material.uniforms[e.target.classList[0]].value =
          value / 100 + 0.66;
      }
    },
  },
};
</script>

<style>
.game-container {
  position: relative;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: row;
  gap: 20px;
}

.game-container .canvas-container {
  width: 66.666%;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}

.game-container canvas {
  width: 100%;
  height: 100%;
  max-height: 800px;
}

.game-content-container {
  width: 33.333%;
  display: flex;
  flex-direction: column;
  gap: 30px;
  justify-content: center;
  align-items: center;
}

.slider-row {
  display: flex;
  flex-direction: column;
  gap: 15px;
  width: 100%;
}

.slider-row label {
  text-align: center;
  font-size: 22px;
  color: #66fcf1;
  text-shadow:
    0 0 15px rgba(0, 234, 255, 0.7),
    0 0 20px rgba(0, 234, 255, 0.6);
}

@media (max-width: 768px) {
  .game-container {
    flex-direction: column;
  }

  .game-container canvas {
    width: 100%;
    height: 50%;
  }

  .game-content-container {
    width: 100%;
    height: 50%;
  }
}
</style>
