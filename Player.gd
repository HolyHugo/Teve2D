extends KinematicBody2D


export var speed = 250
var screen_size = Vector2.ZERO
var velocity = Vector2()
var xp = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	

	# 
	
func get_input():
		#Controls
	velocity = Vector2()
	if Input.is_action_pressed("ui_down"):
		velocity.y +=1
		$AnimationPlayer.play("up")
	if Input.is_action_pressed("ui_up"):
		velocity.y -=1
		$AnimationPlayer.play("up")
	if Input.is_action_pressed("ui_right"):
		velocity.x +=1
		$AnimationPlayer.play("right")
	if Input.is_action_pressed("ui_left"):
		velocity.x -=1
		$AnimationPlayer.play("left")
		
	if Input.is_action_pressed("teve_open"):
		$AnimationPlayer.play("open")
		

	#Prevent faster movements in diagonale
	velocity = velocity.normalized() * speed
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)

