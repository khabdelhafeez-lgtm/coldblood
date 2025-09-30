extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
		body.Damage()
	pass # Replace with function body.
#called when the node enters the scene tree for the first time.
func _ready():
	pass #called every frome 'delta' is the time since the previous frmne.
func _process(delta):
	pass
	
