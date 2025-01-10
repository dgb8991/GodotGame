extends Area2D
@onready var game_manager: Node = %GameManager
@onready var caracoles: AudioStreamPlayer2D = $"../../maincharacter/Caracoles"




func _on_body_entered(body: Node) -> void:
	if (body.name == "maincharacter"):
		caracoles.play()
		queue_free()
		game_manager.remove_point()
