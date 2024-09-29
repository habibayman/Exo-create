<template>
  <div class="g-container">
    <div class="g-group">
      <div class="item item-right"></div>
      <div class="item item-left"></div>
      <div class="item item-top"></div>
      <div class="item item-bottom"></div>
      <div class="item item-middle"></div>
    </div>
    <div class="g-group">
      <div class="item item-right"></div>
      <div class="item item-left"></div>
      <div class="item item-top"></div>
      <div class="item item-bottom"></div>
      <div class="item item-middle"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'QuizBackground',
};
</script>

<style scoped>
.g-container {
  margin: auto;
  perspective: 2px;
  perspective-origin: 50% 50%;
  position: relative;
  animation: hueRotate 20s infinite linear;
}

.g-group {
  position: absolute;
  width: 1000px;
  height: 1000px;
  left: -500px;
  top: -500px;
  transform-style: preserve-3d;
  animation: move 8s infinite linear;
}

.g-group:nth-child(2) {
  animation: move 8s infinite linear;
  animation-delay: -4s;
}

.item {
  position: absolute;
  width: 100%;
  height: 100%;
  background: #000;
  background-size: cover;
  opacity: 1;
  animation: fade 8s infinite linear;
  animation-delay: 0;
}

.item::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  width: 1px;
  height: 1px;
  border-radius: 50%;
  box-shadow:
    0 0 0 0 #0771c1,
    47.23vw 64.73vh 0 1px #b42ade,
    60.26vw 89.74vh 0 2px #5b5b25,
    20.07vw 93.51vh 0 3px #9ad24b,
    19.63vw 79.97vh 0 2px #d16bab,
    75.1vw 38.33vh 0 1px #5b8d93,
    1.54vw 91.06vh 0 3px #f75613,
    33.99vw 65.57vh 0 2px #b15b49,
    33.1vw 79.87vh 0 5px #238962,
    4.54vw 58.83vh 0 4px #3f0a7c,
    73.59vw 50.49vh 0 3px #8bcfaf,
    19.33vw 45.82vh 0 2px #0589f3,
    63.03vw 19.37vh 0 4px #0ae9a2,
    41.29vw 65.6vh 0 4px #b1d63e,
    6.84vw 91.17vh 0 3px #e6600d,
    79.96vw 49.71vh 0 4px #f1f7fe,
    28.01vw 42.14vh 0 4px #155b44,
    52.42vw 68.19vh 0 2px #9bb5bd,
    93.33vw 60.56vh 0 1px #debe8a,
    81.22vw 87.28vh 0 3px #b19955,
    41.21vw 9.05vh 0 5px #7c2b41,
    40.86vw 13.73vh 0 4px #aba6cd,
    38.03vw 57.75vh 0 1px #9ee27f,
    74.7vw 53.81vh 0 2px #b5a580,
    79.64vw 11.82vh 0 3px #6c296f,
    18.42vw 32.01vh 0 3px #967d7a,
    49.03vw 34.17vh 0 1px #49ee5f,
    99.5vw 85.14vh 0 2px #61c320,
    50.31vw 26.6vh 0 2px #032eff,
    83.92vw 79.83vh 0 1px #eef521,
    68.09vw 40.54vh 0 1px #be7fb6,
    87.07vw 65.05vh 0 4px #617c69,
    38.9vw 84.65vh 0 5px #b21862,
    50.25vw 21.32vh 0 5px #a48dcd,
    32.52vw 67.13vh 0 3px #aede21,
    22.4vw 90.62vh 0 3px #4a81fa,
    15.17vw 35.24vh 0 4px #d3ef77,
    14.06vw 40.58vh 0 1px #c525b2,
    94.62vw 36.19vh 0 5px #d1e4c0,
    66.44vw 24.04vh 0 5px #944116,
    48.73vw 11.98vh 0 2px #22f620,
    56.49vw 37.49vh 0 5px #1fba08,
    47.77vw 96.98vh 0 4px #973794,
    63.5vw 27.89vh 0 4px #555417,
    12.08vw 90.12vh 0 2px #d4ba79,
    94.02vw 3.27vh 0 5px #05e356,
    75.21vw 29.71vh 0 5px #38b8e0,
    78.93vw 74.35vh 0 3px #473c7e,
    86.69vw 67.83vh 0 1px #239f60,
    35.61vw 51.42vh 0 3px #0e4a7e,
    3.46vw 71.1vh 0 3px #5c912c,
    75.21vw 19.57vh 0 3px #2e2229,
    6.67vw 51.64vh 0 2px #d46860,
    11.47vw 98.29vh 0 3px #25b9fc,
    79.66vw 65.44vh 0 1px #e0efbf,
    41.83vw 98.95vh 0 3px #197471,
    1.25vw 57.46vh 0 1px #52ac2c,
    72.42vw 88.13vh 0 4px #7dcbb0,
    3.83vw 89.24vh 0 1px #e2508a,
    80.45vw 13.38vh 0 2px #598550,
    99.92vw 24.88vh 0 2px #13644e,
    38.13vw 53.42vh 0 3px #e6245a,
    43.67vw 52.73vh 0 1px #0f4474,
    96.73vw 15.46vh 0 3px #2a05cb,
    71.57vw 36.51vh 0 1px #4a4218,
    99.3vw 24.91vh 0 2px #d4fb6a,
    76.67vw 8.8vh 0 2px #4ba95a,
    93.48vw 57.27vh 0 5px #8cfeee,
    15.71vw 66.33vh 0 5px #cf85e5,
    3.04vw 34.47vh 0 3px #7fd20d,
    23.63vw 51.53vh 0 3px #7773c8,
    55.88vw 68.57vh 0 1px #327ed3,
    50.13vw 13.57vh 0 3px #fcdd28,
    51.6vw 97.76vh 0 1px #a90e7e,
    75vw 78.13vh 0 2px #f7ff65,
    10.69vw 81.83vh 0 5px #6d1d15,
    74.95vw 60.04vh 0 4px #36364f,
    93.16vw 32.88vh 0 5px #e36058,
    77.22vw 88.76vh 0 4px #1aa7a7,
    82.89vw 3.95vh 0 5px #355f38,
    49.76vw 11.68vh 0 3px #9b3424,
    42.57vw 22.16vh 0 3px #d269f4,
    3.18vw 73.16vh 0 2px #9fe375,
    17.06vw 73.33vh 0 2px #27b094,
    94.86vw 40.74vh 0 4px #c696c1,
    49.87vw 43.23vh 0 4px #56fb61,
    38.46vw 88.21vh 0 3px #058446,
    34.21vw 5.44vh 0 2px #3f1d05,
    47.77vw 47.25vh 0 4px #8b2bfd,
    80.6vw 79.43vh 0 1px #b2d9c0,
    18.78vw 66.21vh 0 4px #b9504d,
    4.87vw 54.96vh 0 2px #b524c5,
    63.14vw 21.34vh 0 1px #b758b9,
    41.73vw 5.81vh 0 2px #69d89d,
    88.61vw 20.74vh 0 4px #9ba8f0,
    17.12vw 97.17vh 0 2px #9f10bc,
    22.67vw 91.17vh 0 1px #7d1635,
    92.96vw 21.35vh 0 3px #e36e56,
    13.95vw 28.77vh 0 1px #53ac21,
    29.19vw 79.17vh 0 4px #c99586,
    66.55vw 46.03vh 0 5px #fe1fb9,
    47.25vw 50.92vh 0 4px #274388,
    51.8vw 28.62vh 0 4px #8129cf,
    53.6vw 5.25vh 0 4px #91b67b,
    40.43vw 68.22vh 0 2px #69d545,
    4.1vw 40.02vh 0 3px #c41314,
    85.79vw 67.48vh 0 3px #847b62,
    47.64vw 43.86vh 0 5px #b81bb3,
    94.93vw 88.3vh 0 2px #79faa8,
    18.18vw 56.19vh 0 5px #6eb421,
    8.06vw 86.17vh 0 4px #c5e7a7,
    83.58vw 22.26vh 0 3px #db7b1b,
    94.6vw 11.69vh 0 1px #f08ac6,
    67.85vw 91.51vh 0 1px #86f004,
    78.96vw 54.75vh 0 1px #603e16,
    60.29vw 68.87vh 0 3px #1b9da4,
    45.17vw 51.16vh 0 2px #965b12,
    20.82vw 94.57vh 0 2px #adba3c,
    76.22vw 67.45vh 0 4px #fe6577,
    36.83vw 87.06vh 0 1px #7cc0f9,
    25.75vw 80.64vh 0 3px #1cc257,
    31.53vw 91.82vh 0 1px #ed307a,
    56.97vw 49.28vh 0 5px #46886c,
    79.13vw 76.65vh 0 3px #b27307,
    67.69vw 16.43vh 0 3px #c2e782,
    99.77vw 17.15vh 0 2px #73cb16,
    90.75vw 50.98vh 0 4px #3bb784,
    0.36vw 67.32vh 0 4px #343f5a,
    22.56vw 14.02vh 0 1px #64f6cd,
    55.95vw 68.63vh 0 2px #804432,
    46.48vw 13.08vh 0 1px #bc5d47,
    25.82vw 56.44vh 0 3px #68b0f9,
    98.49vw 98.74vh 0 2px #aab7a8,
    69.66vw 99.52vh 0 4px #408ae4,
    34.15vw 49.61vh 0 3px #78420c,
    15.57vw 38.77vh 0 1px #43f616,
    52.85vw 60.94vh 0 3px #60420a,
    28.96vw 11.34vh 0 2px #7bc266,
    25.9vw 87.12vh 0 5px #c1f064,
    53.19vw 64.38vh 0 4px #d9c6d4,
    81.81vw 9.98vh 0 4px #961474,
    68.93vw 70.58vh 0 3px #58ceb7,
    46.76vw 73.04vh 0 3px #21a135,
    6.48vw 44.26vh 0 3px #9c8384,
    98.18vw 11.84vh 0 3px #e6c165,
    31.08vw 82.6vh 0 2px #405325,
    5.56vw 1.85vh 0 5px #5a5cab,
    46.88vw 34.28vh 0 3px #8e6bc5,
    68.42vw 35.29vh 0 4px #4752f9,
    98.48vw 33.01vh 0 3px #262fc1,
    63.29vw 47.37vh 0 4px #64b8ba,
    50.02vw 68.65vh 0 5px #61e754,
    17.54vw 52.84vh 0 3px #33e41f,
    95.41vw 54.96vh 0 1px #a9828a,
    27.29vw 63.51vh 0 1px #132fc1,
    38.44vw 87.24vh 0 3px #e5aefc,
    27.72vw 96.07vh 0 3px #479f14,
    40.04vw 12.1vh 0 4px #a441e3,
    29.63vw 66.42vh 0 5px #06501f,
    38.14vw 24.04vh 0 2px #91e5ed,
    89.17vw 22.08vh 0 2px #224490,
    98.69vw 32.51vh 0 2px #51b6fc,
    35.51vw 67.63vh 0 5px #1d6009,
    87.82vw 67.39vh 0 5px #24c05d,
    45.86vw 42.03vh 0 3px #995143,
    47.71vw 49.45vh 0 5px #17d4dd,
    14.19vw 90.05vh 0 4px #7caba9,
    42.4vw 6.54vh 0 2px #ba5125,
    80.1vw 28.29vh 0 3px #0c116e,
    90.75vw 46.64vh 0 1px #c3513c,
    43.36vw 44.2vh 0 2px #d95225,
    53.7vw 66.29vh 0 3px #4759fa,
    75.49vw 77.06vh 0 1px #c82832,
    90.42vw 97.07vh 0 4px #c64acf,
    38.74vw 70.86vh 0 5px #66c71a,
    84.68vw 61.17vh 0 4px #b37fb1,
    47.78vw 43.8vh 0 3px #f01aae,
    61.71vw 81.49vh 0 2px #06428a,
    52.81vw 77.95vh 0 1px #2a804e,
    7.25vw 42.02vh 0 3px #796dc4,
    70.28vw 68.92vh 0 5px #3daf8b,
    95.78vw 75.47vh 0 4px #7025e6,
    2.02vw 94.4vh 0 2px #4899d8,
    36.27vw 81.13vh 0 1px #a6f709,
    89.26vw 90.26vh 0 5px #75a330,
    2.59vw 40.43vh 0 2px #680db2,
    55.68vw 49.93vh 0 1px #ba30c1,
    53.64vw 44.13vh 0 1px #9c7d58,
    66.79vw 35.36vh 0 1px #ceafd5,
    44.87vw 47.67vh 0 4px #3a567b,
    4.54vw 86.64vh 0 2px #95f3e0,
    35.2vw 62.83vh 0 1px #ba0489,
    13.63vw 67.09vh 0 1px #c85f5d,
    57.86vw 64.98vh 0 3px #37d525,
    6.83vw 73.36vh 0 1px #1829db,
    30.23vw 1.17vh 0 2px #a8e817,
    42.97vw 87.93vh 0 2px #fd2487,
    57.8vw 82.88vh 0 1px #7855db,
    95.55vw 90.89vh 0 4px #c404c5,
    84.33vw 67.49vh 0 4px #1499db,
    63.7vw 88.96vh 0 2px #4cbf04,
    31.86vw 85.47vh 0 3px #335b1a,
    68.3vw 83.49vh 0 5px #a6d4ad,
    69.54vw 26.27vh 0 5px #ea1bb7,
    2.7vw 14.03vh 0 3px #1d68fc,
    35.98vw 93.84vh 0 2px #be6cdb,
    59.26vw 85.52vh 0 3px #d72d0e,
    22.38vw 26.48vh 0 4px #19eabe,
    67.72vw 20.84vh 0 3px #77d9b7,
    5.5vw 44.27vh 0 3px #6eb5a2,
    30.02vw 31.71vh 0 5px #125c81,
    96.47vw 78.4vh 0 2px #7a233d,
    47.28vw 22.96vh 0 5px #ad7106,
    94.75vw 68.26vh 0 1px #c31564,
    30.13vw 89.92vh 0 1px #6e45dc,
    83.4vw 72.98vh 0 2px #e05e94,
    59.69vw 99.9vh 0 3px #a2305f,
    31.05vw 96.7vh 0 3px #dc7ebb,
    65.13vw 42.15vh 0 2px #ab46b6,
    26.35vw 38.49vh 0 5px #9cdc47,
    78.25vw 76.97vh 0 4px #6ad1df,
    96.69vw 71.15vh 0 4px #bcb633,
    76.74vw 95.45vh 0 4px #de36af,
    35.85vw 48.53vh 0 5px #8fc291,
    18.39vw 51.22vh 0 2px #03fd34,
    62.02vw 85.51vh 0 4px #8249b5,
    38.13vw 22vh 0 5px #a23ccb,
    42.1vw 95.97vh 0 3px #013c26,
    99.41vw 45.26vh 0 4px #04646c,
    66.8vw 39.68vh 0 5px #61782f,
    24.77vw 32.95vh 0 1px #f5be63,
    83.52vw 6.93vh 0 2px #42bdfd,
    89.84vw 55.53vh 0 4px #b0c6bc,
    46.72vw 78.58vh 0 3px #94c0ed,
    29.23vw 41.73vh 0 1px #71953e,
    7.96vw 27.51vh 0 2px #1d1788,
    51.41vw 71.12vh 0 3px #d34c08,
    87.9vw 38.5vh 0 5px #a412d2,
    81.79vw 2.21vh 0 3px #b8d410,
    0.92vw 82.06vh 0 5px #3da439,
    42.57vw 37.79vh 0 3px #460c0c,
    90.87vw 25.2vh 0 4px #b537c1,
    38.41vw 33.2vh 0 5px #f26cf4,
    60.67vw 99.84vh 0 5px #cc9094,
    30.34vw 37.99vh 0 3px #026232,
    32.93vw 25.53vh 0 5px #62b2bb,
    55.15vw 78.7vh 0 2px #03c72c,
    8.65vw 90.77vh 0 3px #136be2,
    60.15vw 7.65vh 0 2px #707d3e,
    89.3vw 11.98vh 0 1px #43876d,
    41.29vw 66.86vh 0 2px #adb0c2,
    79.32vw 81.4vh 0 3px #cd5fd2,
    94.77vw 22.12vh 0 4px #f47c87,
    7.25vw 48.99vh 0 2px #382c72,
    58.75vw 35.04vh 0 2px #51d289,
    73.85vw 38.56vh 0 2px #0a9284,
    96.87vw 56.88vh 0 5px #d6e8a3,
    46.46vw 30.36vh 0 4px #85f160,
    33.41vw 17.96vh 0 2px #ea0245,
    51.79vw 14.51vh 0 1px #374836,
    23.02vw 71.66vh 0 5px #b8f825,
    14.47vw 41.07vh 0 2px #a5834a,
    71.46vw 58.4vh 0 2px #f3b2f0,
    43.7vw 53.55vh 0 4px #9b10bf,
    72.85vw 64.52vh 0 3px #9e6ca5,
    76.74vw 91.65vh 0 1px #2a8ede,
    62.64vw 27.5vh 0 2px #0d1d77,
    84.38vw 0.47vh 0 2px #0f32f5,
    95.42vw 84vh 0 1px #667ecc,
    93.5vw 90.46vh 0 1px #0ee068,
    25.73vw 24.92vh 0 2px #4c4bef,
    75.21vw 0.47vh 0 2px #282e66,
    90.52vw 17.1vh 0 3px #75f643,
    90.81vw 50.67vh 0 2px #fa2eaf,
    27.56vw 69.56vh 0 5px #ec4314,
    56.55vw 2.38vh 0 1px #95fbb9,
    79.95vw 28.17vh 0 4px #444867,
    97.65vw 58.35vh 0 1px #935f3f,
    79.76vw 27.1vh 0 3px #52ca9d,
    77.02vw 21.37vh 0 1px #042eef,
    47.38vw 30.32vh 0 1px #d58ba5,
    27.3vw 33.62vh 0 3px #f8fddc,
    31.84vw 34.35vh 0 2px #7e675b,
    97.37vw 70.81vh 0 4px #c6ac95,
    61.32vw 30.83vh 0 1px #86ee86,
    75.64vw 1.87vh 0 4px #cbb8d8,
    58.74vw 2.61vh 0 1px #45a3fa,
    69.48vw 30.19vh 0 4px #d3f506,
    13.33vw 38.86vh 0 3px #76ef7b,
    82.67vw 39.78vh 0 1px #5b3f26,
    41.54vw 5.44vh 0 3px #ddf666,
    21.57vw 73.66vh 0 4px #c9f0a4,
    19.16vw 13.31vh 0 1px #f7dcb5,
    39.77vw 13.41vh 0 1px #124550,
    41.89vw 61.03vh 0 4px #ab1ce0,
    48.98vw 61.62vh 0 2px #e7a9bf,
    35.39vw 23.94vh 0 4px #d0443f,
    24.22vw 63.9vh 0 5px #09ecc6,
    17.93vw 95.85vh 0 2px #9c3521,
    7.62vw 14.18vh 0 3px #b5377f,
    54.01vw 70.12vh 0 4px #738d9b,
    31.04vw 83.78vh 0 2px #478c67,
    79.41vw 33.78vh 0 2px #587b08,
    55.38vw 13.82vh 0 2px #1cde0b,
    37.45vw 97.9vh 0 5px #f97529,
    3.7vw 3.16vh 0 3px #7843f2,
    82.24vw 28.52vh 0 3px #4179f2,
    10.25vw 59.25vh 0 4px #09fe1a,
    77.63vw 15.79vh 0 4px #405150,
    21.59vw 41.79vh 0 1px #7f7202,
    98.59vw 62.26vh 0 4px #abc4aa,
    56.48vw 59.09vh 0 1px #d402f7,
    90.07vw 9.46vh 0 1px #087924,
    10.03vw 41.62vh 0 4px #aed76b,
    45.47vw 74.48vh 0 5px #6b7d3c,
    47.23vw 18.7vh 0 2px #1291e5,
    34.77vw 73.89vh 0 3px #8664f6,
    41.46vw 0.4vh 0 5px #6268c6,
    9.39vw 55.36vh 0 3px #689167,
    24.76vw 26.93vh 0 5px #d67dcc,
    7.54vw 70.18vh 0 4px #e117d5,
    86.1vw 61.71vh 0 5px #0d1b7e,
    93.39vw 73.8vh 0 4px #1322c2,
    80.37vw 23.58vh 0 2px #6d5c76,
    91.63vw 52.3vh 0 2px #7f599f,
    42.97vw 63.12vh 0 5px #157db5,
    26.26vw 37.6vh 0 4px #08ccd9,
    64.42vw 23.88vh 0 5px #83dbb2,
    6.38vw 65.39vh 0 3px #82a412,
    94.41vw 89.93vh 0 4px #dc6bd1,
    59.8vw 46.82vh 0 2px #309aa6,
    98.43vw 8.98vh 0 4px #733fed,
    86.64vw 59.89vh 0 3px #65eba7,
    32.94vw 38.86vh 0 2px #56ac75,
    7.33vw 2.55vh 0 2px #1ad0b6,
    91.27vw 99.73vh 0 2px #34186a,
    62.95vw 66.43vh 0 4px #9b8d55,
    1.88vw 14.89vh 0 1px #61c2cb,
    30.2vw 29.38vh 0 3px #f89eb9,
    94.6vw 64.43vh 0 3px #566463,
    88.43vw 99.07vh 0 5px #ecce5e,
    1.19vw 94.92vh 0 2px #a20cc2,
    40.81vw 40.66vh 0 3px #c077b9,
    74vw 72.93vh 0 2px #58aa23,
    69.24vw 99.98vh 0 1px #fe6db6,
    34.54vw 41.66vh 0 3px #33e080,
    18.98vw 9.76vh 0 1px #afeeae,
    7.03vw 42.29vh 0 3px #91ed0b,
    5.57vw 60.53vh 0 5px #8f6f81,
    88.66vw 32.86vh 0 2px #d7a6c9,
    57.71vw 7.3vh 0 4px #dcd062,
    70.79vw 57.9vh 0 2px #ff6a36,
    30.48vw 1vh 0 3px #067870,
    46.2vw 88.42vh 0 1px #23177a,
    58.94vw 75.87vh 0 2px #d647e4,
    91.08vw 1.07vh 0 2px #d3a666,
    45.96vw 80.37vh 0 1px #8aca48,
    83.32vw 95.99vh 0 4px #ea015c,
    75.88vw 94.98vh 0 5px #283ff2,
    53.74vw 11.7vh 0 3px #43dff3,
    69.67vw 32.34vh 0 4px #c06b02,
    96.19vw 7.18vh 0 3px #53226c,
    62.86vw 50.21vh 0 1px #d08601,
    8.25vw 94.86vh 0 1px #b39f14,
    96.29vw 70.51vh 0 5px #f6e341,
    31.16vw 47.62vh 0 5px #359951,
    75.3vw 80vh 0 1px #70fdda,
    0.28vw 94.36vh 0 4px #3a701d,
    29.02vw 89.21vh 0 2px #9f01d9,
    36.56vw 67.69vh 0 3px #bb64e1,
    72.29vw 42.16vh 0 1px #5a8a6b,
    53.27vw 22.86vh 0 3px #9997f1,
    97.72vw 38.76vh 0 4px #428668,
    6.09vw 40.41vh 0 4px #a480a9,
    71.48vw 41.26vh 0 3px #2ef3d5,
    71.32vw 91.45vh 0 3px #a03bc1,
    93.24vw 65.41vh 0 2px #af20a9,
    62.43vw 59.93vh 0 1px #2a38c6,
    68.57vw 11.3vh 0 4px #c44ce0,
    38.76vw 84.05vh 0 1px #252a43,
    83.08vw 30.54vh 0 1px #93123f,
    19.41vw 96.86vh 0 1px #26639e,
    76.02vw 3.91vh 0 2px #93aacb,
    61.2vw 36.71vh 0 5px #678473,
    44.76vw 27.85vh 0 3px #3307cc,
    87.03vw 45.81vh 0 4px #b79f0c,
    31.43vw 96.41vh 0 2px #ed4946,
    22.3vw 79.47vh 0 2px #b50a1f,
    23.14vw 12.95vh 0 1px #375818,
    21.81vw 19.31vh 0 2px #2d5c11,
    54vw 44.84vh 0 1px #bac0fd,
    96.7vw 9.24vh 0 3px #c0d9a2,
    22.91vw 74.11vh 0 1px #076771,
    74.04vw 83.31vh 0 4px #808f20,
    17.64vw 75.63vh 0 3px #646fc5,
    10.06vw 81.54vh 0 2px #58662a,
    26.13vw 67.47vh 0 4px #7fbcff,
    40.44vw 18.87vh 0 4px #1185f3,
    33.31vw 7.26vh 0 1px #12317a,
    18.7vw 20.59vh 0 1px #63ecf2,
    97.66vw 58.05vh 0 5px #81b0a2,
    87.03vw 97.81vh 0 2px #1ee3de,
    98.57vw 71.31vh 0 1px #e8f70f,
    16.99vw 89.34vh 0 2px #839858,
    89.27vw 29.31vh 0 3px #b85b7f,
    75.37vw 89.47vh 0 3px #bc7c2f,
    7.58vw 21.36vh 0 3px #d363f9,
    22.7vw 3.3vh 0 5px #0a4351,
    39.63vw 39.31vh 0 4px #efe0a6,
    64.49vw 75.02vh 0 4px #557833,
    80.46vw 74.32vh 0 2px #54ed05,
    16.61vw 25.14vh 0 5px #f1bfa6,
    99.91vw 85.07vh 0 2px #31f3a4,
    7.36vw 71.66vh 0 4px #82ad3c,
    58.96vw 85.77vh 0 3px #d204d4,
    75.26vw 64.41vh 0 1px #99ac35,
    52.6vw 29.3vh 0 4px #df6e48,
    81.65vw 42.04vh 0 3px #22393e,
    71.26vw 37.63vh 0 1px #f5af62,
    42.12vw 30.01vh 0 2px #461173,
    64.04vw 48.54vh 0 5px #e063ff,
    96.88vw 59.41vh 0 5px #f6f23f,
    66.68vw 45.79vh 0 3px #22c306,
    20.15vw 45.33vh 0 2px #2ea52f,
    29.5vw 67.32vh 0 1px #2fbaa9,
    95.37vw 25.57vh 0 1px #50c573,
    9.39vw 86.42vh 0 2px #e6f7be,
    92.91vw 24.6vh 0 5px #32a8cc,
    42.08vw 55.32vh 0 2px #3652c3,
    14.3vw 28.46vh 0 5px #c29111,
    91.38vw 97.65vh 0 5px #07ac3f,
    32.09vw 21.1vh 0 5px #9e275a,
    93.62vw 10.03vh 0 1px #86d816,
    98.18vw 78.36vh 0 4px #4bb9a7,
    64.22vw 48.92vh 0 3px #0d7482,
    69.9vw 3.65vh 0 3px #dccbfd,
    5.34vw 15.89vh 0 1px #90ce45,
    4.55vw 78.11vh 0 5px #2210b9,
    91.89vw 71.56vh 0 5px #15865e,
    78.68vw 83.62vh 0 1px #d4184c,
    10.03vw 62.72vh 0 3px #43e616,
    17.43vw 1.85vh 0 4px #757cd8,
    85.49vw 47.06vh 0 2px #8f4ec5,
    18.14vw 15.06vh 0 2px #f159dd,
    18.84vw 25.68vh 0 4px #c75a1c,
    26.62vw 81.44vh 0 4px #d0bd42,
    69.69vw 52.44vh 0 2px #1b6869,
    26.56vw 77.1vh 0 1px #8535fb,
    50.55vw 9.21vh 0 1px #d78b0e,
    61.93vw 67.56vh 0 5px #66bd79,
    52.15vw 11.56vh 0 3px #90c705,
    19.52vw 20.09vh 0 1px #6b543c,
    91.35vw 20.84vh 0 3px #fc0d4b,
    41.97vw 43.58vh 0 5px #b945e4,
    40.55vw 26.59vh 0 3px #386c5c,
    92.01vw 58.09vh 0 4px #a44004,
    80.91vw 10.05vh 0 1px #7c4465,
    65.37vw 68.14vh 0 5px #942915,
    59.33vw 36.4vh 0 5px #bc4bef,
    54.08vw 61.22vh 0 4px #1987b4,
    1.29vw 78.97vh 0 4px #e1d92c,
    44vw 92.05vh 0 5px #da5e03,
    27.1vw 56.57vh 0 4px #3ab362,
    40.85vw 7.33vh 0 4px #319de6,
    87.2vw 30.54vh 0 2px #6ff4ed,
    12.16vw 25.42vh 0 2px #6f02da,
    73.87vw 66.43vh 0 3px #9e7954,
    55.63vw 96.51vh 0 4px #b651ec,
    18.36vw 40.85vh 0 5px #d7bb37,
    41.95vw 4.11vh 0 5px #edeb4a,
    60.72vw 45.68vh 0 5px #201157,
    28.21vw 68.1vh 0 5px #6679ff,
    86.16vw 87.05vh 0 5px #450e44,
    65.69vw 84.91vh 0 3px #50304b,
    41.53vw 55.06vh 0 2px #8909a5,
    44.99vw 44.81vh 0 1px #f66cde,
    60.08vw 73.62vh 0 3px #433683,
    42.79vw 63.75vh 0 2px #6c924d,
    39vw 47.46vh 0 1px #488325,
    8.49vw 15.88vh 0 1px #9771e5,
    86.34vw 17.22vh 0 4px #41b783,
    15.64vw 38.52vh 0 5px #e559b9,
    22.88vw 59.33vh 0 5px #391038,
    29.75vw 73.17vh 0 4px #6ff01c,
    74.37vw 42.4vh 0 1px #b11f93,
    19.76vw 86.37vh 0 4px #70e694,
    66.46vw 55.97vh 0 5px #b4ed6d,
    32.09vw 74.78vh 0 5px #0bea05,
    27.99vw 75.54vh 0 1px #8ae64b,
    55.32vw 89.51vh 0 4px #448364,
    77.43vw 3.27vh 0 4px #621c9d,
    34.29vw 18.15vh 0 2px #6ef1ce,
    19.12vw 1.03vh 0 4px #ee3ccd,
    47.58vw 12.65vh 0 5px #8d8e25,
    90.47vw 94.1vh 0 5px #600d26,
    45.43vw 90.32vh 0 3px #18295d,
    35.4vw 60.68vh 0 2px #a6b7ff,
    61.1vw 1.7vh 0 3px #0db377,
    14.28vw 29.42vh 0 2px #e95ca2,
    51.14vw 55.72vh 0 5px #8d0364,
    82.41vw 97.53vh 0 5px #2546b6,
    61.5vw 30.67vh 0 2px #024d55;
}

.g-group:nth-child(2) .item {
  animation-delay: -4s;
}

.item-right {
  transform: rotateY(90deg) translateZ(500px);
}

.item-left {
  transform: rotateY(-90deg) translateZ(500px);
}

.item-top {
  transform: rotateX(90deg) translateZ(500px);
}

.item-bottom {
  transform: rotateX(-90deg) translateZ(500px);
}

.item-middle {
  transform: rotateX(180deg) translateZ(1000px);
}

@keyframes move {
  0% {
    transform: translateZ(-200px) rotate(0deg);
  }
  100% {
    transform: translateZ(150px) rotate(0deg);
  }
}

@keyframes fade {
  0% {
    opacity: 0.2;
  }
  25%,
  60% {
    opacity: 1;
  }
  100% {
    opacity: 0.2;
  }
}

@keyframes hueRotate {
  0% {
    filter: hue-rotate(0);
  }
  100% {
    filter: hue-rotate(360deg);
  }
}
</style>
