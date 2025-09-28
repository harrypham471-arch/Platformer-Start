extends Node2D

const lazer = preload("res://Bullet/lazer.tscn")
@onready var time_manager: Node = $"../../Time_Manager"

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
 
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
		
	if Input.is_action_just_pressed("click"):
		var bullet_instance = lazer.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = global_position
		bullet_instance.rotation = rotation - 89.5
		time_manager.change_time(-10)
		await get_tree().create_timer(1.5).timeout
		print("Platform Gone!")
		bullet_instance.call_deferred("free")
