extends Node2D
#penas
#pena 1 = zoom in
var velocidade_ori = 7
var size = 1.0
var zoom = 1.0
var tempo_vida = 0
var power_pena1 = false
var power_pena2 = 1
var velocidade
var aux_show = false
var aux_zoom = false

func _ready():
	velocidade = velocidade_ori
	tempo_vida = 100
	$Camera2D.zoom.x = 1.5
	$Camera2D.zoom.y = 1.5
	$Timer.start()
	pass # Replace with function body.

func _process(delta):
	var posi_x_posi = get_parent().posi_x_posi
	var posi_x_nega = get_parent().posi_x_nega
	var posi_y_posi = get_parent().posi_y_posi
	var posi_y_nega = get_parent().posi_y_nega
	
	if Input.is_action_just_pressed("ui_page_up"): 
		$Camera2D.zoom.x = 3
		$Camera2D.zoom.y = 3
		power_pena2 = 4
	if Input.is_action_just_pressed("ui_page_down"): 
		$Camera2D.zoom.x = 1.5
		$Camera2D.zoom.y = 1.5
		power_pena2 = 1
	if Input.is_action_just_pressed("ui_z"): 
		$Camera2D.zoom.x = 10
		$Camera2D.zoom.y = 10
		power_pena2 = 4
		
	if(power_pena1):
		$Camera2D.zoom.x = 3
		$Camera2D.zoom.y = 3
		
	$MeshInstance2D.scale.x = lerp($MeshInstance2D.scale.x, size, 0.1) #interpola dois valor(1,2 parametro) 3 parametro é quanto que vai interpolar                           
	$MeshInstance2D.scale.y = lerp($MeshInstance2D.scale.y, size, 0.1) #ex: lerp(0,5,0.5)=2.5  lerp(0,4,0.75)=3
	
	if Input.is_action_pressed("ui_right"): position.x += velocidade * power_pena2
	if Input.is_action_pressed("ui_left"): position.x -= velocidade * power_pena2
	if Input.is_action_pressed("ui_up"): position.y -= velocidade * power_pena2
	if Input.is_action_pressed("ui_down"): position.y += velocidade * power_pena2
	position.x = clamp(position.x, posi_x_nega, posi_x_posi)
	position.y = clamp(position.y, posi_y_nega, posi_y_posi)
	
	coliWin()
	coliAdoni()
	coliPena()
	coliSemente()
	
	if Input.is_action_just_pressed("ui_x"):
		aux_show = !aux_show
		if(aux_show):
			$Camera2D/HuD/radar/NinePatchRect/TextureRect/marcacao_loggos.show()
		else:
			$Camera2D/HuD/radar/NinePatchRect/TextureRect/marcacao_loggos.hide()
	
	if Input.is_action_just_pressed("ui_z"): 
		aux_zoom = !aux_zoom
		if(aux_zoom):
			$Camera2D.zoom.x = 10
			$Camera2D.zoom.y = 10
			power_pena2 = 4
		else:
			$Camera2D.zoom.x = 1.5
			$Camera2D.zoom.y = 1.5
			power_pena2 = 1
	pass

func coliWin():
	var win = get_tree().get_nodes_in_group("ganhou")[0]
	if $MeshInstance2D/Area2D.overlaps_area(win):
		#print("teste" + String(tempo_vida))
		get_tree().change_scene("res://Menu/Ganhou.tscn")
	pass

func coliSemente():
	var foods = get_tree().get_nodes_in_group("food")
	for food in foods:
		if $MeshInstance2D/Area2D.overlaps_area(food): 
			if food.size < size:
				food.queue_free()
				#print(tempo_vida)
				if(tempo_vida <= 100):
					tempo_vida += 4
				emit_signal("ready")
	pass

func coliAdoni():
	var adonis = get_tree().get_nodes_in_group("adonis")
	for adoni in adonis:
		if $MeshInstance2D/Area2D.overlaps_area(adoni): 
				#print("Capturou")
				pass
				
	pass

func coliPena():
	var penas1 = get_tree().get_nodes_in_group("pena1")
	var penas2 = get_tree().get_nodes_in_group("pena2")
	
	for pena1 in penas1:
		if $MeshInstance2D/Area2D.overlaps_area(pena1): 
				#print("Capturou2")
				power_pena1 = true
				get_parent().get_node("PenaSpawner/Pena1Spawner/TimerPena1").start()
				pena1.queue_free()
				
	for pena2 in penas2:
		if $MeshInstance2D/Area2D.overlaps_area(pena2): 
				#print("Capturou3")
				power_pena2 = 2
				get_parent().get_node("PenaSpawner/Pena2Spawner/TimerPena2").start()
				pena2.queue_free()
	
	pass

func cheats():
	if Input.is_action_just_pressed("ui_x"):
		aux_show = !aux_show
		if(aux_show):
			$Camera2D/HuD/radar/NinePatchRect/TextureRect/marcacao_loggos.show()
		else:
			$Camera2D/HuD/radar/NinePatchRect/TextureRect/marcacao_loggos.hide()
			
	if Input.is_action_just_pressed("ui_z"): 
		aux_zoom = !aux_zoom
		if(aux_zoom):
			$Camera2D.zoom.x = 10
			$Camera2D.zoom.y = 10
			power_pena2 = 4
		else:
			$Camera2D.zoom.x = 1.5
			$Camera2D.zoom.y = 1.5
			power_pena2 = 1
	pass

func _on_Timer_timeout():
	#print("teste")
	tempo_vida -= 1
	if(tempo_vida == 0):
		get_tree().change_scene("res://Menu/Perdeu.tscn")
	if(tempo_vida == 75):
		velocidade -= 0.5
	if(tempo_vida == 50):
		velocidade -= 0.5
	if(tempo_vida == 25):
		velocidade -= 0.5
	if(tempo_vida > 75):
		velocidade = velocidade_ori
	pass # Replace with function body.

func _on_TimerPena1_timeout():
	power_pena1 = false
	$Camera2D.zoom.x = 1.5
	$Camera2D.zoom.y = 1.5
	pass # Replace with function body.

func _on_TimerPena2_timeout():
	power_pena2 = 1
	pass # Replace with function body.
