extends Node

func add_hover_tween(button: TextureButton, icon: TextureRect) -> void:
	button.mouse_entered.connect(func():
		var tween := button.create_tween()
		tween.tween_property(icon, "scale", Vector2(1.2, 1.2), 0.2))

	button.mouse_exited.connect(func():
		var tween := button.create_tween()
		tween.tween_property(icon, "scale", Vector2(1, 1), 0.2))

func apply_to_all_fullart3(root: Node) -> void:
	for child in root.get_children():
		# if this child is a TextureButton and has a Fullart
		if child is TextureButton and child.has_node("Fullart3"):
			var fullart: TextureRect = child.get_node("Fullart3")
			add_hover_tween(child, fullart)
		# recurse down into its children too
		apply_to_all_fullart3(child)
