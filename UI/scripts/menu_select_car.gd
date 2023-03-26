extends CanvasLayer


func _ready():
	pass



func _on_car_0_pressed():
	Global.car = 0


func _on_car_1_pressed():
	Global.car = 1


func _on_Button_pressed():
	get_tree().change_scene("res://cenas/teste.tscn")
