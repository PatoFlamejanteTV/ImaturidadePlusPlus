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

uniform vec2 iResolution;
uniform float iTime;


//#define GAMEBOY
#define GAMEBOY
#define BRIGHTNESS 1.0

vec3 find_closest (vec3 ref) {	
	vec3 old = vec3 (100.0*255.0);		
	#define TRY_COLOR(new) old = mix (new, old, step (length (old-ref), length (new-ref)));	
	#ifdef NES
	TRY_COLOR (vec3 (000.0, 088.0, 000.0));
	TRY_COLOR (vec3 (080.0, 048.0, 000.0));
	TRY_COLOR (vec3 (000.0, 104.0, 000.0));
	TRY_COLOR (vec3 (000.0, 064.0, 088.0));
	TRY_COLOR (vec3 (000.0, 120.0, 000.0));
	TRY_COLOR (vec3 (136.0, 020.0, 000.0));
	TRY_COLOR (vec3 (000.0, 168.0, 000.0));
	TRY_COLOR (vec3 (168.0, 016.0, 000.0));
	TRY_COLOR (vec3 (168.0, 000.0, 032.0));
	TRY_COLOR (vec3 (000.0, 168.0, 068.0));
	TRY_COLOR (vec3 (000.0, 184.0, 000.0));
	TRY_COLOR (vec3 (000.0, 000.0, 188.0));
	TRY_COLOR (vec3 (000.0, 136.0, 136.0));
	TRY_COLOR (vec3 (148.0, 000.0, 132.0));
	TRY_COLOR (vec3 (068.0, 040.0, 188.0));
	TRY_COLOR (vec3 (120.0, 120.0, 120.0));
	TRY_COLOR (vec3 (172.0, 124.0, 000.0));
	TRY_COLOR (vec3 (124.0, 124.0, 124.0));
	TRY_COLOR (vec3 (228.0, 000.0, 088.0));
	TRY_COLOR (vec3 (228.0, 092.0, 016.0));
	TRY_COLOR (vec3 (088.0, 216.0, 084.0));
	TRY_COLOR (vec3 (000.0, 000.0, 252.0));
	TRY_COLOR (vec3 (248.0, 056.0, 000.0));
	TRY_COLOR (vec3 (000.0, 088.0, 248.0));
	TRY_COLOR (vec3 (000.0, 120.0, 248.0));
	TRY_COLOR (vec3 (104.0, 068.0, 252.0));
	TRY_COLOR (vec3 (248.0, 120.0, 088.0));
	TRY_COLOR (vec3 (216.0, 000.0, 204.0));
	TRY_COLOR (vec3 (088.0, 248.0, 152.0));
	TRY_COLOR (vec3 (248.0, 088.0, 152.0));
	TRY_COLOR (vec3 (104.0, 136.0, 252.0));
	TRY_COLOR (vec3 (252.0, 160.0, 068.0));
	TRY_COLOR (vec3 (248.0, 184.0, 000.0));
	TRY_COLOR (vec3 (184.0, 248.0, 024.0));
	TRY_COLOR (vec3 (152.0, 120.0, 248.0));
	TRY_COLOR (vec3 (000.0, 232.0, 216.0));
	TRY_COLOR (vec3 (060.0, 188.0, 252.0));
	TRY_COLOR (vec3 (188.0, 188.0, 188.0));
	TRY_COLOR (vec3 (216.0, 248.0, 120.0));
	TRY_COLOR (vec3 (248.0, 216.0, 120.0));
	TRY_COLOR (vec3 (248.0, 164.0, 192.0));
	TRY_COLOR (vec3 (000.0, 252.0, 252.0));
	TRY_COLOR (vec3 (184.0, 184.0, 248.0));
	TRY_COLOR (vec3 (184.0, 248.0, 184.0));
	TRY_COLOR (vec3 (240.0, 208.0, 176.0));
	TRY_COLOR (vec3 (248.0, 120.0, 248.0));
	TRY_COLOR (vec3 (252.0, 224.0, 168.0));
	TRY_COLOR (vec3 (184.0, 248.0, 216.0));
	TRY_COLOR (vec3 (216.0, 184.0, 248.0));
	TRY_COLOR (vec3 (164.0, 228.0, 252.0));
	TRY_COLOR (vec3 (248.0, 184.0, 248.0));
	TRY_COLOR (vec3 (248.0, 216.0, 248.0));
	TRY_COLOR (vec3 (248.0, 248.0, 248.0));
	TRY_COLOR (vec3 (252.0, 252.0, 252.0));	
	#endif
	
	#ifdef GAMEBOY
	TRY_COLOR (vec3 (156.0, 189.0, 015.0));
	TRY_COLOR (vec3 (140.0, 173.0, 015.0));
	TRY_COLOR (vec3 (048.0, 098.0, 048.0));
	TRY_COLOR (vec3 (015.0, 056.0, 015.0));
	#endif
	
	#ifdef EGA
    TRY_COLOR (vec3 (000.0,000.0,000.0)); 
    TRY_COLOR (vec3 (255.0,255.0,255.0)); 
    TRY_COLOR (vec3 (255.0,  0.0,  0.0)); 
    TRY_COLOR (vec3 (  0.0,255.0,  0.0)); 
    TRY_COLOR (vec3 (  0.0,  0.0,255.0)); 
    TRY_COLOR (vec3 (255.0,255.0,  0.0)); 
    TRY_COLOR (vec3 (  0.0,255.0,255.0)); 
    TRY_COLOR (vec3 (255.0,  0.0,255.0)); 
    TRY_COLOR (vec3 (128.0,  0.0,  0.0)); 
    TRY_COLOR (vec3 (  0.0,128.0,  0.0)); 
    TRY_COLOR (vec3 (  0.0,  0.0,128.0)); 
    TRY_COLOR (vec3 (128.0,128.0,  0.0)); 
    TRY_COLOR (vec3 (  0.0,128.0,128.0)); 
    TRY_COLOR (vec3 (128.0,  0.0,128.0)); 
    TRY_COLOR (vec3 (128.0,128.0,128.0)); 
    TRY_COLOR (vec3 (255.0,128.0,128.0)); 
	#endif
    
	return old ;
}


float dither_matrix (float x, float y) {
	return mix(mix(mix(mix(mix(mix(0.0,32.0,step(1.0,y)),mix(8.0,40.0,step(3.0,y)),step(2.0,y)),mix(mix(2.0,34.0,step(5.0,y)),mix(10.0,42.0,step(7.0,y)),step(6.0,y)),step(4.0,y)),mix(mix(mix(48.0,16.0,step(1.0,y)),mix(56.0,24.0,step(3.0,y)),step(2.0,y)),mix(mix(50.0,18.0,step(5.0,y)),mix(58.0,26.0,step(7.0,y)),step(6.0,y)),step(4.0,y)),step(1.0,x)),mix(mix(mix(mix(12.0,44.0,step(1.0,y)),mix(4.0,36.0,step(3.0,y)),step(2.0,y)),mix(mix(14.0,46.0,step(5.0,y)),mix(6.0,38.0,step(7.0,y)),step(6.0,y)),step(4.0,y)),mix(mix(mix(60.0,28.0,step(1.0,y)),mix(52.0,20.0,step(3.0,y)),step(2.0,y)),mix(mix(62.0,30.0,step(5.0,y)),mix(54.0,22.0,step(7.0,y)),step(6.0,y)),step(4.0,y)),step(3.0,x)),step(2.0,x)),mix(mix(mix(mix(mix(3.0,35.0,step(1.0,y)),mix(11.0,43.0,step(3.0,y)),step(2.0,y)),mix(mix(1.0,33.0,step(5.0,y)),mix(9.0,41.0,step(7.0,y)),step(6.0,y)),step(4.0,y)),mix(mix(mix(51.0,19.0,step(1.0,y)),mix(59.0,27.0,step(3.0,y)),step(2.0,y)),mix(mix(49.0,17.0,step(5.0,y)),mix(57.0,25.0,step(7.0,y)),step(6.0,y)),step(4.0,y)),step(5.0,x)),mix(mix(mix(mix(15.0,47.0,step(1.0,y)),mix(7.0,39.0,step(3.0,y)),step(2.0,y)),mix(mix(13.0,45.0,step(5.0,y)),mix(5.0,37.0,step(7.0,y)),step(6.0,y)),step(4.0,y)),mix(mix(mix(63.0,31.0,step(1.0,y)),mix(55.0,23.0,step(3.0,y)),step(2.0,y)),mix(mix(61.0,29.0,step(5.0,y)),mix(53.0,21.0,step(7.0,y)),step(6.0,y)),step(4.0,y)),step(7.0,x)),step(6.0,x)),step(4.0,x));
}

vec3 dither (vec3 color, vec2 uv) {	
	color *= 255.0 * BRIGHTNESS;	
	color += dither_matrix (mod (uv.x, 8.0), mod (uv.y, 8.0)) ;
	color = find_closest (clamp (color, 0.0, 255.0));
	return color / 255.0;
}


void main()
{
    vec2 fragCoord = openfl_TextureCoordv * iResolution;
	vec2 uv = fragCoord.xy / iResolution.xy;
	vec3 tc = texture2D(bitmap, uv).xyz;
	gl_FragColor =  vec4 (dither (tc, fragCoord.xy),1.0);		
}