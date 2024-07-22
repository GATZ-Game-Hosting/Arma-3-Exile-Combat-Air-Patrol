/*
GKAT CAP
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/

if (!isServer) exitWith {};

call compile preprocessFileLineNumbers "GKATCAP\config.sqf";
	
GK_liveJets	 				= 0;
GK_liveJetsArray       		= [];

publicVariable "GK_liveJets";
publicVariable "GK_liveJetsArray";

missionNamespace setVariable [format ["LastJetSpawnedAt"], 0];

	[120, GKATCAPStart, [], true] call ExileServer_system_thread_addtask;

"PostInit finished" call GKATCAPLogging;