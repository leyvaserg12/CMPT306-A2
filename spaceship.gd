extends Node2D
class_name Spaceship

@export var move_speed := 5.0

@export var AnimatedSprite : AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
