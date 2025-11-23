extends Node2D

# Called when the knife should fly from start_pos to end_pos
func throw(start_pos: Vector2, end_pos: Vector2):
	position = start_pos

	var tween = create_tween()
	tween.tween_property(self, "position", end_pos, 0.4)
	tween.tween_callback(Callable(self, "queue_free"))
