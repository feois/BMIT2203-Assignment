extends Control


@onready var popup: Control = %Popup
@onready var confirmation: Control = %Confirmation
@onready var payment: Control = %Payment
@onready var receipt: Control = %Receipt


func _on_popup_focus_entered() -> void:
	popup.visible = false


func _on_reserve_pressed() -> void:
	popup.visible = true
	confirmation.visible = true
	payment.visible = false
	receipt.visible = false


func _on_confirmation_button_pressed() -> void:
	confirmation.visible = false
	payment.visible = true


func _on_payment_button_pressed() -> void:
	payment.visible = false
	receipt.visible = true


func _on_receipt_button_pressed() -> void:
	popup.visible = false
