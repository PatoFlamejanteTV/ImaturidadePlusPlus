#pragma header

vec2 uv = openfl_TextureCoordv.xy;
uniform float iTime;

void main(void)
{    
    uv.x += sin(iTime+uv.y);
    uv.y += sin(iTime+uv.x);

    vec4 tex = texture2D(bitmap, uv);

    gl_FragColor = tex;
}