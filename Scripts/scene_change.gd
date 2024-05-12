extends Area2D

var hit = false
func _on_body_entered(_body):
	print("hit")
	hit = true
	
