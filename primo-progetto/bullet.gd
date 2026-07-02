extends Area2D

const SPEED = 250.0

func _process(delta):
	# Move the bullet to the left continuously
	global_position.y += SPEED * delta

# This function triggers automatically when a physical body enters the bullet's area
func _on_body_entered(body):
	# Se colpiamo il giocatore, fa danno alla barra
	if body.name == "player":
		print("Target confirmed! Player has been hit!")
		var shield_bar = get_parent().get_node("shieldBar")
		if shield_bar != null:
			shield_bar.accorcia_barra()
		queue_free()
		
	# Se colpiamo lo scudo, il proiettile si distrugge e blocca il colpo!
	elif body.name == "shieldBar":
		print("Attack blocked by the shield!")
		queue_free()
		
	# Se il proiettile manca tutto e tocca il pavimento, si distrugge
	elif body.name == "Floor":
		queue_free()
