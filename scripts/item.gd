extends Node2D

enum tshirt_colors { white, yellow, red, green, blue, black, purple, pink, cyan, orange  }

@onready var tshirt_sprite: Sprite2D = $Tshirt;

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var number = rng.randi_range(0, 10.0)
	switch_shirt(number);
	
func switch_shirt(theme_id: tshirt_colors):
	set_node_palette(tshirt_sprite, theme_id)
	
func set_node_palette(target_sprite: Sprite2D, theme_id: tshirt_colors):
	if target_sprite and target_sprite.material is ShaderMaterial:
		target_sprite.set_instance_shader_parameter("palette_index", theme_id)
