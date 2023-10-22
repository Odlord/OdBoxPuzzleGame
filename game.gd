extends Node2D

var game_end = false
var moves = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/MovesLabel.text = 'Moves: ' + str(moves)
	if game_end == false:
		var spots = $Spots.get_child_count()
		for i in $Spots.get_children():
			if i.occupied:
				spots -= 1
		if spots == 0:
			win()

func win():
	game_end = true
	get_tree().paused = true
	$CanvasLayer/Control.visible = true;


func _on_button_restart_pressed():
	game_end = false
	get_tree().paused = false
	get_tree().reload_current_scene()
