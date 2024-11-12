extends Control

func _ready() -> void:
	$Background/UpgradePickaxeButton/UpgradePickaxeLabel.text = str("upgrade pickaxe:\n\n ",Global.pickaxe_upgrade_cost," stone")
	$Background/UpgradeDrillButton/UpgradeDrillLabel.text = str("upgrade drill:\n\n ",Global.drill_upgrade_cost," stone")
	$Background/StatisticsLabel.text = str("statistics:\n stone: ",Global.stone,"\npickaxe level: ", Global.pickaxe_level,"/2000\n drill level: ", Global.drill_level,"/2000")
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel") && !Global.animation_playing:
		_on_back_button_pressed()

func _on_upgrade_pickaxe_button_pressed() -> void:
	if Global.stone >= Global.pickaxe_upgrade_cost && Global.pickaxe_level < 2000 && Global.stone <= Global.stone_limit:
		Global.stone -= Global.pickaxe_upgrade_cost
		Global.multiplier += 2
		Global.pickaxe_level += 1
		Global.pickaxe_upgrade_cost += 20
		$Background/UpgradePickaxeButton/UpgradePickaxeLabel.text = str("upgrade pickaxe:\n\n ",Global.pickaxe_upgrade_cost," stone")
		$Background/StatisticsLabel.text = str("statistics:\n stone: ",Global.stone,"\npickaxe level: ", Global.pickaxe_level,"/2000\n drill level: ", Global.drill_level,"/2000")
		$Background/DescriptionLabel.text = str("description: \n\nincreases the amount of \nstone you earn per click\n\n currently: ", Global.multiplier, " \nper click")
		
func _on_upgrade_drill_button_pressed() -> void:
	if Global.stone >= Global.drill_upgrade_cost && Global.drill_level < 2000 && Global.stone <= Global.stone_limit:
		Global.stone -= Global.drill_upgrade_cost
		Global.drill_multiplier += 4
		Global.drill_level += 1
		Global.drill_upgrade_cost += 100
		$Background/UpgradeDrillButton/UpgradeDrillLabel.text = str("upgrade drill:\n\n ",Global.drill_upgrade_cost," stone")
		$Background/DescriptionLabel.text = str("description: \n\nincreases the amount of \nstone you earn per second \n\n currently: ", Global.drill_multiplier * 10, " \nper second")
		$Background/StatisticsLabel.text = str("statistics:\n stone: ",Global.stone,"\npickaxe level: ", Global.pickaxe_level,"/2000\n drill level: ", Global.drill_level,"/2000")
		
		
func _on_back_button_pressed() -> void:
	$Transition.play("transition")
	Global.animation_playing = true
	disable_buttons()
	await $Transition.animation_finished
	Global.animation_playing = false
	get_tree().change_scene_to_file("res://world.tscn")

func _on_upgrade_pickaxe_button_mouse_entered() -> void:
	$Background/DescriptionLabel.text = str("description: \n\nincreases the amount of \nstone you earn per click\n\n currently: ", Global.multiplier, " \nper click")

func _on_upgrade_drill_button_mouse_entered() -> void:
	$Background/DescriptionLabel.text = str("description: \n\nincreases the amount of \nstone you earn per second \n\n currently: ", Global.drill_multiplier * 10, " \nper second")

func _on_upgrade_button_mouse_exited() -> void:
	$Background/DescriptionLabel.text = str("")

func disable_buttons():
	#disables all buttons to prevent them being pressed while changing scenes
	$Background/BackButton.disabled = true
