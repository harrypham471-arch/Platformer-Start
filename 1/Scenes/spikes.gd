extends StaticBody2D

func on_body_entered(body: Node2D):
	if (body.name == "CharacterBody2D"):
		get_tree().reload_current_scene()
