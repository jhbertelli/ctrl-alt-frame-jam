extends Area2D

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
@export var is_chasing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_body_entered(body: Node2D):
	# temp: find another way of knowing if body is player
	if body.name == "Altair":
		is_chasing = true

func _on_body_exited(body):
	pass # Replace with function body.
