extends Node2D

@onready var interaction_area := $InteractionArea

# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	print("interagido")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
