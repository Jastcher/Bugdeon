extends CharacterBody2D


const SPEED = 1200.0
const SHOOTINTERVAL = 1. #s

const BULLET = preload("res://scenes/bullet.tscn")
@onready var shootTimer: Timer = $Timer

var canShoot: bool = true

func _ready() -> void:
	shootTimer.wait_time = SHOOTINTERVAL
	
	
func _physics_process(delta: float) -> void:
	Move(delta)
	Rotate()
	
	if (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		#print("SHOOT!")
		Shoot()

func Shoot() -> void:
	if (!canShoot):
		return
	canShoot = false
	
	var bullet := BULLET.instantiate()
	bullet.position = position
	bullet.rotation = rotation
	
	add_sibling(bullet)
	
	shootTimer.start()
	
func Rotate() -> void:
	var mousePos := get_global_mouse_position()
	#print(mousePos)
	rotate(get_angle_to(mousePos))
	
	
func Move(delta: float) -> void:
	var hDirection := Input.get_axis("left", "right")
	if hDirection:
		velocity.x = hDirection * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var vDirection := Input.get_axis("up", "down")
	if vDirection:
		velocity.y = vDirection * SPEED * delta
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()


func _on_timer_timeout() -> void:
	canShoot = true
