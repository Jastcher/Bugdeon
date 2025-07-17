extends RigidBody2D

@onready var player: CharacterBody2D = %Player

const SPEED = 4
const MAXHEALTH = 5

var health: int = MAXHEALTH

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_contacts_reported = 1
	contact_monitor = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	MoveToPlayer(delta)
	
func MoveToPlayer(delta: float) -> void:
	var angle = get_angle_to(player.position)
	rotate(angle)
	
	var newPos = Vector2.ZERO
	newPos.x += cos(rotation) * SPEED * delta
	newPos.y += sin(rotation) * SPEED * delta
	
	#position += newPos
	
	move_and_collide(newPos)
	
func DealDamage(amount: int):
	#print("damage dealt to: ", name)
	health -= amount
	if health <= 0:
		Die()
		
func Die():
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Detected ", body.name)
