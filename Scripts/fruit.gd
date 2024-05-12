extends Area2D

@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	body.scaleUp()
	animation_player.play("fruitpickup")
