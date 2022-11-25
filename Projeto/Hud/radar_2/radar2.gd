extends MarginContainer

onready var  marcacao_loggos =  $NinePatchRect/TextureRect/marcacao_loggos
onready var grid = $NinePatchRect/TextureRect
onready var marcacao_adam = $NinePatchRect/TextureRect/marcacao_adam
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var marcador
var grid_scale
var zoom = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	grid_scale = grid.rect_size / (get_viewport_rect().size * 3)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var win = get_tree().get_nodes_in_group("ganhou")[0]
	var obj_posi = (win.position - (get_node("../../..").position)) * grid_scale + grid.rect_size / 2
	#marcacao_loggos.position = (win.position - get_node("../../..").position) * grid_scale + grid.rect_size / 2
	obj_posi.x = clamp(obj_posi.x, 0, rect_size.x)
	obj_posi.y = clamp(obj_posi.y, 0, rect_size.y)
	marcacao_loggos.position = obj_posi
	#marcacao_loggos.position = (win.position) * grid_scale + grid.rect_size / 2
	#var obj_pos = (marcador.position - )
	pass

func _auxiliar():
	
	pass
