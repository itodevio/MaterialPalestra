extends Node2D



func _on_Imp_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)


func _on_Totem_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)
