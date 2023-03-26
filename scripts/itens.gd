extends Area2D

export(bool) var box = false
export(bool) var fruit = true


var textFloating :PackedScene = preload("res://cenas/itens/textFloating.tscn")
var box_explosion :Array = [preload("res://cenas/itens/fragmentos/fragments.tscn")]
var textures_fruits :Array = [preload("res://sprites/New Piskel(15).png"), 
						preload("res://sprites/New Piskel(16).png")]
var textures_boxs :Array = [preload("res://sprites/New Piskel(17).png"), 
						preload("res://sprites/New Piskel(18).png")]
var pos :int = 0
var fruits_value = 1


func _ready():
	randomize()
	if fruit:
		pos = randi() % textures_fruits.size()
		$Sprite.texture = textures_fruits[pos]
	elif box:
		pos = randi() % textures_boxs.size()
		$Sprite.texture = textures_boxs[pos]


func _on_itens_body_entered(body):
	var textIsntance = textFloating.instance()
	textIsntance.global_position = self.global_position
	
	if fruit:
		textIsntance.type = "fruit"
		textIsntance.value = fruits_value
		get_parent().add_child(textIsntance)
		
		if pos == 0:
			Global.car_selected.fruit_maca += 1
			$AnimationPlayer.play("maca")
			print("mais uma maçã!")
		if pos == 1:
			Global.car_selected.fruit_banana += 1
			$AnimationPlayer.play("banana")
			print("mais uma banana!")
		
		yield($AnimationPlayer, "animation_finished")
	elif box:
		var boxInstance = box_explosion[0].instance()
		boxInstance.global_position = self.global_position
		get_parent().add_child(boxInstance)
		
		var quant = (randi() % 5) + 20
		textIsntance.type = "box"
		textIsntance.value = quant
		get_parent().add_child(textIsntance)
		if pos == 0:
			Global.car_selected.fruit_maca  += quant
			print("mais 20 maçãs!")
		if pos == 1:
			Global.car_selected.fruit_banana += quant
			print("mais uma penca de bananas!")
	
	self.queue_free()
