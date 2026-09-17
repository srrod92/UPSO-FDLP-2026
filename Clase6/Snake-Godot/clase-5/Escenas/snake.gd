extends Node2D
class_name Snake

signal ManzanaComida

const SEGMENTO = preload("res://Escenas/Segmento.tscn")

var ultima_direccion := Vector2i.RIGHT
var nueva_direccion := Vector2i.RIGHT

var posicion_grilla := Vector2i(5,5)

var siguiente :Segmento = null

var posicion_cola: Vector2i

func _ready() -> void:
	position = posicion_grilla*Data.tamaño_celda
	

func mover():
	##Mueve la cabeza y los segmentos.
	var ultima_posicion = posicion_grilla
	posicion_grilla = calcular_nueva_posicion()
	global_position = Vector2(posicion_grilla*Data.tamaño_celda)
	ultima_direccion = nueva_direccion
	_rotar_sprite()
	
	if siguiente != null:
		var actual = self
		while actual.siguiente != null:
			ultima_posicion = actual.siguiente._mover(ultima_posicion)
			actual = actual.siguiente
		
	posicion_cola = ultima_posicion


func calcular_nueva_posicion():
	var nueva_pos = posicion_grilla + nueva_direccion
	nueva_pos.x = nueva_pos.x % Data.ancho_grilla
	nueva_pos.y = nueva_pos.y % Data.alto_grill
	
	if nueva_pos.x < 0:
		nueva_pos.x = Data.ancho_grilla-1
	if nueva_pos.y <0:
		nueva_pos.y = Data.alto_grill-1
	
	return nueva_pos


func _rotar_sprite():
	match (ultima_direccion):
		Vector2i.RIGHT:
			$Sprite2D.rotation_degrees = -90
		Vector2i.DOWN:
			$Sprite2D.rotation_degrees = 0
		Vector2i.LEFT:
			$Sprite2D.rotation_degrees = 90
		Vector2i.UP:
			$Sprite2D.rotation_degrees = 180


func _agregar_segmento():
	var nodo := SEGMENTO.instantiate()
	add_child.call_deferred(nodo)
	nodo._mover(posicion_cola)
	_devolver_cola().siguiente = nodo



func _devolver_cola():
	var actual = self
	while actual.siguiente != null:
		actual = actual.siguiente
	
	return actual



func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_down") and ultima_direccion != Vector2i.UP:
		nueva_direccion = Vector2i.DOWN
	elif Input.is_action_just_pressed("ui_right") and ultima_direccion != Vector2i.LEFT:
		nueva_direccion = Vector2i.RIGHT
	elif Input.is_action_just_pressed("ui_up") and ultima_direccion != Vector2i.DOWN:
		nueva_direccion = Vector2i.UP
	elif Input.is_action_just_pressed("ui_left") and ultima_direccion != Vector2i.RIGHT:
		nueva_direccion = Vector2i.LEFT


func _on_timer_timeout():
	mover()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Manzana:
		_agregar_segmento()
		ManzanaComida.emit()
		
