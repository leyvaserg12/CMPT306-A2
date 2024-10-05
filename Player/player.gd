extends CharacterBody2D
class_name Player

signal bullet_fired(bullet)

@export var move_speed := 5.0
@export var AnimatedSprite : AnimatedSprite2D
@onready var bulletPos = $bulletPos

var bullet_scene = preload("res://Player/bullet.tscn")
var cooldown = false
var fire_rate = 0.3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# bullet shooting 
	if Input.is_action_pressed("ui_select") and !cooldown:
		cooldown = true
		shoot()
		await get_tree().create_timer(fire_rate).timeout
		cooldown = false
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
	var bullet = bullet_scene.instantiate()
	bullet.global_position = bulletPos.global_position
	bullet.rotation = rotation
	
	emit_signal("bullet_fired", bullet)
