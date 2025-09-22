extends Resource
class_name CharacterDataResource
enum WeaponMastery {
	SWORD,
	GREATSWORD,
	POLEARM,
	KATANA,
	WHIPSWORD,
	SHOTGUN,
	DUAL_PISTOLS,
	BOW,
	GRENADE_LAUNCHER,
	ASSAULT_RIFLE}
#Char images + name for display
@export var name: String
@export var fullart: Texture2D
@export var avatar: Texture2D
@export var title: Texture2D

#Character stats format #Customize per character in their respective .tres
@export var hp: int = 100
@export var shield: int = 0
@export var def: int = 0
@export var umbro_atk: int = 0

# Skill-related base stats
@export var skill_dmg: float = 1.0
@export var skill_range: float = 1.0
@export var skill_duration: float = 1.0
@export var skill_efficiency: float = 1.0

# Misc. Stats
@export var morale: float = 0.0
@export var berserker: float = 0.0
@export var weapon_mastery: WeaponMastery = WeaponMastery.SWORD  
@export var level: int = 1
@export var intron: String = ""           
#Keep the intron string, for assigning it a value for proper Data acquirement when needed
#Creates a nice Menu for the inspector

@export_group("Introns")
@export var intron_1: IntronData
@export var intron_2: IntronData
@export var intron_3: IntronData
@export var intron_4: IntronData
@export var intron_5: IntronData
@export var intron_6: IntronData
#Nice menu for the inspector
@export_group("Skills")
@export var buff_skill: SkillData
@export var passive_skill: SkillData
@export var unique_skill: SkillData
