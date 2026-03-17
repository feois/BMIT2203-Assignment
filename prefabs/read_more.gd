extends Label


@export var button: Button
@onready var less := text
@export_multiline() var more: String


func _ready() -> void:
	button.pressed.connect(_on_pressed)


func _on_pressed() -> void:
	if text == less:
		text = more
		button.text = "Collapse"
	else:
		text = less
		button.text = "Read More" 
