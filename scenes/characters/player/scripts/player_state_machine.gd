class_name PlayerStateMachine extends Node


var states : Array[ State ]
var previous_state : State
var current_state : State
var _player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Disable processing until initialize() is called
	process_mode = Node.PROCESS_MODE_DISABLED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_state:
		change_state(current_state.process(delta))


func _physics_process(delta: float) -> void:
	if current_state:
		change_state(current_state.physics(delta))


func _unhandled_input(event: InputEvent) -> void:
	if current_state:
		change_state(current_state.handle_input(event))


func initialize(player : Player) -> void:
	_player = player
	states.clear()
	
	for child in get_children():
		if child is State:
			states.append(child)
	
	for state in states:
		state.configure(_player)
	
	# Pick an initial state explicitly (avoid coupling to child order)
	if states.size() > 0:
		change_state(get_state_by_name("Idle")) # or: change_state(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT


func change_state(new_state : State) -> void:
	if new_state == null || new_state == current_state:
		return
	
	if current_state:
		current_state.exit()
	
	previous_state = current_state
	current_state = new_state
	current_state.enter()


# Helper if you want explicit selection that doesn’t rely on order
func get_state_by_name(state_name: String) -> State:
	for state in states:
		if state.name == state_name:
			return state
	return null
