extends CharacterBody2D
@onready var player = $"."

@onready var collision_shape_2d = $CollisionShape2D
@onready var animated_sprite_2d = $AnimatedSprite2D



const SPEED = 130.0
var JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var scale_powerup = $"scale powerup"
@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	#Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#Play animation
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else: 
		animated_sprite.play("jump")
	
	#Apply Movement
	if direction :
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func scaleUp():
	animated_sprite_2d.scale.x = 2
	animated_sprite_2d.scale.y = 2
	collision_shape_2d.scale.x = 2
	collision_shape_2d.scale.y = 2
	
func halfSize():
	player.scale.x = 0.5
	player.scale.y = 0.5
	#collision_shape_2d.scale.x = 0.5
	#collision_shape_2d.scale.y = 0.5
