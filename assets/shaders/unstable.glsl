extern number time;
extern number strength; // how intense the distortion is

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec2 uv = texture_coords;

    // Wavy horizontal distortion
    float wave = sin((uv.y * 20.0) + time * 5.0) * 0.01 * strength;

    // Vertical tearing noise
    float noise = sin((uv.y * 80.0) + time * 20.0) * 0.003 * strength;

    uv.x += wave + noise;

    // Subtle vertical jitter
    uv.y += step(0.95, fract(uv.y * 10.0 + time * 5.0)) * 0.02 * strength;

    // Sample the texture
    vec4 texcolor = Texel(texture, uv);

    // Optional: slight color separation (glitch feel)
    float r = Texel(texture, uv + vec2(0.002 * strength, 0.0)).r;
    float b = Texel(texture, uv - vec2(0.002 * strength, 0.0)).b;

    texcolor.r = r;
    texcolor.b = b;

    texcolor.a *= 0.8 + sin(time * 8.0) * 0.2;

    return texcolor * color;
}