extends Area2D

export var scene = "default"

func _on_Next_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://src/scenes/" + scene + ".tscn")
