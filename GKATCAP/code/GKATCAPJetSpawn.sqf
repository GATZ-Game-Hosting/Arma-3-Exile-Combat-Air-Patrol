if (!isServer) exitWith {};

private ["_GK_PlaneClass","_GKSpawn","_GKJet","_GKJetKillRep"];

_GK_PlaneClass = _this select 0;
_GKSpawn = _this select 1;

_GKJet = createVehicle [_GK_PlaneClass, _GKSpawn, [], 0, "FLY"];

_GKJet engineOn true;

_GKJet lock 2;

_GKJet setFuel 1;

_GKJet setVehicleAmmo 1;

_GKJet flyInHeight 1000;

_GKJetKillRep = missionNamespace getVariable "GKRespect";

_GKJetKillMoney = missionNamespace getVariable "GKMoney";

_GKJet setVariable ["GKAT_Jet_Respect",_GKJetKillRep];

_GKJet setVariable ["GKAT_Jet_Money",_GKJetKillMoney];

_GKJet addMPEventHandler ["MPKilled",'if (isServer) then { _this call GKATCAPRespectPayout; }; '];

_GKJet