extends Control

@export var game_mode_label:RichTextLabel
@export var difficulty_label:RichTextLabel


func _on_rich_text_label_meta_clicked(meta):
	OS.shell_open(str(meta))

func _on_btn_back_button_down():
	visible = false

func setup(game_mode:String, difficulty:String, stage_select = -1):
	if game_mode=="BOSS_RUSH":
		game_mode_label.text = "BOSS RUSH"
	else :
		game_mode_label.text = "Stage %d" % [stage_select]
	
	difficulty_label.text = difficulty
