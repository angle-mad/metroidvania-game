extends CollisionShape2D


@onready var timer: Timer = $"../Timer"


	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
