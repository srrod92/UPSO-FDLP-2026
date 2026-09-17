extends Node2D
class_name Manzana

func _on_area_2d_area_entered(area: Area2D) -> void:
	var vector_pos = Vector2i(randi_range(0,Data.ancho_grilla-1),randi_range(0,Data.alto_grill-1))
	global_position = vector_pos*Data.tamaño_celda
