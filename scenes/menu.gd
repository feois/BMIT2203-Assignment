extends Control


@onready var scene: PackedScene = load("res://scenes/hotel.tscn")
@onready var hotels: Control = %Hotels
@onready var search: LineEdit = %Search
@onready var search_bar: Control = %SearchBar
@onready var filter: Button = %Filter
@onready var filter_popup: Control = %FilterPopup
@onready var from_date: DatePicker = %FromDate
@onready var to_date: DatePicker = %ToDate
@onready var rating_option: OptionButton = %RatingOption


var rating := 0
var price := INF


func get_hotels() -> Array[MenuHotel]:
	var arr: Array[MenuHotel]
	arr.assign(hotels.get_children())
	return arr


func update_hotels() -> void:
	var terms := search.text
	
	for hotel in get_hotels():
		hotel.visible = terms.is_empty() or hotel.hotel_name.to_lower().contains(terms)
		if ((hotel.rating < rating) if rating_option.selected == 0 else (hotel.rating != rating)):
			hotel.visible = false
		if hotel.price_min > price:
			hotel.visible = false


func _ready() -> void:
	filter_popup.visible = false
	
	for hotel in get_hotels():
		hotel.pressed.connect(func (): get_tree().change_scene_to_packed(scene))
	
	hotels.visible = false
	%NoDate.visible = true


func _process(_delta: float) -> void:
	var focused := get_viewport().gui_get_focus_owner()
	
	if focused != filter:
		filter_popup.visible = focused and (focused == filter_popup or filter_popup.is_ancestor_of(focused))
	
	filter.button_pressed = filter_popup.visible
	
	if from_date.date_picker_button.text != " " and to_date.date_picker_button.text != " ":
		hotels.visible = true
		%NoDate.visible = false
	
	if rating != Rating.rating:
		rating = Rating.rating
		update_hotels()


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_viewport().gui_release_focus()
		accept_event()


func _on_search_rating_slider_value_changed(value: float) -> void:
	%SearchRatingLabel.text = "⭐".repeat(int(value))


func _on_filter_pressed() -> void:
	if filter.button_pressed:
		filter_popup.global_position = search_bar.global_position + Vector2(0, search_bar.size.y)
		filter_popup.size.x = search_bar.size.x
		filter_popup.grab_focus()
	else:
		filter_popup.visible = false


func _on_date_hide() -> void:
	filter_popup.grab_focus()


func _on_search_text_changed(_new_text: String) -> void:
	update_hotels()


func _on_rating_option_item_selected(_index: int) -> void:
	update_hotels()


func _on_price_text_changed(new_text: String) -> void:
	if new_text.is_empty():
		price = INF
		update_hotels()
	
	if new_text.is_valid_int():
		price = int(new_text)
		update_hotels()
