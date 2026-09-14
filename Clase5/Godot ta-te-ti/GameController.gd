extends Control
class_name GameController

const  celda = preload("res://celda.tscn")

var game_over: bool = false
var turno :=0
var grilla : Array[Array]


func _ready() -> void:
	_setear_label()
	grilla = []
	
	##Crear la grilla
	for y in range(3):
		var fila = []
		for x in range(3):
			var go :Celda = celda.instantiate()
			go.set_celda(self,Vector2(x,y))
			$GridContainer.add_child(go)
			fila.append(go)
		grilla.append(fila)
	pass


func _setear_label():
	$Label.text = "Turno de " + ("X" if turno % 2 == 0 else "O")


func _revisar_gameover()-> bool:	
	##revisar las filas
	for fila in range(3):
		if grilla[0][fila].text == grilla[1][fila].text and grilla[0][fila].text == grilla[2][fila].text and grilla[0][fila].text != "":
			return true
	## revisar las columnas
	for columna in range(3):
		if grilla[columna][0].text == grilla[columna][1].text and grilla[columna][0].text == grilla[columna][2].text and grilla[columna][0].text != "":
			return true
	## revisar diagonal identidad
	if grilla[0][0].text == grilla[1][1].text and grilla[0][0].text == grilla[2][2].text and grilla[0][0].text != "":
		return true
	
	# revisar la otra diagonal
	if grilla[2][0].text == grilla[1][1].text and grilla[0][2].text == grilla[2][0].text and grilla[0][2].text != "":
		return true
	
	return false

func boton_presionado():
	if _revisar_gameover():
		$Label.text = "Ganador " + ("X" if turno % 2 == 0 else "O")
		game_over = true
		return
	
	turno +=1
	_setear_label()


func reiniciar():
	for x in range(3):
		for y in range(3):
			grilla[x][y].reiniciar()
	
	turno = 0
	game_over = false
	_setear_label()
	
