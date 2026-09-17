extends Node2D
class_name Segmento

var siguiente : Segmento

var posicion: Vector2i = Vector2i.ZERO

func _mover(pos :Vector2i)-> Vector2i:
	global_position = pos*Data.tamaño_celda
	var temp = posicion
	posicion = pos
	return temp


func destruir():
	if siguiente != null:
		siguiente.destruir()
	queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Snake:
		destruir()
	pass # Replace with function body.
