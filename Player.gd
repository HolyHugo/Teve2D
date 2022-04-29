extends KinematicBody2D


export var speed = 200.0
var screen_size = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	#Controls
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		direction.y +=1
		$AnimationPlayer.play("up")
	if Input.is_action_pressed("ui_up"):
		direction.y -=1
		$AnimationPlayer.play("up")
	if Input.is_action_pressed("ui_right"):
		direction.x +=1
		$AnimationPlayer.play("right")
	if Input.is_action_pressed("ui_left"):
		direction.x -=1
		$AnimationPlayer.play("left")
		
	if Input.is_action_pressed("teve_open"):
		$AnimationPlayer.play("open")
		
	if direction.length() > 0:
		#Prevent faster movements in diagonale
		direction = direction.normalized()
	


	
	position += direction * speed * delta
	position.x = clamp(position.x,0,screen_size.x)
	position.y = clamp(position.y,0,screen_size.y)
