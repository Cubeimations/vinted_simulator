extends TextureButton

var hovered_item : bool = false

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
	hovered_item = true

func _on_mouse_exited() -> void:
	hovered_item = false
