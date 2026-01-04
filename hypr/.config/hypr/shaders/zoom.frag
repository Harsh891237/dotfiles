#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;

out vec4 fragColor;

void main() {
    float zoom = 11.8;                 // zoom factor
    vec2 center = vec2(0.5, 0.5);

    // Zoom math
    vec2 coord = (v_texcoord - center) / zoom + center;

    // Force nearest-neighbor sampling
    ivec2 texSize = textureSize(tex, 0);
    vec2 pixel = (floor(coord * vec2(texSize)) + 0.5) / vec2(texSize);

    fragColor = texture(tex, pixel);
}

