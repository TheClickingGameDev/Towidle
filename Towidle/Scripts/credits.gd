extends Control

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel") && !Global.animation_playing:
		_on_back_button_pressed()

func _on_back_button_pressed() -> void:
	$Transition.play("transition")
	Global.animation_playing = true
	disable_buttons()
	await $Transition.animation_finished
	Global.animation_playing = false
	get_tree().change_scene_to_file("res://main_menu.tscn")

func disable_buttons():
	#disables all buttons to prevent them being pressed while changing scenes
	$Background/BackButton.disabled = true
