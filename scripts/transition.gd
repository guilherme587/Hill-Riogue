extends CanvasLayer

export(int, "game", "horizontal_cut")var _mode = 0

func _ready():
	print(_mode)
	get_tree().paused = true
	match _mode:
		0:
			$AnimationPlayer.play("default")
			$AnimationPlayer2.play("commands")
			yield(get_tree().create_timer(5), "timeout")
		1:
			$AnimationPlayer.play("horizontal_cut")
			yield(get_tree().create_timer(.9), "timeout")
	
	self.visible = false
	get_tree().paused = false
