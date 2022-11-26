extends Node2D

export(PackedScene) var pena2 = preload("res://Penas/Penas Cenas/Pena2.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	var pena = pena2.instance()
	add_child(pena)
	
	pena.position.x = -200
	pena.position.y = -200
	for i in 3:
		pena = pena2.instance()
		add_child(pena)
		randomize()
		pena.position.x = rand_range(-2000, 2000)
		pena.position.y = rand_range(-2000, 2000)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
