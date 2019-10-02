extends Node2D

func _on_Imp_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)


func _on_Totem_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)


func _on_Key_body_entered(body):
	if body.name == 'Player':
		body.key = true
		$Key.queue_free()


func _on_BauArea_body_entered(body):
	if body.name == 'Player' and body.has_key:
		end_game()

func end_game():
	print('acabou')