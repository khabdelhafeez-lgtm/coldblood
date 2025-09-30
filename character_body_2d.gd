extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -650.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
		
	elif direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	if direction:
		$AnimatedSprite2D.play("run")
		velocity.x = direction * SPEED
	else:
		$AnimatedSprite2D.play("idel")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	pass
# Health System
@onready var sprite_health: Sprite2D = $health/SpriteHealth

var health = 3

func Damage():
	print(health)
	health -= 1
	
	velocity.y -= 200
	
	match health :
		
		3:
			sprite_health.frame = 0
		2:
			sprite_health.frame = 1
		1:
			sprite_health.frame = 2
		0:
			sprite_health.frame = 3
			
	if health == 0:
		Die()
	
	
	pass
	
func Die():
	
	get_tree().reload_current_scene()
	
	pass
  	
	
	
	
	
	
	
	
	
	
