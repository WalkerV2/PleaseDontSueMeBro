extends TextureButton

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data.has("icon")

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if data.has("icon"):
		texture_normal = data["icon"]   # assigns the dropped texture
		var dragged_id = data.get("id", "<no id>")
		print("Assigned", dragged_id, "to", name)
