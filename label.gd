extends Label


func _on_item_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		show()
