extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1200

var velocity = Vector2()

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')

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
	velocity = move_and_slide(velocity, Vector2(0, -1))
