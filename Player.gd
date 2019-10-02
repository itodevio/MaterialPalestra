extends KinematicBody2D

var speed = 200
var key = false
var life = 6
var has_key = false
var can_take_damage = true

var velocity = Vector2()

func get_input():
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		$AnimatedSprite.flip_h = false
		
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		$AnimatedSprite.flip_h = true
		
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		

	velocity = velocity.normalized() * speed


func _physics_process(delta):

	if key:
		key = false
		has_key = true
		$Camera2D/HUD.update_key()

	get_input()
	

	if velocity.y == -200:
		if $AnimatedSprite.animation != 'verticalWalk':
			$AnimatedSprite.animation = 'verticalWalk' 
	
	elif velocity.x != 0 or velocity.y != 0:
		if $AnimatedSprite.animation != 'horizontalWalk':
			$AnimatedSprite.animation = 'horizontalWalk'
	
	else:
		if $AnimatedSprite.animation != 'idle':
			$AnimatedSprite.animation = 'idle'
	
	velocity = move_and_slide(velocity)
	

func hit(damage):
	
	if can_take_damage:
		life -= damage
	
	$Camera2D/HUD.update_life(life)
	
	if life == 0:
		end()
		
	can_take_damage = false
	
	for i in 4:
        $AnimatedSprite.self_modulate.a = 0
        yield(get_tree().create_timer(0.1), 'timeout')
        $AnimatedSprite.self_modulate.a = 1
        yield(get_tree().create_timer(0.1), 'timeout')
	yield(get_tree().create_timer(0.2), 'timeout')
	
	can_take_damage = true

func end():
	get_tree().reload_current_scene()
	

	
	
	
	
	
	
	
	
	
	
	
	