extends Node
# Global Variables
@onready var settings = {
	"bgm_vol": 0.0,
	"sfx_vol": 0.0,
	"master_vol": 0.0,
}

@onready var default_settings = {
	"bgm_vol": 0.8,
	"sfx_vol": 0.7,
	"master_vol": 0.75,
}

var BGM_BUS_ID = AudioServer.get_bus_index("BGM")
var SFX_BUS_ID = AudioServer.get_bus_index("SFX")
var MASTER_BUS_ID = AudioServer.get_bus_index("Master")

var PLAYER_SETTINGS_PATH = "res://settings.save"

func _init():
	load_settings()

func load_settings():
	if FileAccess.file_exists(PLAYER_SETTINGS_PATH):
		var file = FileAccess.open(PLAYER_SETTINGS_PATH, FileAccess.READ)
		settings = file.get_var()
	else:
		settings = default_settings

func save_settings():
	var file = FileAccess.open(PLAYER_SETTINGS_PATH, FileAccess.WRITE)
	file.store_var(settings)

func reset_settings():
	settings = Utils.copy_dictionary(default_settings)
