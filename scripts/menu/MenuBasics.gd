extends Control

func _on_rich_text_label_meta_clicked(meta):
	OS.shell_open(str(meta))

func _on_btn_back_button_down():
	visible = false
