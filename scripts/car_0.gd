extends RigidBody2D


export(float) var fuel = 50
export(float) var vel = 25
export(float) var acel = 15
export(float) var wheel_friction = .1
export(float) var car_rotate_vel =  36000
onready var wheels = [$RigidBody2D, $RigidBody2D2]
onready var suspension = [$PinJoint2D, $PinJoint2D2]
export(float) var suspension_softness = 15

export(float) var fuel_consumption = 2.5
export(float) var fuel_up = 5.0
export(float) var vel_up = 3.0
export(float) var acel_up = .3
export(float) var friction_up = .1
export(float) var car_rotate_vel_up = 3600
export(float) var suspension_softness_up = 1

export(float) var fuel_consumption_MIN = 1.5
export(float) var fuel_MAX  = 100
export(float) var vel_MAX = 150
export(float) var acel_MAX  = 75
export(float) var friction_MAX  = 1
export(float) var car_rotate_vel_MAX  = 360000
export(float) var suspension_softness_MIN = 3

var class_car = null

func _ready():
	$RigidBody2D3.global_position.x = ($PinJoint2D2.global_position.x - $PinJoint2D.global_position.x) / 2
	class_car = ClassCar.new(self, wheels, suspension, car_rotate_vel, vel, acel, suspension_softness, wheel_friction, fuel)
	Global.car_selected = class_car


func _physics_process(delta):
	if Input.is_action_just_pressed("ui_backspace"):
		$lights.visible = !$lights.visible
	
	class_car.move(delta)
