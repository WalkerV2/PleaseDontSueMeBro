extends Control
@onready var weapon_anim_player: AnimationPlayer = $WeaponIcon/WeaponAnimPlayer

var weapon_open := false
var melee_open := false
var ranged_open := false

func _on_weapon_icon_button_down() -> void:
	if not weapon_open:
		weapon_anim_player.play("WeaponAnimation")
		weapon_open = true
		melee_open = false  
		ranged_open = false
	else:
		weapon_anim_player.seek(weapon_anim_player.current_animation_length, true)
		weapon_anim_player.play("WeaponAnimation", -1.0, -5.0, true)
		weapon_open = false

func _on_melee_button_down() -> void:
	if not melee_open:
		weapon_anim_player.play("WeaponMeleeAnimation")
		melee_open = true
		weapon_open = false
		ranged_open = false  
	else:
		weapon_anim_player.seek(weapon_anim_player.current_animation_length, true)
		weapon_anim_player.play("WeaponMeleeAnimation", -1.0, -5.0, true)
		melee_open = false 

func _on_ranged_button_down() -> void:
	if   not ranged_open:
		weapon_anim_player.play("WeaponRangedAnimation")
		melee_open = false
		weapon_open = false
		ranged_open = true
	else:
		weapon_anim_player.seek(weapon_anim_player.current_animation_length, true)
		weapon_anim_player.play("WeaponRangedAnimation", -1.0, -5.0, true)
		ranged_open = false 
