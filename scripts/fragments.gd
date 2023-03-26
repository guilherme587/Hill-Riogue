extends Node2D

export(float) var bounce_force = 0.4


func _ready():
	for rigid in get_node("rigids").get_children():
		rigid.bounce = bounce_force
	
	yield(get_tree().create_timer(7), "timeout")
	$AnimationPlayer.play("destroy")
	yield($AnimationPlayer, "animation_finished")
	self.queue_free()
