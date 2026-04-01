class_name Rating
extends Button


static var rating := 1
static var hover := 0


@export var index: int


func _ready() -> void:
	mouse_entered.connect(func () -> void: hover = index)
	mouse_exited.connect(func () -> void: hover = 0)
	pressed.connect(func () -> void: rating = index)


func _process(_delta: float) -> void:
	set_instance_shader_parameter(&"gray", (rating if hover == 0 else hover) < index)
