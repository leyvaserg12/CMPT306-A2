extends Node2D
class_name Spaceship

@export var move_speed := 5.0

@export var AnimatedSprite : AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_body_entered(body:Node2D) -> void:
	print(body)
	get_tree().change_scene_to_file("res://main_scene.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		get_node("SpaceshipSprite").play("rotateLeft")
	elif Input.is_action_pressed("ui_right"):
		get_node("SpaceshipSprite").play("rotateRight")
	else:
		get_node("SpaceshipSprite").play("Idle")

	
func _physics_process(delta: float) -> void:
	self.rotation -= 0.0
	
	if Input.is_action_pressed("ui_left"):
		self.rotation -= delta*move_speed
	if Input.is_action_pressed("ui_right"):
		self.rotation += delta*move_speed
	pass
