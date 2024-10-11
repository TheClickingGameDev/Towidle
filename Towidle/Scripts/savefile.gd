extends Node

var config = ConfigFile.new()

func save():
	#config
	config.set_value("Save", "fullscreen", Global.fullscreen_active)
	
	#gameplay
	config.set_value("Save", "stone", Global.stone)
	config.set_value("Save", "pickaxe_level", Global.pickaxe_level)
	config.set_value("Save", "multiplier", Global.multiplier)
	config.set_value("Save", "pickaxe_upgrade_cost", Global.pickaxe_upgrade_cost)
	config.set_value("Save", "drill_level", Global.drill_level)
	config.set_value("Save", "drill_multiplier", Global.drill_multiplier)
	config.set_value("Save", "drill_upgrade_cost", Global.drill_upgrade_cost)
	config.set_value("Save", "tower_level", Global.tower_level)
	config.set_value("Save", "tower_upgrade_cost", Global.tower_upgrade_cost)
	
	config.save("user://savefile.txt")
	
func load():
	config.load("user://savefile.txt")
	
	#config
	Global.fullscreen_active = config.get_value("Save", "fullscreen", Global.fullscreen_active)
	
	#gameplay
	Global.stone = config.get_value("Save", "stone", Global.stone)
	Global.pickaxe_level = config.get_value("Save", "pickaxe_level", Global.pickaxe_level)
	Global.multiplier = config.get_value("Save", "multiplier", Global.multiplier)
	Global.pickaxe_upgrade_cost = config.get_value("Save", "pickaxe_upgrade_cost", Global.pickaxe_upgrade_cost)
	Global.drill_level = config.get_value("Save", "drill_level", Global.drill_level)
	Global.drill_multiplier = config.get_value("Save", "drill_multiplier", Global.drill_multiplier)
	Global.drill_upgrade_cost = config.get_value("Save", "drill_upgrade_cost", Global.drill_upgrade_cost)
	Global.tower_level = config.get_value("Save", "tower_level", Global.tower_level)
	Global.tower_upgrade_cost = config.get_value("Save", "tower_upgrade_cost", Global.tower_upgrade_cost)
