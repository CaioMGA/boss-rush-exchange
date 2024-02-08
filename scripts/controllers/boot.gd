extends Node2D

func _ready():
	# load settings
	Globals.load_settings()
	
	#apply loaded settings
	AudioServer.set_bus_volume_db(Globals.BGM_BUS_ID, linear_to_db(Globals.settings["bgm_vol"]))
	AudioServer.set_bus_mute(Globals.BGM_BUS_ID, Globals.settings["bgm_vol"] < .05)
	AudioServer.set_bus_volume_db(Globals.SFX_BUS_ID, linear_to_db(Globals.settings["sfx_vol"]))
	AudioServer.set_bus_mute(Globals.SFX_BUS_ID, Globals.settings["sfx_vol"] < .05)
	AudioServer.set_bus_volume_db(Globals.MASTER_BUS_ID, linear_to_db(Globals.settings["master_vol"]))
	AudioServer.set_bus_mute(Globals.MASTER_BUS_ID, Globals.settings["master_vol"] < .05)
	
	# change scene
	get_tree().change_scene_to_file("res://scenes/rooms/TitleScreen.tscn")
