extends Area2D

var movement_vector := Vector2(0,-1)
@export var speed := 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	global_position += movement_vector.rotated(rotation) * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# deletes bullet when it leaves the screen
	queue_free()
	

func _on_area_entered(area: Area2D) -> void:
	if area is Asteroid:
		var asteroid = area
		asteroid.explode()
		queue_free()
