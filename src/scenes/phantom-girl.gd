extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1200

onready var coyote_timer = $CoyoteTimer

var velocity = Vector2()
var jumping = false

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')

	if jump:
		if is_on_floor() || !coyote_timer.is_stopped():
			coyote_timer.stop()
			jumping = true
			velocity.y = jump_speed
			$AnimatedSprite.animation = "up"
	if right:
		velocity.x += run_speed
		$AnimatedSprite.animation = "right"
	elif left:
		velocity.x -= run_speed
		$AnimatedSprite.animation = "left"
	else:
		$AnimatedSprite.stop()

	$AnimatedSprite.play()

func _physics_process(delta):
	get_input()
	
	var was_on_floor = is_on_floor()
	
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
	if !is_on_floor() && was_on_floor && !jumping:
		coyote_timer.start()
