extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	animation = "Radar" 
	get_node("../../../../AdonisSpawner").connect("muda_radar",self,"mudar_radar")
	pass # Replace with function body.

func mudar_radar():
	$TimerRadar.start()
	var win = get_tree().get_nodes_in_group("ganhou")[0]
	var radar = posicao_radar(win.position.x,win.position.y)
	
	match(radar):
		1:
			animation = "Radar-1"
		2:
			animation = "Radar-2"
		3:
			animation = "Radar-3"
		4:
			animation = "Radar-4"
	pass
	
func posicao_radar(posicaox,posicaoy):
	
	if(posicaox < 0 && posicaoy < 0):
		return 1 
	if(posicaox > 0 && posicaoy < 0):
		return 2 
	if(posicaox < 0 && posicaoy > 0):
		return 3 
	if(posicaox > 0 && posicaoy > 0):
		return 4 
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TimerRadar_timeout():
	animation = "Radar"
	pass # Replace with function body.
