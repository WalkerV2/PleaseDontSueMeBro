extends TextureButton

@onready var avatar_icon: TextureRect = $AvatarIcon
@onready var button_container: HBoxContainer = $"../AvatarSContainer/AvatarHContainer"

func _ready() -> void:
	for child in button_container.get_children():
		if child is TextureButton:
			child.pressed.connect(_on_character_button_pressed.bind(child))

func _on_character_button_pressed(button: TextureButton) -> void:
	var name := button.name  # "Berenica", "Daphne", etc.
	
	# --- 1. Update Fullart (what you already had) ---
	var tex: Texture2D = Assets.get_fullart(name)
	if tex:
		avatar_icon.texture = tex
	else:
		push_warning("No fullart found for: %s" % name)


	# --- 2. Load CharacterDataResource from .tres ---
	var path := "res://Resources .tres/Characters/%s.tres" % name
	if ResourceLoader.exists(path):
		var data: CharacterDataResource = load(path)
		_update_ui(data)
	else:
		push_warning("No stats file found for: %s" % name)

# --- 3. Update StatBlock UI ---
func _update_ui(data: CharacterDataResource) -> void:
	# Basic labels (replace paths with your actual scene structure)
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
	$"../../CharacterStats/StatBlock/Stat Numbers/LevelLabel".text = str(data.level)

	# Introns "res://Scripts/global/IntronDictionary.gd"
	var introns_dict: Dictionary = IntronDictionary.get_all_introns(data.name)

# Loop through fixed slots



'''
# Skills
	var skills_dict: Dictionary = SkillDictionary.get_all_skills(data.name)
	var j := 0
	for key in skills_dict.keys():
		var label := $SkillsBlock.get_child(j)
		var skill: Dictionary = skills_dict[key]  # Explicit type
		for skill_name in skill.keys():
			label.text = "%s: %s" % [skill_name, skill[skill_name]]
		j += 1
'''
