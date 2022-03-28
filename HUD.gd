extends CanvasLayer

## CODIGO MOSTRAR/OCULTAR HUD ##

# Metodo para mostrar los elementos del HUD
func show_HUD():
	$TitleLabel.show()
	$TableModes.show()
	$TableHigscores.show()

# Metodo para ocultar los elementos del HUD
func hide_HUD():
	$TitleLabel.hide()
	$TableModes.hide()
	$TableHigscores.hide()

#-------------------------------------------------------------------------------------------------------#

## CODIGO DE 'MESSAGE' ##

# Escondemos este mensaje al comenzar la aplicacion
func _ready():
	$Message.hide()

# Metodo para mostrarle al jugador el label 'Message' que sirve para lo siguiente :
# - Indicarle al jugador que se prepare antes de que salga la imagen
# - Indicarle al jugador si acierta o falla
func show_message(text):
	$Message.text = text
	$Message.show()

# Metodo para ocultar el label 'Message'
func hide_message():
	$Message.hide()

#-------------------------------------------------------------------------------------------------------#

## CODIGO DEL CRONOMETRO ##

# Variables para actualizar los digitos del cronometro
# (en lugar de ser un solo label consistira de 3 labels diferentes que se 
# cambiaran con la ayuda de los timers)
var segundos
var decimas
var centesimas

# Establecemos los metodos de los timers del cronometro
func start_time():
	$Time/TimerSegundos.start()
	$Time/TimerDecimas.start()
	$Time/TimerCentesimas.start()

func stop_time():
	$Time/TimerSegundos.stop()
	$Time/TimerDecimas.stop()
	$Time/TimerCentesimas.stop()

func reset_time():
	$Time/TimerSegundos.stop()
	$Time/TimerDecimas.stop()
	$Time/TimerCentesimas.stop()
	
	segundos = 0
	decimas = 0
	centesimas = 0
	
	$Time/SegundosLabel.text = str(segundos)
	$Time/DecimasLabel.text = str(decimas)
	$Time/CentesimasLabel.text = str(centesimas)

func _on_TimerSegundos_timeout():
	segundos += 1
	$Time/SegundosLabel.text = str(segundos)

func _on_TimerDecimas_timeout():
	decimas += 1
	# Cuando el numero pasa de 9 lo volvemos a poner a 0 (asi nos aseguramos de que sea solo un digito) 
	if decimas > 9:
		decimas = 0
	$Time/DecimasLabel.text = str(decimas)

func _on_TimerCentesimas_timeout():
	centesimas += 1
	if centesimas > 9:
		centesimas = 0
	$Time/CentesimasLabel.text = str(centesimas)

#-------------------------------------------------------------------------------------------------------#

## CODIGO DE LOS BOTONES ##

# Señales para el comienzo de diferentes modos de juego (una para cada boton)
signal start_game1
signal start_game2
signal start_game3

func _on_Mode1_pressed():
	hide_HUD()
	reset_time()
	emit_signal("start_game1")

func _on_Mode2_pressed():
	hide_HUD()
	reset_time()
	emit_signal("start_game2")


func _on_Mode3_pressed():
	hide_HUD()
	reset_time()
	emit_signal("start_game3")

#-------------------------------------------------------------------------------------------------------#
