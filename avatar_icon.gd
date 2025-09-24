extends TextureButton

@onready var avatar_icon: TextureRect = $AvatarIcon
@onready var button_container: HBoxContainer = $"../AvatarSContainer/AvatarHContainer"

func _ready() -> void:
	for child in button_container.get_children():
		if child is TextureButton:
			child.pressed.connect(_on_character_button_pressed.bind(child))

func _on_character_button_pressed(button: TextureButton) -> void:
	var name := button.name
	var tex: Texture2D = Assets.get_fullart(name)
	if tex:
		avatar_icon.texture = tex
	else:
		push_warning("No fullart found for: %s" % name)
	var path := "res://Resources .tres/Characters/%s.tres" % name
	if ResourceLoader.exists(path):
		var data: CharacterDataResource = load(path)
		_update_ui(data)
	else:
		push_warning("No stats file found for: %s" % name)
		
func _update_ui(data: CharacterDataResource) -> void:
	$"../../CharacterStats/StatBlock/Stat Numbers/NameLabel".text = str(data.name)
	$"../../CharacterStats/StatBlock/Stat Numbers/HpLabel".text = str(data.hp)
	$"../../CharacterStats/StatBlock/Stat Numbers/ShieldLabel".text = str(data.shield)
	$"../../CharacterStats/StatBlock/Stat Numbers/DefLabel".text = str(data.def)
	$"../../CharacterStats/StatBlock/Stat Numbers/AtkLabel".text = str(data.umbro_atk)

	$"../../CharacterStats/StatBlock/Stat Numbers/SkillDmgLabel".text = str(data.skill_dmg)
	$"../../CharacterStats/StatBlock/Stat Numbers/SkillRangeLabel".text = str(data.skill_range)
	$"../../CharacterStats/StatBlock/Stat Numbers/SkillDurationLabel".text = str(data.skill_duration)
	$"../../CharacterStats/StatBlock/Stat Numbers/SkillEfficiencyLabel".text = str(data.skill_efficiency)

	$"../../CharacterStats/StatBlock/Stat Numbers/MoraleLabel".text = str(data.morale)
	$"../../CharacterStats/StatBlock/Stat Numbers/BerserkerLabel".text = str(data.berserker)
	$"../../CharacterStats/StatBlock/Stat Numbers/WeaponMasteryLabel".text = str(data.weapon_mastery)
	#$"../../CharacterStats/StatBlock/Stat Numbers/LevelLabel".text = str(data.level)

	$"../../IntronControl/IntronSContainer/IntronHContainer/1/Label".text = str(data.intron_1)
	$"../../IntronControl/IntronSContainer/IntronHContainer/2/Label".text = str(data.intron_2)
	$"../../IntronControl/IntronSContainer/IntronHContainer/3/Label".text = str(data.intron_3)
	$"../../IntronControl/IntronSContainer/IntronHContainer/4/Label".text = str(data.intron_4)
	$"../../IntronControl/IntronSContainer/IntronHContainer/5/Label".text = str(data.intron_5)
	$"../../IntronControl/IntronSContainer/IntronHContainer/6/Label".text = str(data.intron_6)


func _on_avatar_level_value_changed(value: float) -> void:
	$"../../CharacterStats/StatBlock/Stat Numbers/LevelLabel".text = str(value)
