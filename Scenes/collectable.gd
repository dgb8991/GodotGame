extends Area2D
@onready var game_manager: Node = %GameManager
@onready var collectable: AudioStreamPlayer2D = $"../../maincharacter/Collectable"




func _on_body_entered(body: Node2D) -> void:
	if (body.name == "maincharacter"):
		collectable.play()
		queue_free()
		game_manager.add_point()
