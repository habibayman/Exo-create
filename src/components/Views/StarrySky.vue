<template>
  <div class="starry-sky">
    <canvas class="threejs" />

    <div class="main-container">
      <slot name="main" />
    </div>

    <!-- <div class="navs-container">
			<slot name="navs"></slot>
		</div> -->
  </div>
</template>

<script>
import * as THREE from 'three';

export default {
  name: 'StarrySky',

  mounted() {
    this.initThreeJS();
    window.addEventListener('resize', this.onWindowResize);
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

      const canvas = this.$el.querySelector('.threejs');
      this.renderer = new THREE.WebGLRenderer({ canvas });
      this.renderer.setSize(window.innerWidth, window.innerHeight);

      this.createStars();
      this.animate();
    },

    createStars() {
      const starGeometry = new THREE.BufferGeometry();
      const starMaterial = new THREE.PointsMaterial({ color: 0xffffff });

      const starVertices = [];
      for (let i = 0; i < 10000; i++) {
        const x = THREE.MathUtils.randFloatSpread(2000);
        const y = THREE.MathUtils.randFloatSpread(2000);
        const z = THREE.MathUtils.randFloatSpread(2000);
        starVertices.push(x, y, z);
      }

      starGeometry.setAttribute(
        'position',
        new THREE.Float32BufferAttribute(starVertices, 3)
      );

      const stars = new THREE.Points(starGeometry, starMaterial);
      this.scene.add(stars);
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
html,
body {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.starry-sky {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

canvas {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: -90;
}

.main-container {
  position: relative;
  z-index: 1;
  width: 100%;
  min-height: 200vh; /* Example height to make the page scrollable */
}
</style>
