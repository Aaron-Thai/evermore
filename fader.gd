extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func fader():
	animation_player.play("fade")
