import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js';

const loader = new GLTFLoader();

export async function createPlanet(modelPath, x, y, z, scale) {
  return new Promise((resolve, reject) => {
    loader.load(
      modelPath,
      (gltf) => {
        const planet = gltf.scene;

        planet.position.set(x, y, z);
        planet.scale.set(scale, scale, scale);

        resolve(planet);
      },
      undefined,
      (error) => {
        console.error('Error loading model:', error);
        reject(error);
      }
    );
  });
}
