extends KinematicBody2D

onready var sound = get_node("Sound")
var speed : int = 250
var acceleration : float = 0.2
var friction : float = 0.5
var velocity : Vector2 = Vector2.ZERO
var has_key : bool = false

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func get_input():
	look_at(get_global_mouse_position())
	var dir = Vector2.ZERO
	
	if Input.is_action_pressed("left"):
		dir.x -= 1
	
	if Input.is_action_pressed("right"):
		dir.x += 1
	
	if Input.is_action_pressed("up"):
		dir.y -= 1
		
	if Input.is_action_pressed("down"):
		dir.y += 1
		
	if dir.x != 0:
		velocity.x = lerp(velocity.x, dir.x * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		
	if dir.y != 0:
		velocity.y = lerp(velocity.y, dir.y * speed, acceleration)
	else:
		velocity.y = lerp(velocity.y, 0, friction)

func hit():
	Global.reload_level()
