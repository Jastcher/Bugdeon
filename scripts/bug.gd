extends RigidBody2D

@onready var player: CharacterBody2D = %Player

const SPEED = 4
const MAXHEALTH = 5

var health: int = MAXHEALTH

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	MoveToPlayer(delta)
	
func MoveToPlayer(delta: float) -> void:
	var angle = get_angle_to(player.position)
	rotate(angle)
	
	position.x += cos(rotation) * SPEED * delta
	position.y += sin(rotation) * SPEED * delta
	
func DealDamage(amount: int):
	#print("damage dealt to: ", name)
	health -= amount
	if health <= 0:
		Die()
		
func Die():
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	print("bug detects ", body.name)
