extends MarginContainer


func _on_button_pressed() -> void:
	Back.back = load(get_tree().current_scene.scene_file_path)
	get_tree().change_scene_to_file("res://scenes/room.tscn")
