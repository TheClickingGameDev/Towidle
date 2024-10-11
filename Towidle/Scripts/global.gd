extends Node

#config
var fullscreen_active : bool = false

#gameplay
var stone : int = 0

var multiplier : int = 1
var drill_multiplier : int = 0

var pickaxe_level : int = 1
var pickaxe_upgrade_cost : int = 20

var drill_level : int = 0
var drill_upgrade_cost : int = 100

var tower_level : int = 0
var tower_upgrade_cost : int = 1000

var stone_limit = 100000000000

#misc
var animation_playing = false
