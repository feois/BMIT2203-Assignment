shader_type canvas_item;

uniform float radius : hint_range(0.0, 0.5) = 0.15;

void fragment() {
	vec2 uv = UV;
	
	if (uv.x < 0.5 && uv.y < 0.5) {
		
	}
	else if (uv.x < 0.5) {
		
	}
	else if (uv.y < 0.5) {
		uv.x -= 1.0 - radius;
		//uv.y = 1.0 - radius - uv.y;
	}
	else {
		uv -= vec2(1.0 - radius, 1.0 - radius);
	}
	
	if (uv.x > 0.0 && uv.y > 0.0 && sqrt((uv.x * uv.x) + (uv.y * uv.y)) > radius) discard;
}