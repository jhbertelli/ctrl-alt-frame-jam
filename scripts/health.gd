extends Label

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# I believe it's not a good idea to maintain this here, but I don't feel like refactoring right now
	# todo: move this code to player script
	text = str("HP: ", player.hp, "/", player.max_hp)
