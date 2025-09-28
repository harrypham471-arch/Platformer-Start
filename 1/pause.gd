extends Node
@onready var pause_panel: Panel = %"Pause Panel"

func _process(delta):
	var esc_pressed = Input.is_action_just_pressed("escape")
	if (esc_pressed == true):
		get_tree().paused = true	
		pause_panel.show()

func _on_resume_pressed() -> void:
	pause_panel.hide()
	get_tree().paused = false


func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	pause_panel.hide()
