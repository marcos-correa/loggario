extends Node2D

export(PackedScene) var win = preload("res://Loggos/Loggos Cena/Win.tscn")
#export(PackedScene) var ganhou

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var w = win.instance()
	#var w = ganhou.instance()
	add_child(w)
	randomize()
	w.position.x = rand_range(-2000, 2000)
	w.position.y = rand_range(-2000,2000)
	print(w.position.x)
	print(w.position.y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
