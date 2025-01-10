extends Node2D

const SAVEFILE:String = "res://savefile.save"
var highest_record:int = 0
var current_score:int = 0  

@onready var highest_label = $Panel/highest_label

func _ready():
	load_scores()
	update_label_text()

func save_scores():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE_READ)
	file.store_32(highest_record)
	file.store_32(current_score)  
	file.close()

func load_scores():
	if FileAccess.file_exists(SAVEFILE):
		var file = FileAccess.open(SAVEFILE, FileAccess.READ)
		highest_record = file.get_32()
		current_score = file.get_32()  
		file.close()

func update_label_text():
	if highest_label:
		highest_label.text = "Máximo Puntaje: " + str(highest_record) + "\nÚltimo Puntaje: " + str(current_score)

func display_and_save_score(new_score: int) -> void: 
	load_scores() 
	current_score = new_score
	if current_score > highest_record:
		highest_record = current_score
	save_scores()  
	update_label_text()

func _on_regresar_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_borrar_pressed() -> void:
	highest_record = 0
	current_score = 0
	save_scores()
	update_label_text()
