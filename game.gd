extends Node2D

@onready var bullets = $bulletContainers
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.connect("bullet_fired", _on_player_bullet_fired)

func _on_player_bullet_fired(bullet):
	bullets.add_child(bullet)
