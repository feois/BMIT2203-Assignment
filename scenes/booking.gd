extends Control


@onready var popup: Control = %Popup
@onready var confirmation: Control = %Confirmation
@onready var payment: Control = %Payment
@onready var receipt: Control = %Receipt


func _ready() -> void:
	popup.visible = false


func _process(_delta: float) -> void:
	var nonzero := false
	
	for option in %Options.get_children():
		if option is Quantity:
			if option.label.text != '0':
				nonzero = true
				break
	
	%Reserve.disabled = !nonzero


func _on_popup_focus_entered() -> void:
	popup.visible = false


func _on_reserve_pressed() -> void:
	popup.visible = true
	confirmation.visible = true
	payment.visible = false
	receipt.visible = false
	%Back.visible = true


func _on_confirmation_button_pressed() -> void:
	confirmation.visible = false
	payment.visible = true


func _on_payment_button_pressed() -> void:
	payment.visible = false
	receipt.visible = true
	%Back.visible = false


func _on_receipt_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_button_pressed() -> void:
	popup.visible = false
