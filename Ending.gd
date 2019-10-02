extends Control

func _input(event):
	if event is InputEventKey or event is InputEventMouseButton:
		get_tree().change_scene('res://Menu.tscn')