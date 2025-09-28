extends Node2D
 
 
const SPEED: int = 600
 
 
func _ready() -> void:
	queue_free()
	
func _process(delta: float) -> void:
	position += transform.x * SPEED * delta

 
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
 
func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "Area2D"):
		print("hi")
