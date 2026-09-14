extends Button
class_name Celda

var pos: Vector2
var controller: GameController
var habilitado: bool

func set_celda(gameController:GameController, posicion:Vector2):
	##necesito la pos?
	pos = posicion
	controller = gameController
	habilitado = true
	text = ""


func set_texto(texto : String):
	text = texto


func _set_habilitado(valor:bool):
	habilitado = valor


func reiniciar():
	set_celda(controller,pos)

func _on_button_down() -> void:
	if not habilitado or controller.game_over:
		return
		
	var texto = "X" if controller.turno % 2 == 0 else "O"
	set_texto(texto)
	_set_habilitado(false)
	
	if controller:
		controller.boton_presionado()
	
