class_name Asteroid extends Area2D

signal exploded(position, size)
# asteroid movement
var movement_vector := Vector2(0,-1)

# changing the sprite size and speed
enum asteroid_size{large, medium, small}
@export var size := asteroid_size.large
var speed := 50

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D


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
	

func explode():
	emit_signal("exploded", global_position, size)
	queue_free()
	
