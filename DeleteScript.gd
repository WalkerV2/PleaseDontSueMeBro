extends Control

@onready var hover_helper1 = preload("res://Hover_Tween.gd").new()
@onready var hover_helper2 = preload("res://Hover_Tween2.gd").new()

func _ready() -> void:
	hover_helper1.apply_to_all_fullart1(self)
	hover_helper2.apply_to_all_fullart2(self)
'''Im going to guess what each hard coded variable COULD be
weapon_attack = weapon, weapon lvl, weapon intron lvl (duplicates)
weapon_crit_chance/damage/attack_speed/trigger_probability/multishot are all going to be like weapon_attack

Weaponpassive's are also going to be = weapon, weapon lvl, weapon intron lvl (dupes)
==================================================
func _ready():
	for level in range(1, 21): # 1 to 20 inclusive
		var value = get_value_for_level(level)
		print("Level ", level, ": ", value)

# this is the growth rate for weapon_attack probably
just find the base stat for each weapon, and then  use this math for it.

assume all wedges scale linearly

func get_value_for_level(level: int) -> float:
	var raw_value = 15.0 * pow(1.0575, level - 1)
	return round(raw_value * 100) / 100.0
	=====================================
weaponwedge = rarity (1-5), 

character_attack = character, character lvl, character intron,
character_skill_damage = same as attack

character_total_attack = character wedges(rarity) bonuses only,

characterwedge_total_attack = character wedges(rarity), geniemon lvl,

geniemon_element_attack = geniemon, geniemon lvl, 
geniemon_wedge_bonus = geniemon, geniemon lvl,

wedge wedge bonus = some wedges only give "wedge bonus" as a modifier
'''
var level: int = 16	
var value: float = 15.0 * pow(1.0575, level - 1)

#Please input weapon stats with no wedges
var weapon_attack = 30.85
var weapon_crit_chance = 0.15
var weapon_crit_damage = 1.50
var weapon_attack_speed = 1.00
var weapon_trigger_probability = 0.30
var weapon_multishot = 1.00

#Please input passive stats from equipped weapons
var weaponpassive_skill_damage = 0.00
var weaponpassive_berserker = 0.24
var weaponpassive_morale = 0.00
var weaponpassive_crit_chance = 0.00
var weaponpassive_crit_damage = 0.00
var weaponpassive_multishot = 0

#Please input stats from weapon wedges
var weaponwedge_total_attack = 0.00
var weaponwedge_total_type_attack = 0.00
var weaponwedge_total_crit_chance = 0.9960
var weaponwedge_total_crit_damage = 0.9960
var weaponwedge_total_attack_speed = 0.4980
var weaponwedge_total_trigger_probability = 0.00
var weaponwedge_total_multishot = 0.4980

#Please input character stats with no wedges
var character_attack = 231.35
var character_skill_damage = 1.00

#Please input stats from character wedges not affected by bonuses
var character_total_attack = 0.75
var character_total_skill_damage = 1.80
var character_total_morale = 0.00
var character_total_berserker = 0.00
var character_total_damage_dealt = 0.00

#Please input stats from character wedges affected by bonuses
var characterwedge_total_attack = 0.30
var characterwedge_total_skill_damage = 0.00
var characterwedge_total_morale = 0.00
var characterwedge_total_berserker = 0.11
var characterwedge_total_damage_dealt = 0.27

#Please input Geniemon stats
var geniemon_element_attack = 0.40
var geniemon_wedge_bonus = 0.20

#Please input bonus % from wedges
var wedge_bonus = 0.20

var include_critical_hits: bool = true
var include_2x_damage_triggers: bool = true
var consonance_weapon: bool = true
var calculate_with_max_morale: bool = true
var calculate_with_max_berserker: bool = true

# 1. Weapon Total Attack
var total_weapon_attack = \
weapon_attack * (1.0 + weaponwedge_total_attack + weaponwedge_total_type_attack)

# 2. Character Total Attack
var total_character_attack = \
character_attack * ((1.0 + geniemon_element_attack) * ((1.0 + character_total_attack) + (characterwedge_total_attack * (1.0 + geniemon_wedge_bonus + wedge_bonus))))

# 3. Net Attack
var total_net_attack = \
total_weapon_attack + total_character_attack

# 4. Crit Chance
var total_crit_chance = \
(weapon_crit_chance / (1.0 + weaponpassive_crit_chance)) * (1.0 + weaponpassive_crit_chance + weaponwedge_total_crit_chance)

# 5. Crit Damage
var total_crit_damage = \
(weapon_crit_damage / (1.0 + weaponpassive_crit_damage)) * (1.0 + weaponpassive_crit_damage + weaponwedge_total_crit_damage)

# 6. Attack Speed
var total_attack_speed = \
weapon_attack_speed * (1.0 + weaponwedge_total_attack_speed)

# 7. Trigger Probability
var total_trigger_probability = \
weapon_trigger_probability * (1.0 + weaponwedge_total_trigger_probability)

# 8. Multishot
var total_multishot = \
weapon_multishot * (1.0 + weaponwedge_total_multishot)

# 9. Skill Damage
var total_skill_damage = \
character_skill_damage + (characterwedge_total_skill_damage * (1.0 + geniemon_wedge_bonus + wedge_bonus)) + character_total_skill_damage

# 10. Morale %
var total_morale = \
(characterwedge_total_morale * (1.0 + geniemon_wedge_bonus + wedge_bonus)) + weaponpassive_morale + character_total_morale

# 11. Berserker %
var total_berserker = \
(characterwedge_total_berserker * (1.0 + geniemon_wedge_bonus + wedge_bonus)) + weaponpassive_berserker + character_total_berserker

# 12. Total Damage Dealt %
var total_damage_dealt = \
characterwedge_total_damage_dealt * (1.0 + geniemon_wedge_bonus + wedge_bonus) + character_total_damage_dealt

###########################################

var crit_chance_modulo = \
fmod(total_crit_chance, 1.0) if include_critical_hits == true else 0.0

var crit_tier = \
(1.0 + (total_crit_chance - crit_chance_modulo)) if include_critical_hits == true else 1.0

var tiered_crit_damage = \
 (total_crit_damage * crit_tier) if include_critical_hits == true else 1.0

var effective_attack_if_crit = \
total_net_attack * tiered_crit_damage

var effective_attack_if_no_crit = \
(total_net_attack if crit_tier == 1.0 else total_net_attack * total_crit_damage * (crit_tier - 1.0))

var average_effective_attack_after_crit_calculations = \
(effective_attack_if_crit * crit_chance_modulo)+(effective_attack_if_no_crit * (1-crit_chance_modulo))

var effective_attack_if_trigger = \
(average_effective_attack_after_crit_calculations * 2 if include_2x_damage_triggers == true else average_effective_attack_after_crit_calculations)

var effective_attack_if_no_trigger = \
average_effective_attack_after_crit_calculations

var average_effective_attack_after_trigger_calculations = \
(effective_attack_if_trigger * total_trigger_probability)+((1-total_trigger_probability)*effective_attack_if_no_trigger)

var effective_consonance_attack = \
average_effective_attack_after_trigger_calculations * total_skill_damage if consonance_weapon == true else average_effective_attack_after_trigger_calculations

var effective_morale_attack = \
(effective_consonance_attack * (1.0 + total_morale)if calculate_with_max_morale == true else effective_consonance_attack)

var effective_berserker_attack = \
(effective_morale_attack * (1.0 + total_berserker)if calculate_with_max_berserker == true else effective_morale_attack)

var effective_damage_dealt = \
effective_berserker_attack * (1 + total_damage_dealt)

var effective_dps = \
effective_damage_dealt * total_attack_speed * total_multishot

var max_hit = total_net_attack \
	* (total_crit_damage if include_critical_hits == true else 1.0) \
	* (2.0 if include_2x_damage_triggers == true else 1.0) \
	* (total_skill_damage if consonance_weapon == true else 1.0) \
	* ((1.0 + total_morale) if calculate_with_max_morale == true else 1.0) \
	* (((1.0 + total_berserker) if calculate_with_max_berserker == true else 1.0) * (1.0 + total_damage_dealt))

func _on_button_button_down() -> void:
	print(total_weapon_attack) #expects 30.85

func _on_button_2_button_down() -> void:
	print(total_character_attack) #expects 702.8413

func _on_button_3_button_down() -> void:
	print(total_net_attack) #expects 733.6913

func _on_button_4_button_down() -> void:
	print(total_crit_chance) #expects .2994

func _on_button_5_button_down() -> void:
	print(total_crit_damage) #expects 2.9940

func _on_button_6_button_down() -> void:
	print(total_attack_speed) #expects 1.498

func _on_button_7_button_down() -> void:
	print(total_trigger_probability) #expects 0.30

func _on_button_8_button_down() -> void:
	print(total_multishot) #expects 1.498

func _on_button_9_button_down() -> void:
	print(total_skill_damage) #expects 2.8

func _on_button_10_button_down() -> void:
	print(total_morale) #expects 0.0

func _on_button_11_button_down() -> void:
	print(total_berserker) #expects .3940

func _on_button_12_button_down() -> void:
	print(total_damage_dealt) #expets .3780

func _on_button_13_button_down() -> void:
	print(crit_chance_modulo) #expects .2994

func _on_button_14_button_down() -> void:
	print(crit_tier) #expects 1

func _on_button_15_button_down() -> void:
	print(tiered_crit_damage) #expects 2.994

func _on_button_16_button_down() -> void:
	print(effective_attack_if_crit) #expects 2196.6717522

func _on_button_17_button_down() -> void:
	print(effective_attack_if_no_crit) #expects 733.6913

func _on_button_18_button_down() -> void:
	print(average_effective_attack_after_crit_calculations) #expects 1171.707647

func _on_button_19_button_down() -> void:
	print(effective_attack_if_trigger) #expects 2343.415295

func _on_button_20_button_down() -> void:
	print(effective_attack_if_no_trigger) #Expects the same as average_effective_attack_after_crit_calc

func _on_button_21_button_down() -> void:
	print(average_effective_attack_after_trigger_calculations) #expects 1523.219942

func _on_button_22_button_down() -> void:
	print(effective_consonance_attack) #expects 4265.015636

func _on_button_23_button_down() -> void:
	print(effective_morale_attack) #expects 4265.015636

func _on_button_24_button_down() -> void:
	print(effective_berserker_attack) #expects 5945.432076

func _on_button_25_button_down() -> void:
	print(effective_damage_dealt) #expects 8192.805401

func _on_button_26_button_down() -> void:
	print(effective_dps) #expects 18384.68809

func _on_button_27_button_down() -> void:
	print(value) #expects 23630.07955
