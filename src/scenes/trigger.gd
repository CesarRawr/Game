extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_trigger_body_entered(body):
	if body.name == "Player":
		body.run_speed = 0
		body.get_child(2).offset = Vector2(-150, -50)
