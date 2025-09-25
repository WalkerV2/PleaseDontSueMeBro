extends HBoxContainer

@onready var buttons: Array[TextureButton] = [
	$CharacterWedge,
	$Character,
	$Geniemon,
	$Weapon,
	$WeaponWedge,]

func _ready() -> void:
	for button in buttons:
		button.toggled.connect(_on_button_toggled.bind(button))

func _on_button_toggled(toggled_on: bool, pressed_button: TextureButton) -> void:
	# Turn off all the other buttons
	if toggled_on:
		for b in buttons:
			if b != pressed_button:
				b.button_pressed = false

	# Animate size for the pressed button
	var tween := create_tween()
	if toggled_on:
		var size = Vector2(300, 564) if pressed_button == $CharacterWedge else Vector2(250, 564)
		tween.tween_property(pressed_button, "custom_minimum_size", size, 0.1)
	else:
		tween.tween_property(pressed_button, "custom_minimum_size", Vector2(100, 300), 0.1)
