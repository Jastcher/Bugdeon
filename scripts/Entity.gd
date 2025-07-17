extends Node2D

class_name Entity

var maxHealth : int = 10
var health : int

func Hit(amount: int):
	health -= amount
	if health <= 0:
		Die()
		
func Die():
	queue_free()
