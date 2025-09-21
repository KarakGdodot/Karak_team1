extends CharacterBody2D


@onready var player_sprite = $"وحش\\"  # مرجع للوصول الى صورة اللاعب و ضبط الأنميشن المناسب 

@export var max_speed = 120  # السرعة العظمى 
@export var accsel = 1000 # تسارع اللاعب 
@export var friction = 1000 # 



var input = Vector2.ZERO


func get_input()-> Vector2 : #هنا نقرأ الدخل من المستخدم و نحوله لقيمة Vector2(x,y)
	input.x = int(Input.is_action_pressed("ui_right"))- int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down"))- int(Input.is_action_pressed("ui_up"))
	return input.normalized()


func _physics_process(delta):
	
	input = get_input()
	print(input)
	
	##   السكربت المسؤول عن الحركة هن  
	
	if input == Vector2.ZERO :
		
		if velocity.length() > (friction*delta):
			velocity -= velocity.normalized() * (friction*delta)
		else :
			velocity = Vector2.ZERO
			
	else :
		velocity += (input * accsel * delta)
		velocity  = velocity.limit_length(max_speed)
		
	# -----------------------------------------------  #
	
	
	
	
	
	
	
	#if velocity != Vector2.ZERO :#  هنا نقوم بتشغيل انميشن الركض اذا كان اللاعب يتحرك و نقوم بتشغيل انميشن الوقوف اذا كان اللاعب واقف 
	#	player_sprite.play("Run")
	#else :
		#player_sprite.play("idle")
	
	
	
	
	
	
	
	if velocity.x < 0 : #هذا الجزء من الكود يقوم بعكس جهة اللاعب حسب اتجاه المشي 
		player_sprite.flip_h = true
	elif velocity.x > 0 :
		player_sprite.flip_h = false
	
	
	move_and_slide()
	
