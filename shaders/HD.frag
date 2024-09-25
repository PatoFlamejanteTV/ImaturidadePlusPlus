#pragma header
//its important to have this bit here. it inits all the important OpenFL shader shits like the image's coordinates and size.

vec2 uv = openfl_TextureCoordv.xy;
// uv: coordinate of a pixel. usually replaces 'fragCoord.xy / iResolution.xy';
const int poop = 3;

void main(void){
    //uv = vec2(uv.x+(uTime*uTimeScale),uv.y+(uTime*uTimeScale));
    vec2 pixelsize = 1./openfl_TextureSize;
    vec4 col = flixel_texture2D( bitmap, uv);
    const int size = (1+(poop*2))*(1+(poop*2)); //grid of pixels to sample (poop=1 is 3x3, poop=2 is 5x5, poop=3 is 7x7, and so on and so on and so forth and so forth.)
    vec3 colors[size]; //the colors in question

    int i = 0; //index for the array

    for(int x = -poop; x <= poop; x++) {
        for(int y = -poop; y <= poop; y++) {
            vec2 point = vec2(x,y) * pixelsize;
            vec4 tex = flixel_texture2D( bitmap, uv+point);
            colors[i] = tex.rgb;  // Store the color in the array
            i++;
        }
    }

    vec3 mostCommonColor = colors[0];  //most common color
    int maxCount = 0;  //how common it is

    // Loop over the colors
    for(int i = 0; i < size; i++) {
        int count = 0;  //how common the common color is

        //loop over list of colors once more to count colors
        for(int j = 0; j < size; j++) {
            if(length(colors[i] - colors[j]) < 0.01) {  //if they're similar enough
                count++;
            }
        }

        //if the current color is more common than the most common color
        if(count > maxCount) {
            maxCount = count;
            mostCommonColor = colors[i];
        }
    }

    col = vec4(mostCommonColor,col.a);
    
    gl_FragColor = col;
    //bitmap: the original graphic of the camera or sprite. usually replaces iChannel0 
    //flixel_texture2D: a 4type Vector that returns the image. replaces texture
    //gl_FragColor: the result. usually replaces fragColor
}