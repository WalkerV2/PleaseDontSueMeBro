extends Control

@onready var avatar_wedge_anim_player: AnimationPlayer = $AvatarWedgeIcon/AvatarWedgeAnimPlayer
var avatarwedge_open := false

func _on_avatar_wedge_icon_button_down() -> void:
	if not avatarwedge_open:
		avatar_wedge_anim_player.play("AvatarWedgeAnimation")
		avatarwedge_open = true
	else:
		avatar_wedge_anim_player.seek(avatar_wedge_anim_player.current_animation_length, true)
		avatar_wedge_anim_player.play("AvatarWedgeAnimation", -1.0, -5.0, true)
		avatarwedge_open = false
