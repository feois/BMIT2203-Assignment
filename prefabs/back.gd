class_name Back
extends MarginContainer


static var back: PackedScene


@export var scene: PackedScene


func _on_button_pressed() -> void:
	if back:
		get_tree().change_scene_to_packed(back)
		back = null
	elif scene:
		get_tree().change_scene_to_packed(scene)
