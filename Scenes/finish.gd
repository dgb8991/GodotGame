extends Area2D

# Accede al nodo GameManager desde la ruta absoluta
@onready var game_manager = get_tree().get_root().get_node("Main/GameManager")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "maincharacter":
		var current_score = game_manager.points  # Obtiene el puntaje desde game_manager
		var scores_scene = load("res://scores.tscn").instantiate()
		scores_scene.display_and_save_score(current_score)
		get_tree().change_scene_to_file("res://scores.tscn")
