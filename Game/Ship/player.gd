class_name Player
extends CharacterBody2D
## This is the class used to define the player character

const SPEED = 500.0
const SPAWNPOINT = Vector2(900.0, 900.0)
var can_shoot: bool = true
@export var bullet: PackedScene

signal shoot(projectile, direction, location)

func _ready():
	set_position(SPAWNPOINT)


func _physics_process(_delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	velocity.x = direction * SPEED
	move_and_slide()


func _input(event):
	if event.is_action_pressed("shoot") and can_shoot:
		var laser = bullet.instantiate()
		laser.is_destroyed.connect(_reload)
		shoot.emit(laser, rotation, position)
		can_shoot = false


func _reload():
	can_shoot = true
