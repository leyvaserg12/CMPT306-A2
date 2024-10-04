extends Node2D
class_name Bullet

@export var move_speed := 2.0
@export var BulletSprite : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# bullet animation
	pass
	
func _physics_process(delta: float) -> void:
	
	# use self.queue_free() to remove the current instantiation
	# when the bullet hits something ?
	if Input.is_action_just_pressed("ui_select"):
		get_node("BulletSprite").play("bulletAnimation") 
		self.queue_free()
	
	pass
