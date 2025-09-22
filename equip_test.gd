extends TextureRect

# optional: keep track of which slot this is
@export var slot_index: int = -1

func _get_drag_data(at_position: Vector2) -> Variant:
	if texture == null:
		return null   # nothing to drag

	var drag_data = {
		"icon": texture,
		"source_slot": slot_index
	}

	# Drag preview
	var preview = TextureRect.new()
	preview.texture = texture
	preview.custom_minimum_size = Vector2(48, 48)
	set_drag_preview(preview)

	return drag_data
