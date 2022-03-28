extends AnimatedSprite

# Antes de que pulse los botones no se muestra ninguna tecla
func _ready():
	hide()

# Instanciamos random
var random_image
var random = RandomNumberGenerator.new()

# Seleccionamos 1 imagen aleatoria de entre las 5 disponibles
func determinar_imagen():
	random.randomize()
	random_image = random.randi_range(1,5)
	print("El numero de random_animation es :")
	print(random_image)
	if random_image == 1:
		animation = "ui_up"
	if random_image == 2:
		animation = "ui_down"
	if random_image == 3:
		animation = "ui_right"
	if random_image == 4:
		animation = "ui_left"
	if random_image == 5:
		animation = "ui_select"

# Metodo para mostrar tecla
func show_image():
	show()

# Metodo para esconder tecla
func hide_image():
	hide()
