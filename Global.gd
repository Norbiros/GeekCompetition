extends Node

signal teleported_in(next_scene_path)
signal itembar_changed()
signal start_creating_game(level)
signal start_game(level)
signal pressed_menu_button(button)

var start_position = Vector2.ZERO
var teleporting = false
var show_tp_animation = false
var SAVE_KEY = "global"

var level_name = "Untitled"

var inventory_state = false
var inventory = preload("res://UI/HUD/Inventory/Inventory.tres") # So it is saved when you change scene

func _ready():
	emit_signal("itembar_changed")
	emit_signal("teleported_in") # Remove stupid debugger warning


func save(save_game : Resource):
	save_game.data[SAVE_KEY + "_level_name"] = level_name

func load(save_game : Resource):
	start_position = save_game.data[SAVE_KEY]

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		GameSaver.save()
