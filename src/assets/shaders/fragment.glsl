precision highp float;

varying vec2 vUv;
varying vec3 vNormal;

uniform float uTime;
/*uniform float uWaterLevel;
uniform float uMountainHeight;
uniform float uContinentScale;
uniform float uDetailScale;
*/
uniform float uTemperature;     // -1.0 to 1.0, cold to hot
uniform float uMountainHeight;  // 0.0 to 1.0, flat to mountainous
uniform float uLandPercentage;  // 0.0 to 1.0, water world to desert planet
uniform float uWaterColor;      // 0.0 to 1.0, blue water to alien-colored wa
uniform vec3 uLightDirection;

#define PI 3.1415926535897932384626433832795


// Simplex 3D Noise 
vec4 permute(vec4 x){return mod(((x*34.0)+1.0)*x, 289.0);}
vec4 taylorInvSqrt(vec4 r){return 1.79284291400159 - 0.85373472095314 * r;}

float snoise(vec3 v){ 
  const vec2  C = vec2(1.0/6.0, 1.0/3.0);
  const vec4  D = vec4(0.0, 0.5, 1.0, 2.0);

  vec3 i  = floor(v + dot(v, C.yyy) );
  vec3 x0 =   v - i + dot(i, C.xxx);

  vec3 g = step(x0.yzx, x0.xyz);
  vec3 l = 1.0 - g;
  vec3 i1 = min(g.xyz, l.zxy);
  vec3 i2 = max(g.xyz, l.zxy);

  vec3 x1 = x0 - i1 + C.xxx;
  vec3 x2 = x0 - i2 + C.yyy;
  vec3 x3 = x0 - D.yyy;

  i = mod(i, 289.0);
  vec4 p = permute( permute( permute(
        i.z + vec4(0.0, i1.z, i2.z, 1.0 ))
        + i.y + vec4(0.0, i1.y, i2.y, 1.0 ))
        + i.x + vec4(0.0, i1.x, i2.x, 1.0 ));

  float n_ = 0.142857142857; // 1.0/7.0
  vec3  ns = n_ * D.wyz - D.xzx;

  vec4 j = p - 49.0 * floor(p * ns.z * ns.z);

  vec4 x_ = floor(j * ns.z);
  vec4 y_ = floor(j - 7.0 * x_);

  vec4 x = x_ * ns.x + ns.yyyy;
  vec4 y = y_ * ns.x + ns.yyyy;
  vec4 h = 1.0 - abs(x) - abs(y);

  vec4 b0 = vec4(x.xy, y.xy);
  vec4 b1 = vec4(x.zw, y.zw);

  vec4 s0 = floor(b0)*2.0 + 1.0;
  vec4 s1 = floor(b1)*2.0 + 1.0;
  vec4 sh = -step(h, vec4(0.0));

  vec4 a0 = b0.xzyw + s0.xzyw*sh.xxyy;
  vec4 a1 = b1.xzyw + s1.xzyw*sh.zzww;

  vec3 p0 = vec3(a0.xy,h.x);
  vec3 p1 = vec3(a0.zw,h.y);
  vec3 p2 = vec3(a1.xy,h.z);
  vec3 p3 = vec3(a1.zw,h.w);

  vec4 norm = taylorInvSqrt(vec4(dot(p0,p0), dot(p1,p1), dot(p2,p2), dot(p3,p3)));
  p0 *= norm.x;
  p1 *= norm.y;
  p2 *= norm.z;
  p3 *= norm.w;

  vec4 m = max(0.6 - vec4(dot(x0,x0), dot(x1,x1), dot(x2,x2), dot(x3,x3)), 0.0);
  m = m * m;
  return 42.0 * dot( m*m, vec4( dot(p0,x0), dot(p1,x1), dot(p2,x2), dot(p3,x3) ));
}

float fbm(vec3 x) {
    float v = 0.0;
    float a = 0.5;
    vec3 shift = vec3(100);
    for (int i = 0; i < 6; ++i) {
        v += a * snoise(x);
        x = x * 2.0 + shift;
        a *= 0.5;
    }
    return v;
}

vec3 getTerrainColor(float height, vec3 normal, float temperature) {
    vec3 deepWater = mix(vec3(0.0, 0.05, 0.2), vec3(0.2, 0.0, 0.1), uWaterColor);
    vec3 shallowWater = mix(vec3(0.0, 0.2, 0.5), vec3(0.5, 0.2, 0.0), uWaterColor);
    vec3 sand = mix(vec3(0.76, 0.7, 0.5), vec3(0.7, 0.5, 0.76), temperature * 0.5 + 0.5);
    vec3 grass = mix(vec3(0.1, 0.55, 0.2), vec3(0.55, 0.2, 0.1), temperature * 0.5 + 0.5);
    vec3 rock = mix(vec3(0.5, 0.5, 0.5), vec3(0.3, 0.2, 0.1), temperature * 0.5 + 0.5);
    vec3 snow = vec3(0.9, 0.9, 0.9);
    vec3 lava = vec3(0.8, 0.2, 0.0);

    float waterLevel = 1.0 - uLandPercentage; // Corrected water level calculation
    float normalVariation = dot(normal, vec3(1.0, 0.5, 0.3));

    if (height < waterLevel - 0.1) return deepWater;
    if (height < waterLevel) return mix(deepWater, shallowWater, (height - (waterLevel - 0.1)) / 0.1);
    
    vec3 baseColor;
    if (height < waterLevel + 0.05) baseColor = mix(sand, grass, normalVariation * 0.5);
    else if (height < waterLevel + 0.15) baseColor = mix(grass, rock, (height - (waterLevel + 0.05)) / 0.1 + normalVariation * 0.2);
    else baseColor = mix(rock, snow, (height - (waterLevel + 0.15)) / 0.2 + normalVariation * 0.2);

    // Temperature effects
    if (temperature > 0.7 && height > waterLevel + 0.2) {
        baseColor = mix(baseColor, lava, smoothstep(0.7, 1.0, temperature) * smoothstep(waterLevel + 0.2, waterLevel + 0.4, height));
    } else if (temperature < -0.5) {
        baseColor = mix(baseColor, snow, smoothstep(-0.5, -1.0, temperature));
    }

    return baseColor;
}

//im so desperate trying to make this work:(

float getTemperature(vec3 position) {
    return mix(-40.0, 30.0, (position.y + 1.0) * 0.5);
}

float getHumidity(vec3 position) {
    float latitude = asin(position.y);
    float base = (cos(latitude * 2.0) + 1.0) * 0.5;
    return base + snoise(position * 5.0) * 0.2;
}

void main() {
    vec2 uv = vUv;
    float theta = uv.y * PI;
    float phi = uv.x * 2.0 * PI;
    
    vec3 p = vec3(
        sin(theta) * cos(phi),
        cos(theta),
        sin(theta) * sin(phi)
    );

    float continentScale = mix(5.0, 2.0, uLandPercentage);
    float detailScale = mix(10.0, 5.0, uMountainHeight);
    
    float continents = fbm(p * continentScale + uTime * 0.01);
    float detail = fbm(p * detailScale * 2.0);
    float height = uMountainHeight * mix(continents, detail, 0.3);
    
    vec3 color = getTerrainColor(height, vNormal, uTemperature);

    // Add simple lighting
    vec3 lightDir = normalize(uLightDirection);
    float diffuse = max(dot(vNormal, lightDir), 0.0);
    float ambient = 0.3;
    color = color * (diffuse + ambient);
    
    // Add atmosphere effect
    float atmosphereIntensity = pow(1.0 - abs(dot(vNormal, vec3(0.0, 0.0, 1.0))), 2.0);
    vec3 atmosphereColor = mix(vec3(0.6, 0.8, 1.0), vec3(1.0, 0.6, 0.8), uWaterColor);
    color = mix(color, atmosphereColor, atmosphereIntensity * 0.3);

    gl_FragColor = vec4(color, 1.0);
}
