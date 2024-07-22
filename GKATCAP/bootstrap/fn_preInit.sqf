private["_code"];

{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
	['GKATCAPStart','GKATCAP\code\GKATCAPStart.sqf'],
	['GKATCAP','GKATCAP\code\GKATCAP.sqf'],
	['GKATCAPLogging','GKATCAP\code\GKATCAPLogging.sqf'],
	['GKATCAPJetSpawn','GKATCAP\code\GKATCAPJetSpawn.sqf'],
	['GKATCAPFindSafePos','GKATCAP\code\GKATCAPFindSafePos.sqf'],
	['GKATCAPAISpawn','GKATCAP\code\GKATCAPAISpawn.sqf'],
	['GKATCAPRespectPayout','GKATCAP\code\GKATCAPRespectPayout.sqf'],
	['GKATCAPMarker','GKATCAP\code\GKATCAPMarker.sqf'],
	['GKATCAPAreaRespect','GKATCAP\code\GKATCAPAreaRespect.sqf']
];

"PreInit finished" call GKATCAPLogging;
