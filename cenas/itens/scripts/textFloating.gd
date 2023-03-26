extends Position2D


var type = ""
var value = ""
var max_size = Vector2(3, 3)
var min_size = Vector2(.1, .1)
var velocity = Vector2.ZERO

onready var label = $Label
onready var tween = $Tween

func _ready():
	randomize()
	
	match type:
		"fruit":
			label.set( "custom_colors/font_color", Color(0, 1, 0) )
			max_size = Vector2(3, 3)
			label.text = "+" + str(value)
		"box":
			label.set( "custom_colors/font_color", Color(1, 0, 0) )
			max_size = Vector2(5, 5)
			label.text = "+" + str(value)
	
	var move_side = randi() % 81 - 40
	velocity = Vector2(move_side, 96)
	
	tween.interpolate_property(self, "scale", self.scale, max_size, .7, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.interpolate_property(self, "rotation_degrees", self.rotation_degrees, -30, .7, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	#tween.interpolate_property(self, "scale", self.scale, min_size, .7, Tween.TRANS_LINEAR, Tween.EASE_OUT, .3)
	tween.start()


func _physics_process(_delta):
	self.position -= velocity * _delta


func _on_Tween_tween_all_completed():
	self.queue_free()
