extends Node2D
class_name Bullet

@export var move_speed := 2.0
@export var BulletSprite : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		get_node("BulletSprite").play("bulletAnimation")
		
	else:
		get_node("BulletSprite").play("Idle")
	pass
	
func _physics_process(delta: float) -> void:
	pass
