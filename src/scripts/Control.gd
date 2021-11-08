extends Control

export var msg = [""]
export var scene = ""

var dialog_index = 0
var finished = false
var text_speed = 0.07

func _ready():
	$Text.bbcode_text = ''
	load_dialog()

func _process(delta):
	$Next.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	if dialog_index < msg.size():
		finished = false
		$Text.bbcode_text = msg[dialog_index]
		$Text.percent_visible = 0
		var tween_duration = text_speed * msg[dialog_index].length()
		$Tween.interpolate_property(
			$Text, "percent_visible", 0, 1, tween_duration,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		get_parent().get_child(6).texture.get_gradient().set_color(0, Color(0,0,0,1))
		yield(get_tree().create_timer(0.5), "timeout")
		queue_free()
		get_tree().change_scene("res://src/scenes/" + scene + ".tscn")
	dialog_index +=1


func _on_Tween_tween_completed(object, key):
	finished = true
