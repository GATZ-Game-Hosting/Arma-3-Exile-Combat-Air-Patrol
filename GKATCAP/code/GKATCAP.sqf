if (!isServer) exitWith {};

private ["_GKSpawn","_GKGroupCenter","_GKGroup","_GK_PlaneClass","_GKJet","_GKempty","_GKunit","_GKCrew","_GKTargets","_GKdist",
		 "_GKnearestTarget","_GKcheck","_GKDriver","_GKCommander","_GKPlaneName","_GKLoopTime","_GKPos","_inMarker"];


_GKGroupCenter = createCenter GKJetAISide;
_GKGroup = createGroup [GKJetAISide,true];

_GKSpawn = [] call GKATCAPFindSafePos;

_GK_PlaneClass = selectRandom GK_Plane;

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

_GKCrew = fullCrew _GKJet;

		 if (count _GKCrew > 1) then
			{
				_GKDriver = driver _GKJet;
				_GKCommander = commander _GKJet;
				_GKDriver disableAI "AUTOCOMBAT";
				_GKDriver disableAI "AUTOTARGET";
				_GKDriver disableAI "TARGET";
				_GKCommander disableAI "AUTOCOMBAT";
				_GKCommander disableAI "AUTOTARGET";
				_GKCommander disableAI "TARGET";
			};
					
		if (count _GKCrew < 2) then
			{
				_GKDriver = driver _GKJet;
				_GKDriver disableAI "AUTOCOMBAT";
				_GKDriver disableAI "AUTOTARGET";
				_GKDriver disableAI "TARGET";
			};

while {alive _GKJet} do 
	{ 	
		 _GKLoopTime = time;
		 _GKTargets = (getPosATL _GKJet) nearEntities ["Air", GKSearchDist];
		 _GKdist = GKSearchDist;
		 _GKnearestTarget = objNull;
		 
		 _GKpos = getPos _GKJet;
		 _inMarker = _GKpos inArea "GKAT CAP";
		 if (!(_inMarker)) then {_GKJet doMove (getMarkerPos "GKAT CAP")};

		{
			_GKcheck = _x distance _GKJet;
			if((_GKcheck < _GKdist) && (side _x != EAST)) then
			{
				_GKdist = _GKcheck;
				_GKnearestTarget = _x;

				if (count _GKCrew > 1) then
					{
						_GKDriver doTarget _x;
						_GKCommander doTarget _x;
					};
							
				if (count _GKCrew < 2) then
					{
						_GKDriver doTarget _x;
					};
			};
		}count _GKTargets;
		waitUntil {time - _GKLoopTime >= 3};
	};

					{
						deleteVehicle _x;
					}foreach units _GKGroup;;
		
				GK_liveJets = GK_liveJets - 1;
				GK_liveJetsArray = GK_liveJetsArray - [_GKJet];
