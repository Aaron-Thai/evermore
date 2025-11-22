extends Control

@onready var audio: Button = $VBoxContainer/Audio




func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn") # Replace with function body.

func _on_audio_pressed() -> void:
	if Dialogic.VAR.AudioOn:
		Dialogic.VAR.AudioOn = false
		audio.text = "   Music On   "
	elif Dialogic.VAR.AudioOn == false:
		Dialogic.VAR.AudioOn = true
		audio.text = "   Music Off   "
