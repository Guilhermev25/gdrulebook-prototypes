extends Resolution


func _resolve():
	var card := get("card") as Card
	
	for effect in (card.get("IniciativeCard") as IniciativeCard).get_chain_effects():
		(rulebook as CompiledRulebook).enqueue_effect(effect)
