# Combat Air Patrol Challenge
Usage: change settings to your liking in config.sqf and then make the GKATCAP folder into a pbo and drop into
@ExileServer\addons folder of your server.

Then take the CAP_Marker.sqf and place it in your mpmissions\Exile.Altis\Custom folder and add

[] execVM "custom\CAP_Marker.sqf";

to your init.sqf

Meant for Altis but could be altered for any map if you change the coordinates in the GKATCAPFindSafePos

Chooses 1 of 3 locations on Altis to spawn a Combat Air Patrol (Dog Fighting Arena).  When you enter the Arena in a plane or Jet you go 1v1 against an AI Fighter Jet and you gain money and respect based on whatever you set in the config.sqf.
