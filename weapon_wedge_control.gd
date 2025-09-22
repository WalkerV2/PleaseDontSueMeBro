extends Control
@onready var weapon_wedge_anim_player: AnimationPlayer = $WeaponWedgeIcon/WeaponWedgeAnimPlayer
var weaponwedge_open := false

func _on_weapon_wedge_icon_button_down() -> void:
	if not weaponwedge_open:
		weapon_wedge_anim_player.play("WeaponWedgeAnimation")
		weaponwedge_open = true
	else:
		weapon_wedge_anim_player.seek(weapon_wedge_anim_player.current_animation_length, true)
		weapon_wedge_anim_player.play("WeaponWedgeAnimation", -1.0, -5.0, true)
		weaponwedge_open = false
