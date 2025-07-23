class_name Laser
extends Area2D


const SPEED: float = 500.0
var velocity = Vector2.UP * SPEED 

signal is_destroyed


func _physics_process(delta):
	position += velocity * delta


func _on_visible_on_screen_notifier_2d_screen_exited(): 
	is_destroyed.emit()
	queue_free()
