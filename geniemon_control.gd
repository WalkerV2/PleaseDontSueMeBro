extends Control

@onready var geniemon_anim_player: AnimationPlayer = $GeniemonIcon/GeniemonAnimPlayer
var geniemon_open := false
var gray_open := false
var green_open := false
var blue_open := false
var purple_open := false
var gold_open := false



func _on_geniemon_icon_button_down() -> void:
	if not geniemon_open:
		geniemon_anim_player.play("GeniemonAnimation")
		geniemon_open = true
	else:
		geniemon_anim_player.seek(geniemon_anim_player.current_animation_length, true)
		geniemon_anim_player.play("GeniemonAnimation", -1.0, -5.0, true)
		geniemon_open = false
		gray_open = false
		green_open = false
		blue_open = false
		purple_open = false
		gold_open = false

func _on_grey_button_button_down() -> void:
	if not gray_open:
		geniemon_anim_player.play("GeniemonGoldAnimation")
		gray_open = true
	else:
		geniemon_anim_player.seek(geniemon_anim_player.current_animation_length, true)
		geniemon_anim_player.play("GeniemonGoldAnimation", -1.0, -5.0, true)
		gray_open = false
		geniemon_open = false
		green_open = false
		blue_open = false
		purple_open = false
		gold_open = false


func _on_green_button_button_down() -> void:
	if not green_open:
		geniemon_anim_player.play("GeniemonPurpleAnimation")
		green_open = true
	else:
		geniemon_anim_player.seek(geniemon_anim_player.current_animation_length, true)
		geniemon_anim_player.play("GeniemonPurpleAnimation", -1.0, -5.0, true)
		green_open = false
		geniemon_open = false
		gray_open = false
		blue_open = false
		purple_open = false
		gold_open = false


func _on_blue_button_button_down() -> void:
	if not blue_open:
		geniemon_anim_player.play("GeniemonBlueAnimation")
		blue_open = true
	else:
		geniemon_anim_player.seek(geniemon_anim_player.current_animation_length, true)
		geniemon_anim_player.play("GeniemonBlueAnimation", -1.0, -5.0, true)
		blue_open = false
		geniemon_open = false
		green_open = false
		gray_open = false
		purple_open = false
		gold_open = false


func _on_purple_button_button_down() -> void:
	if not purple_open:
		geniemon_anim_player.play("GenieGreenAnimation")
		purple_open = true
	else:
		geniemon_anim_player.seek(geniemon_anim_player.current_animation_length, true)
		geniemon_anim_player.play("GenieGreenAnimation", -1.0, -5.0, true)
		purple_open = false
		geniemon_open = false
		green_open = false
		blue_open = false
		gray_open = false
		gold_open = false

func _on_gold_button_button_down() -> void:
	if not gold_open:
		geniemon_anim_player.play("GeniemonGreyAnimation")
		gold_open = true
	else:
		geniemon_anim_player.seek(geniemon_anim_player.current_animation_length, true)
		geniemon_anim_player.play("GeniemonGoldAnimation", -1.0, -5.0, true)
		gold_open = false
		geniemon_open = false
		green_open = false
		blue_open = false
		purple_open = false
		gray_open = false
