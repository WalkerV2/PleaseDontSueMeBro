extends Resource
class_name DemonWedgeResource

enum TrackType {
	Fire,
	Moon,
	Star,
	Circle,
}
enum WedgeType {
	Character,
	Melee, 
	Ranged, 
	Melee_Consonance,
	Ranged_Consonance,
}
enum WedgeClass {
	Phoenix_1,
	Phoenix_2,
	Phoenix_3,
	Pan_1,
	Pan_2,
	Pan_3,
	Griffin_1,
	Griffin_2,
	Griffin_3,
	Siren_1,
	
	Kukulkan_1, # why  is it called this
	Kukulkan_2,
	Kukulkan_3,
	Sphinx_1,
	
	Typhon_1,
	Typhon_2,
	Typhon_3,
	Typhon_Lumino,
	Typhon_Anemo,
	Typhon_Electro,
	Typhon_Pyro,
	Typhon_Hydro,
	Typhon_Umbro,

	Covenanter_Lumino,
	Covenanter_Anemo,
	Covenanter_Electro,
	Covenanter_Pyro,
	Covenanter_Hydro,
	Covenanter_Umbro,
	
	Jormungand,
	Helios,
}
enum CharacterType {
	Lumino,
	Anemo,
	Electro,
	Pyro,
	Hydro,
	Umbro,
}
@export var track_type: TrackType = TrackType.Fire

@export var name: String
@export var fullart: Texture2D
@export var avatar: Texture2D
@export var title: Texture2D

@export var mod_1: String
@export var mod_2: String
@export var mod_3: String
@export var mod_4: String

@export var wedge_type: WedgeType = WedgeType.Character

@export var character_type: CharacterType = CharacterType.Pyro
@export var level: int
