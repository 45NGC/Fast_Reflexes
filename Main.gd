extends Node2D

# IDEAS ESPORADICAS :
# Incorporar 5 botones dentro de la propia interfaz que nos sirvan de la misma forma que las
# teclas de nuestro teclado
# Incorporar una tabla de records
#
# Este programa consistira en un test de reflejos, para esto mostrara una imagen
# de uno de 5 elementos :
# - Flecha arriba
# - Flecha abajo
# - Flecha derecha
# - Flecha izquierda
# - Barra espaciadora
#
# En cuanto se muestre la imagen debemos pulsar la tecla correspondiente en nuestro teclado
# y medira nuestro tiempo de respuesta. Cuanto mas bajos sean nuestros tiempos mejor.
#
# Dispondremos de 3 modos de juego :
# - Unica reaccion : Nos saldra una cuenta atras,en cuanto se acabe mostrara un solo elemento
#   y mostrara nuestro tiempo de respuesta
# - Cadena : Nos mostrara una cadena de 10 elementos aleatorios que debemos introducir en orden, en caso de
#   equivocarnos perderemos la partida. El objetivo sera introducir la cadena en el menor tiempo posible.
# - Constancia : Identico al modo 'Unica reaccion' pero en lugar de mostrar un solo elemento mostrara 5
#   (de uno en uno), y nos dara la media de tiempo de todas las reacciones.


# Instanciamos random
var random_timer
var random = RandomNumberGenerator.new()

# Esta funcion se llama en cada frame y se utiliza para comprobar si la respuesta del usuario es correcta
func _process(_delta):
	# Condiciones de acierto
	if (Input.is_action_pressed("ui_up")     && $Image.animation == "ui_up")    \
	|| (Input.is_action_pressed("ui_down")   && $Image.animation == "ui_down")  \
	|| (Input.is_action_pressed("ui_right")  && $Image.animation == "ui_right") \
	|| (Input.is_action_pressed("ui_left")   && $Image.animation == "ui_left")  \
	|| (Input.is_action_pressed("ui_select") && $Image.animation == "ui_select"):
		$HUD.stop_time()
		$HUD.show_message("CORRECT")
		$TimerHUD.start()
	
	# Condiciones de fallo
	if (Input.is_action_pressed("ui_up")     && $Image.animation != "ui_up")    \
	|| (Input.is_action_pressed("ui_down")   && $Image.animation != "ui_down")  \
	|| (Input.is_action_pressed("ui_right")  && $Image.animation != "ui_right") \
	|| (Input.is_action_pressed("ui_left")   && $Image.animation != "ui_left")  \
	|| (Input.is_action_pressed("ui_select") && $Image.animation != "ui_select"):
		$HUD.reset_time()
		$HUD.show_message("INCORRECT")
		$TimerHUD.start()

# Metodo para regresar al HUD del menu principal y ocultar 'Tecla' y 'Message'
func _on_TimerHUD_timeout():
	$Image.hide_image()
	$HUD.hide_message()
	$HUD.show_HUD()

# Seleccionamos un timer aleatorio de entre los 4 disponibles
func determinar_timer():
	# Le indicamos al usuario que se prepare pare reaccionar
	$HUD.show_message("GET READY")
	random.randomize()
	random_timer = random.randi_range(1, 4)
	print("El numero de random_timer es :")
	print(random_timer)
	if random_timer == 1:
		$RandomTimer1.start()
	if random_timer == 2:
		$RandomTimer2.start()
	if random_timer == 3:
		$RandomTimer3.start()
	if random_timer == 4:
		$RandomTimer4.start()

# Metodos para comezar los distintos tipos de partidas
# 1 - ONE REACTION
# 2 - CHAIN
# 3 - CONSTANCY

var selected_mode

func game_1():
	selected_mode = 1
	determinar_timer()
func game_2():
	selected_mode = 2
func game_3():
	selected_mode = 3

# Metodo para ejecutar el modo de juego seleccionado
func run_game():
	
	# ONE REACTION
	if selected_mode == 1:
		$Image.determinar_imagen()
		$Image.show_image()
		$HUD.start_time()
		$HUD.hide_message()
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
