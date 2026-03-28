extends Control


@onready var scene: PackedScene = load("res://scenes/hotel.tscn")
@onready var hotels: Control = %Hotels
@onready var search: LineEdit = %Search
@onready var search_popup: PanelContainer = %SearchPopup


var focused: Control = null
var popup := false


func _ready() -> void:
	search_popup.visible = false
	
	for hotel in hotels.get_children():
		var button := hotel.get_node(^"%Button") as Button
		button.pressed.connect(func (): get_tree().change_scene_to_packed(scene))


func _process(_delta: float) -> void:
	var f := get_viewport().gui_get_focus_owner()
	
	if f != focused:
		focused = f
		focus_changed(focused)


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_viewport().gui_release_focus()
		accept_event()


func focus_changed(ui: Control) -> void:
	search_popup.visible = ui and (ui in [search, search_popup] or search_popup.is_ancestor_of(ui))


func _on_search_focus_entered() -> void:
	search_popup.global_position = search.global_position + Vector2(0, search.size.y)
	search_popup.size.x = search.size.x
	search_popup.size.y = get_viewport_rect().size.y * 0.5


func _on_search_rating_slider_value_changed(value: float) -> void:
	%SearchRatingLabel.text = "⭐".repeat(int(value))
