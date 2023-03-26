extends Resource
class_name ClassCar


export(PackedScene) var car
export(Array) var wheels
export(Array) var suspensions
export(float) var car_rotate_vel
export(float) var acel
export(float) var vel
export(float) var suspension_softness
export(float) var friction
export(float) var fuel

var fruit_maca :int = 0
var fruit_banana :int = 0


func _init(_car, _wheels, _suspension, _car_rotate_vel, _vel, _acel, _suspension_softness, _friction, _fuel):
	car 					= _car
	wheels 					= _wheels
	suspensions 				= _suspension
	#class atribute
	car_rotate_vel			= _car_rotate_vel
	acel 					= _acel
	vel 					= _vel
	suspension_softness	 	= _suspension_softness
	friction				= _friction
	fuel 					= _fuel
	
	for suspension in suspensions:
		suspension.softness = suspension_softness


func move(delta):
	if Input.is_action_pressed("ui_right"):
		car.apply_torque_impulse(-car_rotate_vel * delta)
		for wheel in wheels:
			wheel.set_friction(friction)
			if wheel.get_angular_velocity() < vel:
				wheel.apply_torque_impulse( vel * delta * acel )
				print("delta ", vel * delta * acel , " angular velocity: ", wheel.get_angular_velocity())
	if Input.is_action_pressed("ui_left"):
		car.apply_torque_impulse(car_rotate_vel * delta)
		for wheel in wheels:
			wheel.set_friction(friction)
			if wheel.get_angular_velocity() > -vel:
				wheel.apply_torque_impulse( -vel * delta * acel )
				print("delta ", -vel * delta * acel , " angular velocity: ", wheel.get_angular_velocity())


func set_fuel(par = 1):
	fuel += car.fuel_up * par
	
	if fuel > car.fuel_MAX:
		fuel = car.fuel_MAX
	if fuel < car.fuel:
		fuel = car.fuel
	print("fuel: ", fuel)


func set_vel(par = 1):
	vel += car.vel_up * par
	
	if vel > car.vel_MAX:
		vel = car.vel_MAX
	if vel < car.vel:
		vel = car.vel
	print("vel: ", vel)


func set_acel(par = 1):
	acel += car.acel_up * par
	
	if acel > car.acel_MAX:
		acel = car.acel_MAX
	if acel < car.acel:
		acel = car.acel
	print("acel: ", acel)


func set_friction(par = 1):
	friction += car.friction_up * par
	
	if friction > car.friction_MAX:
		friction = car.friction_MAX
	if friction < car.wheel_friction:
		friction = car.wheel_friction
	print("friction: ", friction)
	


func set_car_rotate_vel(par = 1):
	car_rotate_vel += car.car_rotate_vel_up * par
	
	if car_rotate_vel > car.car_rotate_vel_MAX:
		car_rotate_vel = car.car_rotate_vel_MAX
	if car_rotate_vel < car.car_rotate_vel:
		car_rotate_vel = car.car_rotate_vel
	print("car_rotate_vel: ", car_rotate_vel)


func set_suspension(par = 1):
	suspension_softness += car.suspension_softness_up * par
	
	if suspension_softness < car.suspension_softness_MIN:
		suspension_softness = car.suspension_softness_MIN
	if suspension_softness > car.suspension_softness:
		suspension_softness = car.suspension_softness
	
	for suspension in suspensions:
		suspension.softness = suspension_softness
	
	print("suspension_softness: ", suspension_softness)
