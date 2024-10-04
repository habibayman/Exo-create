import * as THREE from "three";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls.js";
import vertexShader from "./vertex.glsl";
import fragmentShader from "./fragment.glsl";
import { log } from "three/src/Three.WebGPU.js";

const textureLoader = new THREE.TextureLoader();
const normalMap = textureLoader.load("TCom_Ground_Soil3_header.jpg");
const canvas = document.getElementById("canva");
const canvasContainer = document.querySelector(".canvas-container");
const waterColor = document.querySelector(".slider-waterColor");
const sliderContainer = document.querySelector(".sliders-container");

const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(
  75,
  canvasContainer.clientWidth / canvasContainer.clientHeight,
  0.1,
  1000
);
camera.position.z = 13;

const controls = new OrbitControls(camera, canvas);
controls.enableDamping = true;
controls.maxDistance = 200;
controls.minDistance = 10;
const material = {
  vertexShader,
  fragmentShader,
  uniforms: {
    uTime: { value: 0 },
    uTemperature: { value: -0.4375 },
    uMountainHeight: { value: 0.5 },
    uLandPercentage: { value: 1 },
    uWaterColor: { value: 0.0 },
    uLightDirection: { value: new THREE.Vector3(0.5, 1.0, 0.5).normalize() },
  },
};
const sphereGeometry = new THREE.SphereGeometry(5, 64, 64);
const sphereMaterial = new THREE.ShaderMaterial(material);
const sphere = new THREE.Mesh(sphereGeometry, sphereMaterial);
scene.add(sphere);

const renderer = new THREE.WebGLRenderer({ canvas, antialias: true });
renderer.setSize(canvasContainer.clientWidth, canvasContainer.clientHeight);
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

window.addEventListener("resize", () => {
  renderer.setSize(canvasContainer.clientWidth, canvasContainer.clientHeight);
  camera.aspect = canvasContainer.clientWidth / canvasContainer.clientHeight;

  camera.updateProjectionMatrix();
});
const clock = new THREE.Clock();
function animate() {
  const elapsedTime = clock.getElapsedTime();
  //sphereMaterial.uniforms.uContinentScale.value = Math.sin(elapsedTime * 0.5);
  //sphereMaterial.uniforms.uMountainHeight.value = Math.sin(elapsedTime * 0.5);
  //sphereMaterial.uniforms.uTemperature.value = Math.sin(elapsedTime);
  //sphereMaterial.uniforms.uTemperature.value = Math.sin(elapsedTime) + 0.5;
  //sphereMaterial.uniforms.uWaterColor.value = Math.cos(elapsedTime) + 0.5;
  //sphereMaterial.uniforms.uLandPercentage.value = Math.sin(elapsedTime) + 0.5;
  sphere.rotation.y = elapsedTime * 0.1;
  sphere.rotation.z = elapsedTime * 0.1;
  controls.update();
  renderer.render(scene, camera);
  window.requestAnimationFrame(animate);
}

animate();

sliderContainer.addEventListener("input", function (e) {
  const value = e.target.value;
  console.log(value / 80);
  console.log(value);
  if (
    e.target.classList[0] === "uWaterColor" ||
    e.target.classList[0] === "uTemperature"
  ) {
    sphereMaterial.uniforms[e.target.classList[0]].value = value / 80;
  } else {
    material.uniforms[e.target.classList[0]].value = value / 100 + 0.66;
  }
  console.log(value / 80);
});
