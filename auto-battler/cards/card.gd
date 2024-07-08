@tool
class_name Card
extends AspectRatioContainer

@onready var attack_control := %Attack as CenterContainer
@onready var health_control := %Health as CenterContainer
var player: Player
var monitorables: Dictionary


func _ready() -> void:
	for monitorable in monitorables.values():
		connect_monitorable(monitorable)


func _get(property: StringName) -> Variant:
	return monitorables.get(property, null)


func add_monitorable(node: Node) -> void:
	# TODO: Safe add when duplicate monitorables exist (while on Editor)
	monitorables[node.get_script().get_global_name()] = node
	
	if is_node_ready():
		connect_monitorable(node)


func remove_monitorable(node: Node) -> void:
	# TODO: Safe erase when duplicate monitorables exist (while on Editor)
	monitorables.erase(node.get_script().get_global_name())
	
	if node is AttackCard:
		attack_control.visible = false
	elif node is AttackableCard:
		health_control.visible = false


func connect_monitorable(monitorable: Node):
	if monitorable is AttackCard:
		monitorable.damage_update.connect(update_damage)
		attack_control.visible = true
		update_damage(monitorable.damage)
	elif monitorable is AttackableCard:
		monitorable.health_update.connect(update_health)
		health_control.visible = true
		update_health(monitorable.health)


func update_damage(value: int) -> void:
	attack_control.get_node("AttackValue").text = str(value)


func update_health(value: int) -> void:
	health_control.get_node("HealthValue").text = str(value)
