shader_type canvas_item;

instance uniform bool gray;

void fragment() {
	if (gray && texture(TEXTURE, UV).a > 0.0) COLOR = vec4(0.5, 0.5, 0.5, 1);
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
