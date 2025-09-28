extends Panel

@onready var label = $Label

@onready var time_manager: Node = %Time_Manager

var game_started = false

var frame = 0


func _process(delta):
	label.text = str(time_manager.give_time())
	frame += 1
	
	if (frame == 60):
		time_manager.change_time(-1)
		frame = 0

	if (time_manager.give_time() <= 0):
		get_tree().reload_current_scene()
