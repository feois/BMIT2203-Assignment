extends HBoxContainer


@onready var menu: PackedScene = load("res://scenes/menu.tscn")
@onready var fav: PackedScene = load("res://scenes/fav.tscn")
@onready var fav_empty: PackedScene = load("res://scenes/fav_empty.tscn")
@onready var bookings: PackedScene = null
@onready var acc: PackedScene = load("res://scenes/acc.tscn")


func load_scene(scene: PackedScene):
	if scene and get_tree().current_scene.scene_file_path != scene.resource_path:
		get_tree().change_scene_to_packed(scene)
		return true
	return false


func _on_browse() -> void:
	load_scene(menu)


func _on_favs() -> void:
	if not load_scene(fav):
		load_scene(fav_empty)


func _on_bookings() -> void:
	load_scene(bookings)


func _on_acc() -> void:
	load_scene(acc)
