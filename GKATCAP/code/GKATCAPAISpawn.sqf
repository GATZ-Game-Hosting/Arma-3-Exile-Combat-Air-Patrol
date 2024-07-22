if (!isServer) exitWith {};

private ["_GKGroup","_GKSpawn","_GKunit"];

_GKGroup = _this select 0;
_GKSpawn = _this select 1;

_GKunit = _GKGroup createUnit ["O_Soldier_unarmed_F", _GKSpawn, [], 0, "CAN_COLLIDE"];

_GKunit allowFleeing 0;
_GKunit setUnitPos "UP";
[_GKunit] joinSilent _GKGroup;

{_GKunit removeWeaponGlobal _x;} 	forEach (weapons _GKunit);
{_GKunit unlinkItem _x;} 			forEach (assignedItems _GKunit);
{_GKunit removeItem _x;} 			forEach (items _GKunit);
removeAllItemsWithMagazines 	_GKunit;
removeHeadgear 					_GKunit;
removeUniform 					_GKunit;
removeVest 						_GKunit;
removeBackpackGlobal 			_GKunit;

_GKunit setSkill ["aimingAccuracy", 0.50];
_GKunit setSkill ["aimingShake", 0.50];
_GKunit setSkill ["aimingSpeed", 0.50];
_GKunit setSkill ["endurance", 1.00];
_GKunit setSkill ["spotDistance", 0.01];
_GKunit setSkill ["spotTime", 0.01];
_GKunit setSkill ["courage", 1.00];
_GKunit setSkill ["reloadSpeed", 1.00];
_GKunit setSkill ["commanding", 1.00];
_GKunit setSkill ["general", 1.00];
_GKunit forceAddUniform "U_B_PilotCoveralls";
_GKunit addVest "V_RebreatherB";
_GKunit addHeadgear "H_PilotHelmetFighter_B";
_GKunit addWeapon "hgun_Rook40_F";
_GKunit addmagazines ["16Rnd_9x21_Mag",4];
_GKunit addBackpack "B_Parachute";

[_GKunit] joinSilent _GKGroup;

_GKunit