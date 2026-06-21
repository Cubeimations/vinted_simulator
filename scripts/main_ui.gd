extends Control

func show_page(page_name):
	for child in get_children():
		child.visible = false
	
	get_node(page_name).visible = true


func _on_button_pressed() -> void:
	show_page("Home")

func _ready() -> void:
	for n in 100:
		var item = load("res://scenes/item_ui.tscn")
		var item_scene = item.instantiate()
		item_scene.set_name("item UI")
		$Home/Sections/Centre/MarginContainer/ScrollContainer/GridContainer.add_child(item_scene)
	
