extends CharacterBody2D

const SPEED = 60.0

var damage = 5
var hp = 10

@onready var fov := $EnemyFOV
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func enemy():
	pass

func take_damage():
	hp -= player.atk
	
	if hp <= 0:
		queue_free()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	#if not is_on_floor():
		#velocity.y += gravity * delta

	if fov.is_chasing:
		var x_distance_to_player = player.position.x - position.x
		
		position.x += clamp(
			x_distance_to_player / SPEED,
			-3,
			3
		)
		position.y += clamp(
			(player.position.y - position.y) / SPEED,
			-3,
			3
		)
		
		$AnimatedSprite2D.flip_h = x_distance_to_player > 0
		player.take_damage(5, self)

	move_and_slide()
