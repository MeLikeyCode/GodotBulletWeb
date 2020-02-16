extends RigidBody2D

class_name GodotBullet

# public attributes
var MaxDistance = 600;
var Impulse = 1200;
var Life = 1;

# private attributes
var timer: Timer
var originalPosition: Vector2

func LaunchBullet():
	originalPosition = self.position;
	self.apply_central_impulse(Vector2(self.transform.x.normalized() * Impulse));

	timer = Timer.new();
	self.add_child(timer);
	timer.wait_time = self.Life;
	timer.one_shot = true;
	timer.connect("timeout",self,"OnTimeToDie");
	timer.start();

func _physics_process( delta):
	var distanceTravelled = self.position.distance_to(self.originalPosition);
	if distanceTravelled > self.MaxDistance:
		self.queue_free();

func OnTimeToDie():
	self.queue_free();

