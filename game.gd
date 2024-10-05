extends Node2D

@onready var bullets = $bulletContainers
@onready var player = $Player
@onready var asteroidContainer = $AsteroidContainer

var asteroid_scene = preload("res://scenes/aesteroid.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.connect("bullet_fired", _on_player_bullet_fired)
	
	for asteroid in asteroidContainer.get_children():
		asteroid.connect("exploded", _on_asteroid_exploded)

func _on_player_bullet_fired(bullet):
	bullets.add_child(bullet)

func _on_asteroid_exploded(position, size):
	for i in range(2):
		# make asteroid smaller and double when hit, if smallest size then explode
		match size:
			Asteroid.asteroid_size.large:
				spawnAsteroid(position, Asteroid.asteroid_size.medium)
			Asteroid.asteroid_size.medium:
				spawnAsteroid(position, Asteroid.asteroid_size.small)
			Asteroid.asteroid_size.small:
				pass
				
	
func spawnAsteroid(position, size):
	var asteroid = asteroid_scene.instantiate()
	asteroid.global_position = position
	asteroid.size = size
	asteroid.connect("exploded", _on_asteroid_exploded)
	asteroidContainer.add_child(asteroid)
		
