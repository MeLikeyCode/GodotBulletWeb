extends Node2D

class_name Test

# private attributes
var bulletScene: PackedScene

func _ready():
	bulletScene = load("res://GodotBullet.tscn");

func _unhandled_input(event):
	# on click, spawn bullet
	if event is InputEventMouseButton:
		var mouseEvent = event as InputEventMouseButton
		if not mouseEvent.pressed and mouseEvent.button_index == BUTTON_LEFT:
			var bullet = bulletScene.instance();
			bullet.position = mouseEvent.global_position;
			bullet.rotation = deg2rad(50);
			self.add_child(bullet);
			bullet.LaunchBullet();
