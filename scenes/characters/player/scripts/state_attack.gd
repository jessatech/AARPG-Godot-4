class_name Attack_State extends State


var attacking : bool = false
var hurt_delay : float = 0.1

@export var attack_sound : AudioStream
@export_range(1, 20, 0.5) var decelerate_speed : float = 5.0

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attackfx_anim: AnimationPlayer = $"../../Sprite/AttackEffectSprite/AnimationPlayer"
@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

@onready var idle: Idle_State = $"../Idle"
@onready var walk: Walk_State = $"../Walk"
@onready var hurt_box: HurtBox = %AttackHurtBox


# Happens when state is entered
func enter() -> void:
	player.update_animation("attack")
	attackfx_anim.play("attack_" + player.anim_direction())
	animation_player.animation_finished.connect(end_attack)
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9, 1.1)
	audio.play()
	attacking = true
	await get_tree().create_timer(hurt_delay).timeout
	hurt_box.monitoring = true


# Happens when state is exited
func exit() -> void:
	animation_player.animation_finished.disconnect(end_attack)
	attacking = false
	hurt_box.monitoring = false


# Happens during the _process update in this State
func process(_delta : float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
		
	return null


# Happens during the _physics_process update to this State
func physics(_delta : float) -> State:
	return null


# Handles input events in this state
func handle_input(_event : InputEvent) -> State:
	return null


func end_attack(_newAnimName : String) -> void:
	attacking = false
