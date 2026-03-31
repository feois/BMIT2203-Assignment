extends HBoxContainer


@onready var label := %Label


func _on_decrement_pressed() -> void:
	if int(label.text) > 0:
		label.text = str(int(label.text) - 1)


func _on_increment_pressed() -> void:
	label.text = str(int(label.text) + 1)
