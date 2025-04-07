extends CanvasLayer

@onready var energy_label: Label = $EnergyLabel
@onready var materials_label: Label = $MaterialsLabel
@onready var day_label: Label = $DayLabel

func _ready() -> void:
	materials_label.text = "Materials: "+str(GameManager.player_ore)
	GameManager.connect("ore_updated", on_ore_update)
	day_label.text = GameManager.get_day()

func _on_submersible_energy_update(energy: float) -> void:
	energy_label.text = "Energy: "+str(maxf(energy, 0)).pad_decimals(1)
	if (energy <= 10):
		pass #change colour to red else back to yellow
		
func on_ore_update(ore_amount) -> void:
	materials_label.text = "Materials: "+str(ore_amount)
