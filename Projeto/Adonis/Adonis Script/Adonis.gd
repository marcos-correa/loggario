extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var nums = [-10,10]
var mudar_direcao = 0
var aux = nums[randi() % nums.size()]
var aux2 = nums[randi() % nums.size()] 
var cap = false
var win_posicao = Vector2(0,0)
var direcao

# Called when the node enters the scene tree for the first time.
func _ready():
	#print("test")
	$Timer.start()
	
	pass # Replace with function body.

func _physics_process(delta):
	#print(mudar_direcao)
	if(!cap): 
		move_and_slide(Vector2(aux*10,aux2*10)) 
	else: 
		if((position.x - win_posicao.x < 80 && position.x - win_posicao.x > -80) && (position.y - win_posicao.y < 80 && position.y - win_posicao.y > -80)):
			queue_free()
			pass
		else: 
			move_and_slide(direcao * 0.5)
	position.x = clamp(position.x, -2100,2000) 
	position.y = clamp(position.y, -2100,2000)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func capturou(win):
	$MeshInstance2D.modulate = Color8(0,255,255,255)
	print(win.position)
	cap = true
	win_posicao = win.position
	direcao = win_posicao - transform.origin
	
	#move_and_slide(win.position*20)
	
	pass
	
	
func _on_Timer_timeout():
	mudar_direcao += 1
	if(mudar_direcao == 5): 
		print("mudou direcao")
		aux = nums[randi() % nums.size()]
		aux2 = nums[randi() % nums.size()] 
		mudar_direcao = 0
	pass # Replace with function body.
