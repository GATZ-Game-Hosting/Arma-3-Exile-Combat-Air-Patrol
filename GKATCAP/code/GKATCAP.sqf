if (!isServer) exitWith {};

private ["_GKSpawn","_GKGroupCenter","_GKGroup","_GK_PlaneClass","_GKJet","_GKempty","_GKunit","_GKCrew","_GKTargets","_GKdist",
		 "_GKnearestTarget","_GKcheck","_GKCommander","_GKPlaneName","_GKLoopTime","_GKPos","_inMarker","_playerClose"];


_GKGroupCenter = createCenter GKJetAISide;
_GKGroup = createGroup [GKJetAISide,true];

_GK_PlaneClass = selectRandom GK_Plane;
_playerClose = [];
	{
		if ((_x inArea "Large CAP") && (vehicle _x isKindof "helicopter" || vehicle _x isKindof "plane")) then
			{
			_playerClose pushback _x;
			};
	}forEach allPlayers;
_nearplayercount = count _playerClose;

_GKSpawn = [_playerClose] call GKATCAPFindSafePos;

if (_nearplayercount > 0) then
	{
		"Spawning Jet" call GKATCAPLogging;
		_GKJet = [_GK_PlaneClass,_GKSpawn] call GKATCAPJetSpawn;
		
					GK_liveJets = GK_liveJets + 1;
					GK_liveJetsArray = GK_liveJetsArray + [_GKJet];
				
		_GKempty = [_GK_PlaneClass, false] call BIS_fnc_crewCount;
		
		for "_i" from 1 to _GKempty do
			{
				_GKunit = [_GKGroup,_GKSpawn] call GKATCAPAISpawn;
				
				_GKunit moveInAny _GKJet;	
			};
		
		_GKGroup addVehicle _GKJet;
		
		_GKPlaneName = getText(configFile >> "CfgVehicles" >> typeOf(_GKJet) >> "displayName");
		format ["%1 Jet has joined the Combat Air Patrol", _GKPlaneName] remoteExecCall ["systemChat",-2];
		
		[_GKJet,_GKGroup] spawn 
		{
			Params ["_GKJet","_GKGroup"];
			while {isServer} do 
			{
				_GKDriver = driver _GKJet;
				_GKCommander = commander _GKJet;
				_GKGunner = gunner _GKJet;
				_playerClose = [];
				Sleep 1;
				if (alive _GKJet) then
				{
				_GKpos = getPos _GKJet;
				_inMarker = _GKpos inArea "GKAT CAP";
					if (!(_inMarker)) then {
					_GKJet doMove (getMarkerPos "GKAT CAP");
					_GKDriver doMove (getMarkerPos "GKAT CAP");
					};
				};
				Sleep 1;
				{
					if (_x inArea "Large CAP") then
						{
						_playerClose pushback _x;
						};
				}forEach allPlayers;
				_nearplayercount = count _playerClose;
				Sleep 1;
				if (_nearplayercount < 1) then
					{
					deleteVehicle _GKJet;
					deleteVehicle _GKDriver;
					
						if !(isNull _GKCommander) then
						{
						deleteVehicle _GKCommander;
						};
						
						if !(isNull _GKGunner) then
						{
						deleteVehicle _GKGunner;
						};
					};
				Sleep 1;
				if !(alive _GKJet) then
				{
					GK_liveJets = GK_liveJets - 1;
					GK_liveJetsArray = GK_liveJetsArray - [_GKJet];
					_GKGroup leaveVehicle _GKJet;	
				};
				Sleep 1;
			};
		};
	};

