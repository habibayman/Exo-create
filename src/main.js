import { createApp } from "vue";
import "./style.css";

import App from "./App.vue";
import StarrySky from "./components/Views/StarrySky.vue";

const app = createApp(App);
app.component("starry-sky", StarrySky);

app.mount("#app");
