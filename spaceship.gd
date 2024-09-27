extends Node2D
class_name Spaceship

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpaceShipSprite/Area2D.body_entered.connect(_on_body_entered)

func _on_body_entered(body:Node2D) -> void:
	print(body)
	get_tree().change_scene_to_file("res://main_scene.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	pass
