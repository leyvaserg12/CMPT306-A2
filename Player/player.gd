extends RigidBody2D
class_name Player

signal bullet_fired(bullet)

@export var move_speed := 1000.0
@export var recoil := 100
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
	
	# left/right arrows spaceship rotation
	if Input.is_action_pressed("ui_left"):
		apply_torque(-move_speed)
	if Input.is_action_pressed("ui_right"):
		apply_torque(move_speed)
	
	

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = bulletPos.global_position
	bullet.rotation = rotation
	apply_central_impulse(Vector2.DOWN.rotated(rotation) * recoil)
	
	emit_signal("bullet_fired", bullet)

# keeps player in screen view
func warp():
	var prev_pos = position
	var screen_bounds : Vector2 = get_viewport_rect().size / 2.0
	var new_pos = position
	
	new_pos.x = wrapf(new_pos.x, -screen_bounds.x, screen_bounds.x)
	new_pos.y = wrapf(new_pos.y, -screen_bounds.y, screen_bounds.y)
	position = new_pos
	
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	warp()
