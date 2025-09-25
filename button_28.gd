extends Button

func _ready():
	for level in range(1, 21): # 1 to 20 inclusive
		var value = get_value_for_level(level)
		print("Level ", level, ": ", value)

func get_value_for_level(level: int) -> float:
	var raw_value = 15.0 * pow(1.0575, level - 1)
	return round(raw_value * 100) / 100.0
