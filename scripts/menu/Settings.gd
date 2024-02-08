extends Control
@onready var bgm_slider = $MarginContainer/VBoxContainer/GridContainer/BGMSlider
@onready var sfx_slider = $MarginContainer/VBoxContainer/GridContainer/SFXSlider
@onready var master_slider = $MarginContainer/VBoxContainer/GridContainer/MasterSlider

var old_settings = {}

func update_ui():
	bgm_slider.value = Globals.settings["bgm_vol"]
	sfx_slider.value = Globals.settings["sfx_vol"]
	master_slider.value = Globals.settings["master_vol"]

func _on_btn_back_button_down():
	await Globals.save_settings()
	visible = false

func _on_bgm_slider_value_changed(value):
	Globals.settings["bgm_vol"] = value
	AudioServer.set_bus_volume_db(Globals.BGM_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(Globals.BGM_BUS_ID, value < .05)

func _on_sfx_slider_value_changed(value):
	Globals.settings["sfx_vol"] = value
	AudioServer.set_bus_volume_db(Globals.SFX_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(Globals.SFX_BUS_ID, value < .05)

func _on_master_slider_value_changed(value):
	Globals.settings["master_vol"] = value
	AudioServer.set_bus_volume_db(Globals.MASTER_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(Globals.MASTER_BUS_ID, value < .05)

func _on_revert_button_down():
	Globals.settings = Utils.copy_dictionary(old_settings)
	update_ui()

func _on_reset_button_down():
	# reset to default settings
	Globals.reset_settings()
	bgm_slider.value = Globals.settings["bgm_vol"]
	sfx_slider.value = Globals.settings["sfx_vol"]
	master_slider.value = Globals.settings["master_vol"]

func show_settings():
	old_settings = Utils.copy_dictionary(Globals.settings)
	update_ui()
	visible = true

