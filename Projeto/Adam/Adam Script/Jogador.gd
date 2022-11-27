extends Node2D
#penas
#pena 1 = zoom in

var size = 1.0
var zoom = 1.0
var tempo_vida = 0
var power_pena1 = false
var power_pena2 = 1

func _ready():
	
	#$Camera2D.zoom.x = lerp($Camera2D.zoom.x, zoom, 0.1)
	#$Camera2D.zoom.y = lerp($Camera2D.zoom.y, zoom, 0.1)
	tempo_vida = 100
	$Camera2D.zoom.x = 1.5
	$Camera2D.zoom.y = 1.5
	$Timer.start()
	
	pass # Replace with function body.

func _process(delta):
	if(tempo_vida == 0):
		get_tree().change_scene("res://Menu/Menu.tscn")
	if Input.is_action_just_pressed("ui_page_up"): 
		$Camera2D.zoom.x = 3
		$Camera2D.zoom.y = 3
		power_pena2 = 4
	if Input.is_action_just_pressed("ui_page_down"): 
		#$Camera2D.zoom.x = lerp($Camera2D.zoom.x, zoom, 0.1)
		#$Camera2D.zoom.y = lerp($Camera2D.zoom.y, zoom, 0.1)
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
	
	if Input.is_action_pressed("ui_right"): position.x += 7 * power_pena2
	if Input.is_action_pressed("ui_left"): position.x -= 7 * power_pena2
	if Input.is_action_pressed("ui_up"): position.y -= 7 * power_pena2
	if Input.is_action_pressed("ui_down"): position.y += 7 * power_pena2
	position.x = clamp(position.x, -2100,2000)
	position.y = clamp(position.y, -2100,2000)
	
	
	var foods = get_tree().get_nodes_in_group("food")
	var win = get_tree().get_nodes_in_group("ganhou")[0]
	var aux = get_tree().get_nodes_in_group("auxiliar")
	var adonis = get_tree().get_nodes_in_group("adonis")
	var penas1 = get_tree().get_nodes_in_group("pena1")
	var penas2 = get_tree().get_nodes_in_group("pena2")
	
	for adoni in adonis:
		if $MeshInstance2D/Area2D.overlaps_area(adoni): 
				print("Capturou")
				
	
	if $MeshInstance2D/Area2D.overlaps_area(win):
		print("teste" + String(tempo_vida))
		get_tree().change_scene("res://Menu/Menu.tscn")
	
	for i in aux:
		if $MeshInstance2D/Area2D.overlaps_area(i): 
				print("Capturou")
				print(i.global_position)
				#usar signal par mover o aux, vamos fazer isso no proprio objeto aux
				
				#i.move_toward(i.global_position,win.global_position,delta*20)
	for food in foods:
		if $MeshInstance2D/Area2D.overlaps_area(food): 
			if food.size < size:
				food.queue_free()
				print(tempo_vida)
				if(tempo_vida <= 100):
					tempo_vida += 2
				emit_signal("ready")
	
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


func _on_Timer_timeout():
	#print("teste")
	tempo_vida -= 1
	if(tempo_vida == 0):
		print("Acabou tempo")
	pass # Replace with function body.

func _on_TimerPena1_timeout():
	power_pena1 = false
	$Camera2D.zoom.x = 1.5
	$Camera2D.zoom.y = 1.5
	pass # Replace with function body.

func _on_TimerPena2_timeout():
	power_pena2 = 1
	pass # Replace with function body.
