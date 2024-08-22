extends Button

@export var action_name: String
var listen_for_input = false
var default_event

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = action_name
	default_event = InputMap.action_get_events(action_name)[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_pressed() -> void:
	text = "..."
	listen_for_input = true
	
func _input(event: InputEvent) -> void:
	if listen_for_input and event is InputEventKey:
		InputMap.action_erase_event(action_name, default_event)
		InputMap.action_add_event(action_name, event)
		listen_for_input = false
		text = action_name
		release_focus()
