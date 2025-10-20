class_name HitBox extends Area2D


signal damaged( damage : int)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func take_damage(damage : int) -> void:
	print("TakeDamage: ", damage)
	damaged.emit(damage)
