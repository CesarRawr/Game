extends AudioStreamPlayer

var x
var actual
var anterior = 9999999

# Called when the node enters the scene tree for the first time.
func _ready():
	actual = get_parent().get_child(2).get_global_transform().get_origin().x
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	x = get_parent().get_child(2).get_global_transform().get_origin().x
	
	if x < actual:
		actual = x
		get_parent().get_child(11).volume_db = ((x/x)-0.90) + get_parent().get_child(11).volume_db
	elif x > actual:
		actual = x
		get_parent().get_child(11).volume_db =  get_parent().get_child(11).volume_db - ((x/x)-0.90)
