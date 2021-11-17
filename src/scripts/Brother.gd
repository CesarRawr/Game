extends KinematicBody2D

export var speed = -180

var mov = true
var ready = false
var move = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	ready = true
	pass

func _physics_process(delta):
	if ready:
		if mov:
			move.x = speed
			move_and_slide(Vector2(move.x, 0))
