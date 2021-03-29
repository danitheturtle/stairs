extends KinematicBody

onready var north = $PivotNorth;
onready var detectNorth = $PivotNorth/DetectorNorth;
onready var east = $PivotEast;
onready var detectEast = $PivotEast/DetectorEast;
onready var south = $PivotSouth;
onready var detectSouth = $PivotSouth/DetectorSouth;
onready var west = $PivotWest;
onready var detectWest = $PivotWest/DetectorWest;

var adjacentStairs = [null, null, null, null];

enum { NORTH, EAST, SOUTH, WEST }

# Called when the node enters the scene tree for the first time.
func _ready():
	detectNorth.connect("body_entered", self, "_on_Detect_entered", [NORTH]);
	detectEast.connect("body_entered", self, "_on_Detect_entered", [EAST]);
	detectSouth.connect("body_entered", self, "_on_Detect_entered", [SOUTH]);
	detectWest.connect("body_entered", self, "_on_Detect_entered", [WEST]);
	detectNorth.connect("body_exited", self, "_on_Detect_exited", [NORTH]);
	detectEast.connect("body_exited", self, "_on_Detect_exited", [EAST]);
	detectSouth.connect("body_exited", self, "_on_Detect_exited", [SOUTH]);
	detectWest.connect("body_exited", self, "_on_Detect_exited", [WEST]);

func _on_Detect_entered(ref, dir):
	if ref.is_in_group("stairs"):
		adjacentStairs[dir] = ref;
		print(adjacentStairs);

func _on_Detect_exited(ref, dir):
	if ref.is_in_group("stairs") and adjacentStairs[dir] != null:
		adjacentStairs[dir] = null;
		print(adjacentStairs);
