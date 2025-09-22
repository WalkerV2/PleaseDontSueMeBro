extends Control
@onready var delete_anim_player: AnimationPlayer = $DeleteAnimPlayer


func _on_texture_button_mouse_entered() -> void:
	delete_anim_player.play("DeleteAnimation")

func _on_texture_button_mouse_exited() -> void:

		delete_anim_player.seek(delete_anim_player.current_animation_length, true)
		delete_anim_player.play("DeleteAnimation", -1.0, -5.0, true)
		
