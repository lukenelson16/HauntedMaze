extends Sprite

func _on_Area2D_body_entered(body):
	if body.collision_layer == 2:
		body.has_key = true
		body.sound.volume_db = 2
		body.sound.stream = load("res://Assets/pick_up_key.wav")
		body.sound.play()
		yield(get_tree().create_timer(0.1), "timeout")
		body.sound.volume_db = 1
		queue_free()
