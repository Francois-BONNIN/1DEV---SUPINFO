extends Node2D

# Variable grille:
export (int) var width;
export (int) var height;
export (int) var x_start;
export (int) var y_start;
export (int) var offset;

var possible_pieces = [
preload("res://BluePiece.tscn"),
preload("res://GreenPiece.tscn"),
preload("res://PinkPiece.tscn"),
preload("res://YellowPiece.tscn"),
preload("res://BluePiece.tscn"),
preload("res://GreenPiece.tscn"),
preload("res://PinkPiece.tscn"),
preload("res://YellowPiece.tscn"),
preload("res://BluePiece.tscn"),
preload("res://GreenPiece.tscn"),
preload("res://PinkPiece.tscn"),
preload("res://YellowPiece.tscn"),
preload("res://Bouteille.tscn"),
preload("res://BrownPiece.tscn")
];

export var all_pieces = [];

func _ready():
	randomize();
	all_pieces = make_2D_array();
	spawn_pieces();
	
	
func make_2D_array():
	var array = [];
	for i in width:
		array.append([])
		for j in height:
			array[i].append(null);
	return array;
	
func spawn_pieces(): 
	for i in width:
		for j in height:
			#choose a random number and store it
			var rand = rand_range(0, possible_pieces.size());
			var piece = possible_pieces[rand].instance();
			add_child(piece);
			piece.position = grid_to_pixel(i,j);
	
#Convertit les coordonnées de la grille, en pixel de l'écran actuel
func grid_to_pixel(column, row):
	var new_x = x_start + offset * column;
	var new_y = y_start + -offset * row;
	return Vector2(new_x, new_y);	