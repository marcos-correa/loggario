extends Area2D


var size = 0.25


# Called when the node enters the scene tree for the first time.
func _ready():
	$MeshInstance2D.scale = Vector2(size,size)
	$CollisionShape2D.scale = Vector2(size,size)
	$MeshInstance2D.modulate = Color8(rand_range(0,255),rand_range(0,255),rand_range(0,255),255)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
