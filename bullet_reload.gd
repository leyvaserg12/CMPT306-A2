extends Node
class_name BulletReload

@export var spawn_rate : float = 5
@export var next_time_to_spawn : float = 0.0
@export var bullet_scene : PackedScene
@export var target_node : Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_select"):
		var new_obstacle := bullet_scene.instantiate()
		target_node.add_child(new_obstacle)
		
