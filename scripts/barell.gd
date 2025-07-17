extends Node2D


@export var maxHealth = 2

var health: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = maxHealth


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func Hit(damage: int):
	health -= damage
	if health <= 0:
		Destroy()
		
func Destroy():
	queue_free()
	
	
