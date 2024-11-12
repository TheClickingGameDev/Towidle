extends Control

func _ready() -> void:
	if Global.tower_level == 10:
		$Background/UpgradeTowerButton.visible = false
	else:
		$Background/UpgradeTowerButton/UpgradeTowerLabel.text = str("cost: ",Global.tower_upgrade_cost)
	$Background/StatisticsLabel.text = str("statistics:\n\n tower level: ", Global.tower_level, "/10")
	
	match Global.tower_level:
		0:
			$Background/TowerTextureRect.texture = null
		1:
			$Background/TowerTextureRect.texture = load("res://Assets/towerStage1.png")
		2:
			$Background/TowerTextureRect.texture = load("res://Assets/towerStage2.png")
		3:
			$Background/TowerTextureRect.texture = load("res://Assets/towerStage3.png")
		4:
			$Background/TowerTextureRect.texture = load("res://Assets/towerStage4.png")
		5:
			$Background/TowerTextureRect.texture = load("res://Assets/tower.png")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel") && !Global.animation_playing:
		_on_back_button_pressed()

func _on_upgrade_tower_button_pressed() -> void:
	if Global.stone >= Global.tower_upgrade_cost && Global.tower_level < 10 && Global.stone <= Global.stone_limit:
		$Transition.play("transition")
		Global.animation_playing = true
		$Background/UpgradeTowerButton.disabled = true
		await $Transition.animation_finished
		Global.animation_playing = false
		$Background/UpgradeTowerButton.disabled = false
		Global.stone -= Global.tower_upgrade_cost
		Global.tower_upgrade_cost *= 10
		Global.tower_level += 1
		_ready()
		$Background.modulate = Color.WHITE #changes the background back to normal
		
	$Background/UpgradeTowerButton/UpgradeTowerLabel.text = str("cost: ",Global.tower_upgrade_cost)
	$Background/StatisticsLabel.text = str("statistics:\n\n tower level: ", Global.tower_level, "/10")

func _on_back_button_pressed() -> void:
	$Transition.play("transition")
	Global.animation_playing = true
	disable_buttons()
	await $Transition.animation_finished
	Global.animation_playing = false
	get_tree().change_scene_to_file("res://world.tscn")
	
func disable_buttons():
	#disables all buttons to prevent them being pressed while changing scenes
	$Background/BackButton.disabled = true
	
