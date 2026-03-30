extends Control


const unfaved := preload("res://assets/bookmark.png")
const faved := preload("res://assets/bookmarked.png")


@onready var fav: TextureRect = %FavTexture

@export var link := &""


var is_faved := false


func _on_favorite_pressed() -> void:
	fav.texture = unfaved if is_faved else faved
	is_faved = !is_faved


func _on_reserve_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/booking.tscn")


func _on_address_pressed() -> void:
	OS.shell_open(link)
