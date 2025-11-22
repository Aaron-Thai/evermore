extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_started)
	Dialogic.start("timeline1") # Replace with function body.
	Dialogic.signal_event.connect(_on_signal)
	
func _on_timeline_started():
	Fader.fader()
	
func _on_signal(signal_passed_in):
	match signal_passed_in:
		"go_to_end":
			var ending_dict = {
				"Isi" : Dialogic.VAR.Isi,
				"Lilac" : Dialogic.VAR.Lilac
			}
			var highest_points = ending_dict.values().max()
			var which_ending = ending_dict.find_key(highest_points)
			match which_ending: 
				"Isi":
					Dialogic.start("isi_ending")
				"Lilac":
					Dialogic.start("lilac_ending")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
