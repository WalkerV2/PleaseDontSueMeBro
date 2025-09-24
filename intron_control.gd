extends Control

@onready var intron_anim_player: AnimationPlayer = $IntronIcon/IntronAnimPlayer

func _on_intron_icon_toggled(toggled_on: bool) -> void:
	if toggled_on:
		intron_anim_player.play("IntronAnimation")
	else:
		intron_anim_player.seek(intron_anim_player.current_animation_length, true) # Jump to end
		intron_anim_player.play("IntronAnimation", -1.0, -5.0, true)

func _on_intron_icon_button_down() -> void:
	print("IntronHello") # Replace with function body.
