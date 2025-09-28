extends Node



var time_vault = 300

var time_gain = 30
var time_lost = -15

func change_time(val):
	time_vault += val

func set_time(val):
	time_vault = val

func show_time():
	print(time_vault)

func give_time():
	return time_vault
