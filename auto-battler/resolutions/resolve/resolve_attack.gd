extends Resolution


func _resolve():
	var effect := get("effect") as AttackEffect
	var target := get("target") as Card
	var source := get("source") as Card
	
	await (source.get("AttackCard") as AttackCard).attack_animation(target)
	
	(target.get("AttackableCard") as AttackableCard).health -= effect.damage
	await (target.get("AttackableCard") as AttackableCard).damage_animation()
	
