#pragma header

vec2 uv = openfl_TextureCoordv.xy;

uniform float iTime;

void main(void)
{
    vec4 tex = texture2D(bitmap, uv);

    // To HSV
    vec3 c = tex.rgb;
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    vec3 hsv = vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);

    hsv.x = fract(hsv.x + iTime);
    hsv.y = 1.0;

    // Back to RGB
    vec3 c2 = hsv;
    vec4 K2 = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p2 = abs(fract(c2.xxx + K2.xyz) * 6.0 - K2.www);
    tex = vec4(c2.z * mix(K.xxx, clamp(p2 - K2.xxx, 0.0, 1.0), c2.y), tex.a);

    gl_FragColor = tex;
}