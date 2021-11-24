extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1), "timeout")
	
	get_parent().get_child(2).set_texture(load("res://src/characters/dad/tile001.png"))
	get_parent().get_child(2).flip_h = true
	
	#Obtención de cortina
	yield(get_tree().create_timer(1), "timeout")
	get_parent().get_child(4).texture.get_gradient().set_color(0, Color(0,0,0,1))
	
	yield(get_tree().create_timer(1), "timeout")
	get_parent().get_child(2).position.x = 620
	get_parent().get_child(4).texture.get_gradient().set_color(0, Color(0,0,0,0.8))
	pass
