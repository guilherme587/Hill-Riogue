extends Node2D

var cars :Array = [preload("res://cenas/cars/car_0.tscn"),
					preload("res://cenas/cars/car_1.tscn")]


func _ready():
	OS.window_fullscreen = true
	var carInstance = cars[Global.car].instance()
	add_child(carInstance)
	carInstance.global_position = $position_spaw.global_position


func _process(delta):
	if Input.is_action_pressed("ui_reload"):
		get_tree().reload_current_scene()
	if Input.is_action_just_released("ui_pause"):
		get_tree().change_scene("res://UI/GUI/menu_select_car.tscn")
	if Input.is_action_just_pressed("ui_f11"):
		OS.window_fullscreen = !OS.window_fullscreen 
