extends Node2D

export(PackedScene) var aux = preload("res://Adonis/Adonis Cena/Adonis.tscn")

var primeira_ocorrencia = 1
signal muda_radar
#var posi_x_posi = get_parent().posi_x_posi
#var posi_x_nega = get_parent().posi_x_nega
#var posi_y_posi = get_parent().posi_y_posi
#var posi_y_nega = get_parent().posi_y_nega


func _ready():
	var posi_x_posi = get_parent().posi_x_posi
	var posi_x_nega = get_parent().posi_x_nega
	var posi_y_posi = get_parent().posi_y_posi
	var posi_y_nega = get_parent().posi_y_nega
	var adonis = aux.instance()
	adonis.posiMapa(posi_x_posi,posi_x_nega,posi_y_posi,posi_y_nega)
	add_child(adonis)
	adonis.position.x = 0
	adonis.position.y = -200
	var numAdoni = ceil(posi_x_posi/1000) - 1
	for i in numAdoni:
		adonis = aux.instance()
		adonis.posiMapa(posi_x_posi,posi_x_nega,posi_y_posi,posi_y_nega)
		add_child(adonis)
		randomize()
		adonis.position.x = rand_range(posi_x_nega+100, posi_x_posi-100)
		adonis.position.y = rand_range(posi_y_nega+100, posi_y_posi-100)
	#$Timer_Morte.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#estava sendo detectado a colissao sem ocorrer colissao, quando inicializava
#timer acrescentado para que nao seja detectado quando instanciado
func _on_Area2D_body_entered(body):
	#print(primeira_ocorrencia)
	if (primeira_ocorrencia == 0): 
		for _i in self.get_children(): 
			if(body == _i): 
				var win = get_tree().get_nodes_in_group("ganhou")[0]
				#print("funcionou")
				$Timer_Indicativo
				get_parent().get_node("Jogador/Camera2D/HuD/IndicativoAdonis").show()
				get_parent().get_node("Jogador/Camera2D/HuD/radar/NinePatchRect/TextureRect/marcacao_loggos").show()
				_i.capturou(win)
				emit_signal("muda_radar")
				
	pass # Replace with function body.


func _on_Timer_timeout():
	#print("test")
	primeira_ocorrencia = 0
	pass # Replace with function body.

func _on_Timer_Morte_timeout():
	var adonis = get_tree().get_nodes_in_group("adonis")
	for adoni in adonis:
		adoni.queue_free()
	pass # Replace with function body.


func _on_Timer_Indicativo_timeout():
	get_parent().get_node("Jogador/Camera2D/HuD/IndicativoAdonis").hide()
	get_parent().get_node("Jogador/Camera2D/HuD/radar/NinePatchRect/TextureRect/marcacao_loggos").hide()
	pass # Replace with function body.
