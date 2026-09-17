extends Node2D
class_name SnakeGame

const MANZANA = preload("res://Escenas/manzana.tscn")

func _ready() -> void:
	crear_manzana()

func crear_manzana():
	var go := MANZANA.instantiate()
	add_child(go)
	
	var vector_pos = Vector2i(randi_range(0,Data.ancho_grilla-1),randi_range(0,Data.alto_grill-1))
	go.global_position = vector_pos * Data.tamaño_celda
	
	
