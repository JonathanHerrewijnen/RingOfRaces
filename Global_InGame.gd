extends Node2D

#Global functions for the game, like speech bubbles

func RenderSpeech(load_on, text):
	var speech = preload("res://MiscScenes/Speech.tscn").instance()
	speech.bubble_text = text
	speech.set_position(Vector2(0,-40))
	load_on.add_child(speech)
