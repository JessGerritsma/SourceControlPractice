extends Node2D



@onready var animated_sprite = $"../AnimatedSprite2D"
@onready var collision_shape_2d = $"../CollisionShape2D"
 #Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animated_sprite.scale.x = 2
	animated_sprite.scale.y = 2
	collision_shape_2d.scale.x = 2
	collision_shape_2d.scale.y = 2
