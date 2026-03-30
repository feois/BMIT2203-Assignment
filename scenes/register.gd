extends Control


func _on_login_pressed() -> void:
	get_tree().change_scene_to_packed(preload("res://scenes/menu.tscn"))
