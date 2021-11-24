extends Control

export var msg = [""]
export var scene = ""
export var text_speed = 0.07

var dialog_index = 0
var finished = false
export var start = false
var piv = 0

export var loadText = false

func _ready():
	$Text.bbcode_text = ''
	if start:
		load_dialog()
		pass
	else:
		yield(get_tree().create_timer(4.6), "timeout")
		start = true
		piv = 1

func _process(delta):
	if start && piv == 1:
		load_dialog()
		piv = 0
		print(start)
	
	$Next.visible = finished
	if Input.is_action_just_pressed("ui_accept") && loadText && start:
		load_dialog()

func load_dialog():
	if dialog_index < msg.size():
		finished = false
		$Text.bbcode_text = "[center]" + msg[dialog_index] + "[center]"
		$Text.percent_visible = 0
		var tween_duration = text_speed * msg[dialog_index].length()
		$Tween.interpolate_property(
			$Text, "percent_visible", 0, 1, tween_duration,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
		get_tree().change_scene("res://src/scenes/" + scene + ".tscn")
	dialog_index +=1


func _on_Tween_tween_completed(object, key):
	finished = true
