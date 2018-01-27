extends Node2D

export(NodePath) var initial_bard_path

onready var activeInstrument = null
onready var camera = $Camera2D
var game_over = false

func _ready():
	activeInstrument = get_node(initial_bard_path)
	for instrument in get_tree().get_nodes_in_group("bards"):
		instrument.stage = self

func changeActive(body):
	self.activeInstrument = body
	if activeInstrument.is_in_group("sentinels"):
		game_over = true
		OS.alert("GAME OVER", "u suk")

func _on_Input_played():
	if not game_over and not activeInstrument.hasSoundwave:
			activeInstrument.pulse()

func _process(delta):
	self.camera.position = self.activeInstrument.get_global_position()