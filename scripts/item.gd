extends Node2D

var colours = ["white","yellow", "red", "green", "blue", "black", "purple", "pink", "cyan", "orange"]
var items = ["tshirt"]
var rng = RandomNumberGenerator.new()
var number = 0
var color = ""
var shippingTime = 0
var condition = "Good"
var condition_price_mult = 1
var price = 0

@onready var sprite: AnimatedSprite2D = $TextureButton/item_sprite;

func _ready() -> void:
	generate_parameters(items.pick_random())
	switch_shirt(number);

func _process(delta: float) -> void:
	if $TextureButton.hovered_item == true:
		sprite.play("default")
	else:
		sprite.stop()

func generate_parameters(type):
	if type == "tshirt":
		number = rng.randi_range(0, 9)
		color = colours[number]
		shippingTime = rng.randi_range(1, 5.0)
		condition = "Good"
		if condition == "Good":
			condition_price_mult = 1
		price = snapped(2 * condition_price_mult * rng.randf_range(0.8,1.2),0.01)

func switch_shirt(num):
	set_node_palette(tshirt_sprite, num)

func set_node_palette(target_sprite: AnimatedSprite2D, num):
	if target_sprite and target_sprite.material is ShaderMaterial:
		target_sprite.set_instance_shader_parameter("palette_index", num)
