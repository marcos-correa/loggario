extends Node2D

export(PackedScene) var win = preload("res://Loggos/Loggos Cena/Win.tscn")
#export(PackedScene) var ganhou

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var posi_x_posi = get_parent().posi_x_posi
	var posi_x_nega = get_parent().posi_x_nega
	var posi_y_posi = get_parent().posi_y_posi
	var posi_y_nega = get_parent().posi_y_nega
	var w = win.instance()
	w.posiMapa(posi_x_posi,posi_x_nega,posi_y_posi,posi_y_nega)
	add_child(w)
	randomize()
	w.position.x = rand_range(posi_x_nega+100, posi_x_posi-100)
	w.position.y = rand_range(posi_y_nega+100, posi_y_posi-100)
	print(w.position.x)
	print(w.position.y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
