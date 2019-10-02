extends CanvasLayer

var full_heart = preload("res://Sprites/HUD/heart border sh.png")
var half_heart = preload("res://Sprites/HUD/heart border half.png")

func update_life(life):
	if life == 5:
		$Hearts/Heart3.set_texture(half_heart)
	elif life == 4:
		$Hearts/Heart3.hide()
	elif life == 3:
		$Hearts/Heart2.set_texture(half_heart)
	elif life == 2:
		$Hearts/Heart2.hide()
	elif life == 1:
		$Hearts/Heart1.set_texture(half_heart)
	elif life == 0:
		$Hearts/Heart1.hide()

func update_key():
	$Key.show()
		