extends Resolution


func _resolve():
	var target := get("target") as Card
	
	target.free()
