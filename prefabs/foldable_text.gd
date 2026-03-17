@tool

extends Control


@export_multiline() var text: String
@export var hmargin: int
@export var vmargin: int
@export var height: float
@export var gradient_height: float

@onready var control: Control = %VBoxContainer
@onready var margin: MarginContainer = %MarginContainer
@onready var label: Label = %Label
@onready var gradient: TextureRect = %TextureRect

var expanded := false


func _process(_delta: float) -> void:
	label.text = text
	margin.add_theme_constant_override("margin_left", hmargin)
	margin.add_theme_constant_override("margin_right", hmargin)
	margin.add_theme_constant_override("margin_top", vmargin)
	margin.add_theme_constant_override("margin_bottom", vmargin)
	custom_minimum_size.y = control.size.y if expanded else height
	gradient.custom_minimum_size.y = gradient_height


func _on_button_pressed() -> void:
	gradient.visible = expanded
	expanded = !expanded
