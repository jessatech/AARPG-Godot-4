class_name Walk_State extends State


@export var move_speed : float = 100

@onready var idle: Idle_State = $"../Idle"


# Happens when state is entered
func enter() -> void:
	player.update_animation("walk")


# Happens when state is exted
func exit() -> void:
	pass


# Happens during the _process update in this State
func process(_delta : float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.set_direction():
		player.update_animation("walk")
	
	return null

# Happens during the _physics_process update to this State
func physics(_delta : float) -> State:
	return null


# Handles input events in this state
func handle_input(_event : InputEvent) -> State:
	return null
