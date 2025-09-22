extends Control
@onready var hover_helper1 = preload("res://Hover_Tween.gd").new()
@onready var hover_helper2 = preload("res://Hover_Tween2.gd").new()

func _ready() -> void:
	hover_helper1.apply_to_all_fullart1(self)
	hover_helper2.apply_to_all_fullart2(self)
