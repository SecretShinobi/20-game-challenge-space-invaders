## Game script for Space Invaders
class_name Game
extends Node


# Variables
var score: int = 0
var lives: int = 3
var aliens_remaining: int = 0

@export var alien: PackedScene
@export var hud: HUD
@export var ball: Ball

# Signals


# Called when the node enters the scene tree for the first time.
func _ready():	
	pass


func _on_scored_points(points: int):
	score += points
	hud.update_hud()
	ball.adjust_speed(50.0)


func _on_life_lost():
	lives -= 1
	if lives <= 0:
		ball.queue_free()
