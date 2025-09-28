extends RigidBody2D 
@onready var time_manager: Node = %Time_Manager


func _on_area_2d_body_entered(body: Node2D) -> void:

	if (body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		if (y_delta > 20):
			queue_free()
			body.jump()
		else:
			time_manager.change_time(-15)
			print(time_manager.give_time())
		
