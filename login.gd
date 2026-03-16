extends Control

func _on_login_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_register(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			get_tree().change_scene_to_file("res://register.tscn")
			accept_event() 
