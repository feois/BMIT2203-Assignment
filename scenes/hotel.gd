extends Control


const unfaved := preload("res://assets/bookmark.png")
const faved := preload("res://assets/bookmarked.png")


@onready var fav: TextureRect = %FavTexture


var is_faved := false


func _on_favorite_pressed() -> void:
	fav.texture = unfaved if is_faved else faved
	is_faved = !is_faved
