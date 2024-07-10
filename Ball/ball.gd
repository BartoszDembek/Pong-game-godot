extends CharacterBody2D

var speed
var i = 0 

func _ready():
	random_velocity()

func _physics_process(delta):	
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		$CollisionSound.play()
		var reflect = collision_object.get_remainder().bounce(collision_object.get_normal())
		velocity = velocity.bounce(collision_object.get_normal())	
		move_and_collide(reflect)
		

func stop_ball():
	speed = 0

func random_velocity():
	speed = 600
	randomize()
	velocity.x = [-1,1][randi() % 2] 
	velocity.y = [-1,1][randi() % 2]
	
