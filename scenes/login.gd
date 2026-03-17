extends Control

func _on_login_pressed() -> void:
	get_tree().change_scene_to_packed(preload("res://scenes/menu.tscn"))


func _on_register(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			get_tree().change_scene_to_packed(preload("res://scenes/register.tscn"))
			accept_event() 
