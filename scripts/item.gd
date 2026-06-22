extends Node2D

var TShirtColors = ["white","yellow", "red", "green", "blue", "black", "purple", "pink", "cyan", "orange"]
var item = "t-shirt"
var rng = RandomNumberGenerator.new()
var number = 0
var color = ""
var shippingTime = 0
var condition = "Good"
var condition_price_mult = 1
var price = 0

@onready var tshirt_sprite: Sprite2D = $Tshirt;


func _ready() -> void:
	# why will noting PRINT.
	generate_parameters("tshirt")
	switch_shirt(number);
	
func generate_parameters(type):
	if type == "tshirt":
		item = "t-shirt"
		number = rng.randi_range(0, 9)
		color = TShirtColors[number]
		shippingTime = rng.randi_range(1, 5.0)
		condition = "Good"
		if condition == "Good":
			condition_price_mult = 1
		price = snapped(2 * condition_price_mult * rng.randf_range(0.8,1.2),0.01)

func switch_shirt(num):
	set_node_palette(tshirt_sprite, num)

func set_node_palette(target_sprite: Sprite2D, num):
	if target_sprite and target_sprite.material is ShaderMaterial:
		target_sprite.set_instance_shader_parameter("palette_index", num)



func _on_click_area_mouse_entered() -> void:
	print("hello")
