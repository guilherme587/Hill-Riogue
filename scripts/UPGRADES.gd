extends CanvasLayer


func _physics_process(delta):
	if Global.car_selected != null:
		$Label.text = "FRUIT: " + str(Global.car_selected.fruit_maca + Global.car_selected.fruit_banana)


func _on_fuel__pressed():
	Global.car_selected.set_fuel(-1)


func _on_fuel_plus_pressed():
	Global.car_selected.set_fuel()


func _on_vel__pressed():
	Global.car_selected.set_vel(-1)


func _on_vel_plus_pressed():
	Global.car_selected.set_vel()


func _on_acel__pressed():
	Global.car_selected.set_acel(-1)


func _on_acel_plus_pressed():
	Global.car_selected.set_acel()


func _on_friction__pressed():
	Global.car_selected.set_friction(-1)


func _on_friction_plus_pressed():
	Global.car_selected.set_friction()


func _on_rotate_car__pressed():
	Global.car_selected.set_car_rotate_vel(-1)


func _on_rotate_car_plus_pressed():
	Global.car_selected.set_car_rotate_vel()



func _on_suspension__pressed():
	Global.car_selected.set_suspension(-1)


func _on_suspension_plus_pressed():
	Global.car_selected.set_suspension()
