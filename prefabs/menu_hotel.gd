@tool
class_name MenuHotel
extends CenterContainer


signal pressed


@export var image: Texture2D
@export var hotel_name: String
@export_range(1, 5, 1) var rating: float = 5
@export var address: String
@export var price_min: int
@export var price_max: int

@onready var texture_rect: TextureRect = %TextureRect
@onready var panel: TextureRectRounded = %Panel
@onready var name_label: Label = %Name
@onready var rating_label: Label = %Rating
@onready var address_label: Label = %Address
@onready var price_label: Label = %Price

var init := true


func _process(_delta: float) -> void:
	if Engine.is_editor_hint() or init:
		init = false
		texture_rect.texture = image
		panel.texture = image
		panel._update_panel_values()
		name_label.text = hotel_name
		rating_label.text = "⭐".repeat(int(rating))
		address_label.text = address
		price_label.text = "RM %d - %d" % [price_min, price_max]


func _on_button_pressed() -> void:
	pressed.emit()
