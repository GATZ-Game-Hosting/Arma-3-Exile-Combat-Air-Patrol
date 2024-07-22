if (!isServer) exitWith {};

call compile preprocessFileLineNumbers "GKATCAP\config.sqf";
	
GK_liveJets	 				= 0;
GK_liveJetsArray       		= [];

publicVariable "GK_liveJets";
publicVariable "GK_liveJetsArray";

missionNamespace setVariable [format ["LastJetSpawnedAt"], 0];
[]call GKATCAPMarker;
[]spawn GKATCAPAreaRespect;
	[60, GKATCAPStart, [], true] call ExileServer_system_thread_addtask;
"PostInit finished" call GKATCAPLogging;