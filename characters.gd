extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_texture_button_mouse_entered() -> void:
	animation_player.play("DeleteAnimLater",1,1.0,false)


func _on_texture_button_mouse_exited() -> void:
	animation_player.seek(animation_player.current_animation_length, true) # Jump to end
	animation_player.play("DeleteAnimLater", -1.0, -5.0, true)

func _on_texture_button_button_down() -> void:
	print("Hello World")
