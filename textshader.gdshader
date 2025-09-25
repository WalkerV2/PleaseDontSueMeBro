shader_type canvas_item;

uniform sampler2D gold_texture;
uniform vec2 gold_scale = vec2(1.0, 1.0);
uniform vec2 gold_offset = vec2(0.0, 0.0);
uniform float alpha_cutoff = 0.02; // adjust to trim anti-aliased edges

void fragment() {
    // Mask: the Label's font alpha (TEXTURE contains the glyphs)
    vec4 mask = texture(TEXTURE, UV);

    // Discard outside the letters
    if (mask.a <= alpha_cutoff) {
        discard;
    }

    // Sample the gold texture
    vec2 gUV = UV * gold_scale + gold_offset;
    vec4 gold = texture(gold_texture, gUV);

    // Apply the gold color with the text alpha
    COLOR = vec4(gold.rgb, mask.a);
}
