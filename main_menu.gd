extends Node2D

func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_puntajes_pressed() -> void:
	get_tree().change_scene_to_file("res://scores.tscn")
