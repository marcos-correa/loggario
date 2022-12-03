extends KinematicBody2D

var nums = [-10,10]
var mudar_direcao = 0
var aux = nums[randi() % nums.size()]
var aux2 = nums[randi() % nums.size()] 
var cap = false
var win_posicao = Vector2(0,0)
var direcao
var xposi
var xnega
var yposi
var ynega

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	
	pass # Replace with function body.

func _physics_process(delta):
	#print(mudar_direcao)
	if(!cap): 
		move_and_slide(Vector2(aux*30,aux2*30)) 
	else: 
		posiWini()
		if((position.x - win_posicao.x < 200 && position.x - win_posicao.x > -200) && (position.y - win_posicao.y < 200 && position.y - win_posicao.y > -200)):
			queue_free()
			pass
		else: 
			move_and_slide(direcao * 0.5)
	position.x = clamp(position.x, xnega,xposi) 
	position.y = clamp(position.y, ynega,yposi)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func capturou(win):
	$MeshInstance2D.modulate = Color8(0,255,255,255)
	print(win.position)
	cap = true
	pass
	
	
func _on_Timer_timeout():
	mudar_direcao += 1
	if(mudar_direcao == 5): 
		#print("mudou direcao")
		aux = nums[randi() % nums.size()]
		aux2 = nums[randi() % nums.size()] 
		mudar_direcao = 0
	pass # Replace with function body.

func posiWini():
	var win = get_tree().get_nodes_in_group("ganhou")[0]
	win_posicao = win.position
	direcao = win_posicao - transform.origin
	pass

func posiMapa(xposit,xnegat,yposit,ynegat):
	xposi = xposit
	xnega = xnegat
	yposi = yposit
	ynega = ynegat
	#print(xposi,xnega,yposi,ynega)
	pass
