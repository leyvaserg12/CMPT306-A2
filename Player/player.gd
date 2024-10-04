extends CharacterBody2D
class_name Spaceship

@onready var bullet = load("res://Player/bullet.tscn")
@onready var main = get_tree().get_root().get_node("Main Scene")
@export var bullet_speed = 1000
@export var move_speed := 5.0
@export var AnimatedSprite : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shoot()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_select"):
		shoot()
		
		
	# left thruster animation
	if Input.is_action_pressed("ui_left"):
		AnimatedSprite.play("rotateLeft")
		
	#right thruster animation
	elif Input.is_action_pressed("ui_right"):
		AnimatedSprite.play("rotateRight")
	
	#idle animation
	else:
		AnimatedSprite.play("Idle")
		
	
	
func _physics_process(delta: float) -> void:
	self.rotation -= 0.0
	
	# left/right arrows spaceship rotation
	if Input.is_action_pressed("ui_left"):
		self.rotation -= delta*move_speed
	if Input.is_action_pressed("ui_right"):
		self.rotation += delta*move_speed
	pass
	
func shoot():
	var bullet_instance = bullet.instantiate()
	bullet_instance.position = $bulletPos.get_global_position()
	bullet_instance.rotation_degrees = rotation
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().add_child(bullet_instance)
	
	
