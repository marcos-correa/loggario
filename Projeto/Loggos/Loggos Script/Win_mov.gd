extends Area2D

var numsaux = [-100,100]
var nums = [-100,0,100]
var mudar_direcao = 0
var aux = nums[randi() % nums.size()]
var aux2 = nums[randi() % nums.size()] 
var xposi
var xnega
var yposi
var ynega


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("test")
	position.x += aux * delta
	position.y += aux2 * delta
	position.x = clamp(position.x, xnega,xposi)
	position.y = clamp(position.y, ynega,yposi)
	pass

func posiMapa(xposit,xnegat,yposit,ynegat):
	xposi = xposit
	xnega = xnegat
	yposi = yposit
	ynega = ynegat
	#print(xposi,xnega,yposi,ynega)
	pass



func _on_Timer_timeout():
	aux = nums[randi() % nums.size()]
	aux2 = nums[randi() % nums.size()] 
	if(aux == 0 && aux2 == 0):
		#print("parado")
		aux = nums[randi() % numsaux.size()]
		aux2 = nums[randi() % numsaux.size()] 
	pass # Replace with function body.
