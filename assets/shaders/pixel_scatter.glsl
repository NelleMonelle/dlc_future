extern vec2 seed;
extern float max_dist;
extern vec2 texture_size;
extern float pixel_size;
extern vec2 screen_pos;

float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

float floor_multiple(float n, float multiple) {
    return floor(n / multiple) * multiple;
}

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec2 coords_floored = vec2(floor_multiple(texture_coords.x - screen_pos.x, pixel_size / texture_size.x),
                               floor_multiple(texture_coords.y - screen_pos.y, pixel_size / texture_size.y));
    float x_offset = (random(seed * coords_floored      ) - 0.5) * 2 * max_dist / texture_size.x;
    float y_offset = (random(seed * coords_floored * 1.1) - 0.5) * 2 * max_dist / texture_size.y;

    return Texel(texture, vec2(texture_coords.x + x_offset, texture_coords.y + y_offset)) * color;
}