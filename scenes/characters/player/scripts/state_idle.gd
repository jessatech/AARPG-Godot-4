class_name Idle_State extends State


@onready var walk: Walk_State = $"../Walk"


# Happens when state is entered
func enter() -> void:
	player.update_animation("idle")


# Happens when state is exted
func exit() -> void:
	pass


# Happens during the _process update in this State
func process(_delta : float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null


# Happens during the _physics_process update to this State
func physics(_delta : float) -> State:
	return null


# Handles input events in this state
func handle_input(_event : InputEvent) -> State:
	return null
