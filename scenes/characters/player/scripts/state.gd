class_name State extends Node


# Stores reference to the player that this State belongs to
var player: Player


func configure(p: Player) -> void:
	player = p

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Happens when state is entered
func enter() -> void:
	pass


# Happens when state is exited
func exit() -> void:
	pass


# Happens during the _process update in this State
func process(_delta : float) -> State:
	return null # return self to “stay”, or another State instance to transition


# Happens during the _physics_process update to this State
func physics(_delta : float) -> State:
	return null


# Handles input events in this state
func handle_input(_event : InputEvent) -> State:
	return null
