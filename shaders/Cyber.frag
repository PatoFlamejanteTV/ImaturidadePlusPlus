    /*
        1- First of all, you need to know that shadertoy automatically uses the inputs below:
        uniform vec3      iResolution;           // viewport resolution (in pixels)
        uniform float     iTime;                 // shader playback time (in seconds)
        uniform float     iTimeDelta;            // render time (in seconds)
        uniform int       iFrame;                // shader playback frame
        uniform float     iChannelTime[4];       // channel playback time (in seconds)
        uniform vec3      iChannelResolution[4]; // channel resolution (in pixels)
        uniform vec4      iMouse;                // mouse pixel coords. xy: current (if MLB down), zw: click
        uniform samplerXX iChannel0..3;          // input channel. XX = 2D/Cube
        uniform vec4      iDate;                 // (year, month, day, time in seconds)
        uniform float     iSampleRate;           // sound sample rate (i.e., 44100)
        Currently, my implementation only supports the following inputs: (iResolution, iTime, iChannel0).
        Support for iMouse input is planned for the future.
        2- Porting:
        For this instance we will be porting https://www.shadertoy.com/view/lddXWS
        The shader code is the following:
        ```
        const float RADIUS	= 100.0;
        const float BLUR	= 200.0;
        const float SPEED   = 2.0;
        void mainImage( out vec4 fragColor, in vec2 fragCoord )
        {
            vec2 uv = fragCoord.xy / iResolution.xy;
            vec4 pic = texture(iChannel0, vec2(uv.x, uv.y));
            
            vec2 center = iResolution.xy / 2.0;
            float d = distance(fragCoord.xy, center);
            float intensity = max((d - RADIUS) / (2.0 + BLUR * (1.0 + sin(iTime*SPEED))), 0.0);
            
            fragColor = vec4(intensity + pic.r, intensity + pic.g, intensity + pic.b, 1.0);
        }
        ```
        We need to modify some stuff, 
        - main function header `void mainImage( out vec4 fragColor, in vec2 fragCoord )`
           should be changed to `void main()` 
           and add a new line at the start of function: `vec2 fragCoord = openfl_TextureCoordv * iResolution;`
        - The shader outputs to `fragColor`, this should be changed to `gl_FragColor`
        - at the very start of the shader add those two uniforms:
            `uniform vec2 iResolution;`
            `uniform float iTime;`
        - if your shader makes use of `iChannel0` sampler, change that to `bitmap`
        - if your shader outputs alpha pixels and they're black (Black instead of transparent),
            Make sure to use\change texture function to `texture2D` instead of `texture`
        The result should be the **uncommented** code below.
        3- Usage:
        ```
        new DynamicShaderHandler("Example");
		FlxG.camera.setFilters([new ShaderFilter(animatedShaders["Example"].shader)]);
        ```
        or
        ```
        var spr:FlxSprite = new ShaderSprite("Example");
        ```
    */
//Ethan Alexander Shulman 2015     http://etahn.com/     https://twitter.com/EthanShulman
//This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
//http://creativecommons.org/licenses/by-nc-sa/4.0/

uniform vec2 iResolution;
uniform float iTime;

float voronoi(in vec2 uv) {
    vec2 lp = abs(uv)*10.;
    vec2 sp = fract(lp)-.5;
    lp = floor(lp);
    
    float d = 1.;
    
    for (int x = -1; x < 2; x++) {
        for (int y = -1; y < 2; y++) {
            
            vec2 mp = vec2(float(x),float(y));
            vec2 p = lp+mp;
            
            d = min(d,length(sp+(cos(p.x+iTime)+cos(p.y+iTime))*.3-mp));
            
        }
    }
    
    return d;
}

void main()
{
    vec2 fragCoord = openfl_TextureCoordv * iResolution;

	vec2 uv = fragCoord.xy / iResolution.xy - vec2(.5);
    uv.y *= iResolution.y/iResolution.x;
    
    
    float ang = atan(uv.y,uv.x);
    float dst = length(uv);
    float cfade = clamp(dst*40.-3.+cos(ang*1.+cos(ang*6.)*1.+iTime*2.)*.68,0.,1.);
    
    float a = 0.;
    for (int i = 3; i < 6; i++) { 
        float fi = float(i);
        vec2 luv = uv+cos((ang-dst)*fi+iTime+uv+fi)*.2;
    
    	a += voronoi(luv)*(.7+(cos(luv.x*14.234)+cos(luv.y*16.234))*.4);
    }
    vec3 color = vec3(0.16, .57 ,.19);
    
	gl_FragColor = vec4(color*a*cfade,1.);
}