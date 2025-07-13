extends Area2D

const SPEED: int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += sin(rotation) * SPEED * delta
	position.x += cos(rotation) * SPEED * delta

func _on_body_entered(body: Node2D) -> void:
	print("bullet detects ", body.name)
	if body.has_method("DealDamage"):
		body.DealDamage(1)
		queue_free()
