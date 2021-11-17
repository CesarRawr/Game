extends Area2D

export var scene = ''

func _on_Next_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://src/scenes/" + scene + ".tscn")

	if body.name == "Brother":
		get_parent().remove_child(get_parent().get_child(2))
		yield(get_tree().create_timer(.2), "timeout")
		get_parent().get_child(1).speed = 250
