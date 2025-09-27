extends CharacterBody2D


const SPEED = 360.0
const JUMP_VELOCITY = -400.0
@onready var sprite_2d = $Sprite2D
var totalpoints = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	#Animations
	if(velocity.x > 1 or velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
		if velocity.y > 0:
			sprite_2d.animation = "falling"
		if velocity.y < 0:
			sprite_2d.animation = "jumping"

	# Handle jump.
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 17)

	move_and_slide()
	
	if Input.is_action_just_pressed('left'):
		sprite_2d.flip_h = true
	if Input.is_action_just_pressed('right'):
		sprite_2d.flip_h = false
