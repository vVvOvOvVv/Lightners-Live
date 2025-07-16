extends Node

var GAME_STATE: int # determine current state of the game
enum STATES {MENU, SONG_SELECT, PERFORM} # values for GAME_STATE
var IS_ALT_NOTE: bool 
