if (!isServer) exitWith {};

private ["_GKmapCenterPos","_GKminCenter","_GKmaxCenter","_GKmindistCenter","_GKwaterSetting","_GKshoreSetting","_GKcenter","_GKmarker","_GKdot","_GKPos","_marker","_markerName","_GKmarkerL"];

_GKPos = selectRandom [[18977.7,26621.7,0],[26674.4,11586.3,0],[4377.62,4320.84,0]];
//Marker//
for "_i" from 0 to (count allMapMarkers)-1 do
            {
                private _marker = allMapMarkers select _i;
                private _markerName = markerText _marker;
				
                if !(["GKAT", _markerName] call BIS_fnc_inString)then
				{
					_GKmarker = createMarker ["GKAT CAP", _GKPos];
					_GKmarker setMarkerColor "ColorKhaki";
					_GKmarker setMarkerShape "ELLIPSE";
					_GKmarker setMarkerBrush "Solid";
					_GKmarker setMarkerSize [2000,2000];
					_GKmarker setMarkerAlpha 0.5;
					_GKmarkerL = createMarker ["Large CAP", _GKPos];
					_GKmarkerL setMarkerColor "ColorKhaki";
					_GKmarkerL setMarkerShape "ELLIPSE";
					_GKmarkerL setMarkerBrush "Solid";
					_GKmarkerL setMarkerSize [4000,4000];
					_GKmarkerL setMarkerAlpha 0.5;
					_GKdot = createMarker ["GKAT Dot", _GKPos];
					_GKdot setMarkerType "GroundSupport_CAS_EAST";
					_GKdot setMarkerText "GKAT Combat Air Patrol";
				};
			};
_GKcenter = getMarkerPos "GKAT CAP";				
_GKcenter