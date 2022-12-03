extends Node2D

export(PackedScene) var pena2 = preload("res://Penas/Penas Cenas/Pena2.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	var posi_x_posi = get_parent().get_parent().posi_x_posi
	var posi_x_nega = get_parent().get_parent().posi_x_nega
	var posi_y_posi = get_parent().get_parent().posi_y_posi
	var posi_y_nega = get_parent().get_parent().posi_y_nega
	var pena = pena2.instance()
	add_child(pena)
	
	pena.position.x = -200
	pena.position.y = -200
	var numPena =  ceil(posi_x_posi*0.002)
	for i in numPena:
		pena = pena2.instance()
		add_child(pena)
		randomize()
		pena.position.x = rand_range(posi_x_nega+100, posi_x_posi-100)
		pena.position.y = rand_range(posi_y_nega+100, posi_y_posi-100)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_TimerApaDesa_timeout():
	var penas2 = get_tree().get_nodes_in_group("pena2")
	
	for pena2 in penas2:
		randomize()
		pena2.position.x = rand_range(-2000, 2000)
		pena2.position.y = rand_range(-2000, 2000)
	pass # Replace with function body.
