extends Sprite

func _on_Area2D_body_entered(body):
	if body.collision_layer == 2:
		if body.has_key:
			body.sound.volume_db = 2
			body.sound.stream = load("res://Assets/open_door.wav")
			body.sound.play()
			yield(get_tree().create_timer(0.1), "timeout")
			body.sound.volume_db = 1
			Global.next_level()
		else:
			body.sound.stream = load("res://Assets/door_locked.wav")
			body.sound.play()
