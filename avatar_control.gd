extends Control
@onready var avatar_anim_player: AnimationPlayer = $AvatarIcon/AvatarAnimPlayer

func _on_avatar_icon_toggled(toggled_on: bool) -> void:
	if toggled_on:
		avatar_anim_player.play("AvatarAnimation")
	else:
		avatar_anim_player.seek(avatar_anim_player.current_animation_length, true) # Jump to end
		avatar_anim_player.play("AvatarAnimation", -1.0, -5.0, true)
