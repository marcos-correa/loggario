extends Node2D


export(PackedScene) var food = preload("res://Semente/Semente Cena/Comida.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var posi_x_posi = get_parent().posi_x_posi
	var posi_x_nega = get_parent().posi_x_nega
	var posi_y_posi = get_parent().posi_y_posi
	var posi_y_nega = get_parent().posi_y_nega
	for i in (posi_x_posi*0.1):
		var f = food.instance()
		add_child(f)
		randomize()
		f.position.x = rand_range(posi_x_nega+100, posi_x_posi-100)
		f.position.y = rand_range(posi_y_nega+100, posi_y_posi-100)
	pass # Replace with function body.





func _on_Jogador_ready():
	var f = food.instance()
	add_child(f)
	randomize()
	f.position.x = rand_range(-2000, 2000)
	f.position.y = rand_range(-2000, 2000)
	pass # Replace with function body.
