extends CharacterBody2D

var speed = 800

func _physics_process(delta):
	var direction = Input.get_axis("PlayerOneUp","PlayerOneDown")
	velocity.y = direction * speed
	move_and_collide(velocity * delta)
	
