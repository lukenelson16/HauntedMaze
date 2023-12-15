extends Path2D

onready var hitbox = get_node("PathFollow2D/Hitbox")
var move : bool = true
export (int) var speed = 32

func _physics_process(delta):
	get_move()
	if move:
		get_node("PathFollow2D").set_offset(get_node("PathFollow2D").get_offset() + speed * delta)

func get_move():
	move = true
	var areas = hitbox.get_overlapping_areas()
	for area in areas:
		if area.collision_layer == 2:
			move = false

func _on_Hitbox_body_entered(body):
	if body.collision_layer == 2:
		if !body.sound.playing:
			body.sound.stream = load("res://Assets/death.wav")
			body.sound.play()
			yield(get_tree().create_timer(0.1), "timeout")
			Global.reload_level()
			return
