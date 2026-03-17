extends Control


@onready var scene: PackedScene = load("res://scenes/hotel.tscn")
@onready var hotels: Control = %Hotels


func _ready() -> void:
	for hotel in hotels.get_children():
		var button := hotel.get_node(^"%Button") as Button
		button.pressed.connect(func (): get_tree().change_scene_to_packed(scene))
