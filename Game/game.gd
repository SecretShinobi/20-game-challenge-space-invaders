class_name Game
extends Node
## Game script 

# Variables
var score: int = 0
var lives: int = 3
var aliens_remaining: int = 0

@export var alien: PackedScene
@export var bullet: PackedScene
@export var hud: HUD

func _ready():
	pass


func _on_scored_points(points: int):
	score += points
	hud.update_hud()


func _on_life_lost():
	lives -= 1
	if lives <= 0:
		pass # TODO: Implement


func _on_node_2d_shoot(projectile, direction, location):
	projectile.rotation = direction
	projectile.position = location
	projectile.position.y -= 50
	projectile.velocity = projectile.velocity.rotated(direction)
	projectile.is_destroyed.connect(_on_laser_is_destroyed)
	add_child(projectile)


func _on_laser_is_destroyed():
	pass
