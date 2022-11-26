extends Node2D

export(PackedScene) var aux = preload("res://Adonis/Adonis Cena/Adonis.tscn")

var primeira_ocorrencia = 1
signal muda_radar

func _ready():
	var adonis = aux.instance()
	add_child(adonis)
	adonis.position.x = 0
	adonis.position.y = -200
	for i in 3:
		adonis = aux.instance()
		add_child(adonis)
		randomize()
		adonis.position.x = rand_range(-2000, 2000)
		adonis.position.y = rand_range(-2000, 2000)
	pass # Replace with function body.
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
				print("funcionou")
				_i.capturou(win)
				emit_signal("muda_radar")
				
	pass # Replace with function body.


func _on_Timer_timeout():
	#print("test")
	primeira_ocorrencia = 0
	pass # Replace with function body.





