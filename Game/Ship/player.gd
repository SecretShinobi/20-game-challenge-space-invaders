class_name Player
extends CharacterBody2D
## This is the class used to define the player character

const SPEED = 750.0
const SPAWNPOINT = Vector2(900.0, 900.0)

func _ready():
	set_position(SPAWNPOINT)


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	velocity.x = direction * SPEED
	move_and_slide()


func _on_kill_zone_body_entered(_body):
	_reset()


func _reset():
	set_position(SPAWNPOINT)
	set_velocity(Vector2(0.0, 0.0))
