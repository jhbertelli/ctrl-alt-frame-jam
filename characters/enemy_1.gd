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
		self.queue_free()
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if fov.is_chasing:
		position.x += clamp(
			(player.position.x - position.x) / SPEED,
			-3,
			3
		)
		
		player.take_damage(5, self)

	move_and_slide()
