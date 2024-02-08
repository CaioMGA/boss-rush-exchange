extends Node

func copy_dictionary(dict:Dictionary):
	var new_dict = {}
	for k in dict.keys():
		new_dict[k] = dict[k]
	return new_dict
