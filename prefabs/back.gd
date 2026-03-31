class_name Back
extends MarginContainer


static var back: PackedScene


@export var scene: PackedScene


func _on_button_pressed() -> void:
	if back:
		scene = back
		back = null
	get_tree().change_scene_to_packed(scene)
