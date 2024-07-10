extends CharacterBody2D

var speed = 490
var ball

func _ready():
	ball = get_parent().get_node("Ball")

func _physics_process(delta):
	if Global.aiOn:
		speed = 490
		move_and_collide(Vector2(0,get_opponent_direction()) * speed * delta)
	else:
		speed = 800
		var direction = Input.get_axis("PlayerTwoUp","PlayerTwoDown")
		velocity.y = direction * speed
		move_and_collide(velocity * delta)
	
func get_opponent_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0
