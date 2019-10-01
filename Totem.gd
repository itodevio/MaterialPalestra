extends StaticBody2D

signal shoot

export (PackedScene) var Bullet

var can_shoot = true

var totalBullets = 15
var turrets = []

var raio = 19

func _ready():
	add_to_group("turrets")
	
	var angulo = 0
	for i in range(totalBullets):
		var x = sin(deg2rad(angulo)) 
		var y = cos(deg2rad(angulo)) 
		var ponto = Vector2(x, y)# * raio
		
		turrets.append(ponto)
		
		angulo += 360 / totalBullets

func shoot():
	if can_shoot:
		can_shoot = false
		$Timer.start()
		
		var teste = 0
		
		for i in turrets:
			emit_signal("shoot", Bullet, i * raio + global_position, i.normalized())

func _physics_process(delta):
	if can_shoot:
		shoot()

func _on_Timer_timeout():
	can_shoot = true