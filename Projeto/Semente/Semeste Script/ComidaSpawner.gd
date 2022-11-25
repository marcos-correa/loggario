extends Node2D


export(PackedScene) var food = preload("res://Semente/Semente Cena/Comida.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 100:
		var f = food.instance()
		add_child(f)
		randomize()
		f.position.x = rand_range(-2000, 2000)
		f.position.y = rand_range(-2000, 2000)
	pass # Replace with function body.





func _on_Jogador_ready():
	var f = food.instance()
	add_child(f)
	randomize()
	f.position.x = rand_range(-2000, 2000)
	f.position.y = rand_range(-2000, 2000)
	pass # Replace with function body.
