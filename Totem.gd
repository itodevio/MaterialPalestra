extends StaticBody2D

signal shoot

export (PackedScene) var Bullet

var totalBullets = 15
var turrets = []

var raio = 19

func _ready():
	shoot()
	$Timer.start()
	var angulo = 0
	for i in range(totalBullets):
		var x = sin(deg2rad(angulo)) 
		var y = cos(deg2rad(angulo)) 
		var ponto = Vector2(x, y)# * raio
		
		turrets.append(ponto)
		
		angulo += 360 / totalBullets

func shoot():
		
		for i in turrets:
			emit_signal("shoot", Bullet, i * raio + global_position, i.normalized())

func _on_Timer_timeout():
	shoot()
	$Timer.start()