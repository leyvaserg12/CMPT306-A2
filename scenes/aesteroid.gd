class_name Asteroid extends Area2D

signal exploded(position, size, points)
# asteroid movement
var movement_vector := Vector2(1,0)

# changing the sprite size and speed
enum asteroid_size{large, medium, small}
@export var size := asteroid_size.large
var speed := 200

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D

var points: int:
	get:
		match size:
			asteroid_size.large:
				return 100
			asteroid_size.medium:
				return 50
			asteroid_size.small:
				return 25
			_:
				return 0
				

func _ready():
	# random rotation of the asteroid
	rotation = randf_range(0, 2*PI)
	
	
	# different speed depending on size of the asteroid
	match size:
		asteroid_size.large:
			speed = randf_range(50, 100)
			sprite.scale *= 3
			collision.scale *= 3
		asteroid_size.medium:
			speed = randf_range(100, 150)
			sprite.scale *= 1.75
			collision.scale *= 1.75
		asteroid_size.small:
			speed = randf_range(150, 200)
			sprite.scale *= 1
			collision.scale *= 1
			
		
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	# asteroid movement
	global_position += movement_vector.rotated(rotation) * speed * delta
	
	var asteroid_shape = collision.shape.radius
	var screen_size = get_viewport_rect().size
	if global_position.y < -screen_size.y :
		global_position.y = 648 
		print(global_position, screen_size)
	elif global_position.y > 648:
		global_position.y = -screen_size.y + asteroid_shape
	
	if global_position.x < -screen_size.x:
		global_position.x = 1152
	elif global_position.x > 1152:
		global_position.x = -screen_size.x
		


func explode():
	emit_signal("exploded", global_position, size, points)
	queue_free()
	

	
