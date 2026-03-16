extends HBoxContainer


func load_scene(path):
	if get_tree().current_scene.scene_file_path != path:
		get_tree().change_scene_to_file(path)
		return true
	return false


func _on_browse() -> void:
	load_scene("res://menu.tscn")


func _on_favs() -> void:
	if not load_scene("res://fav.tscn"):
		load_scene("res://fav_empty.tscn")


func _on_bookings() -> void:
	load_scene("res://")


func _on_acc() -> void:
	load_scene("res://acc.tscn")
