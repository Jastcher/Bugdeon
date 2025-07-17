extends CharacterBody2D


@export var SPEED = 1200.0
@export var SHOOTINTERVAL = 1. #s

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
	rotate(get_angle_to(mousePos))
	
	
func Move(delta: float) -> void:
	var dirVector := Input.get_vector("left", "right", "up", "down")
	if dirVector:
		velocity = dirVector * SPEED * delta
	else:
		velocity = Vector2(0,0)
	move_and_slide()


func _on_timer_timeout() -> void:
	canShoot = true
