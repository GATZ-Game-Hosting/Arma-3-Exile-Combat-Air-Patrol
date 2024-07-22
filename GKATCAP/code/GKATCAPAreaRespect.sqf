/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.4 4/30/2022
*/

if (!isServer) exitWith {};

private ["_playerpos","_playervert","_GKareaRepIncrease","_GKinarea","_GKrepMSG"];

if (GKCAPArea) then
{
	while {isServer} do
		{
			{
			_playerpos = getPosASLW _x;
			_playervert = _playerpos select 2;
			if ((_x inArea "Large CAP") && (_playervert > 100)) then
				{
					sleep GKCCAPAreaRepPayInterval;
					_GKareaRepIncrease = GKCAPAreaRepPay;
					_GKinarea = _x getVariable ["ExileScore",0];
					_GKinarea = _GKinarea + _GKareaRepIncrease;
					_GKrepMSG = [[format ["In CAP Threat Area + Respect"],_GKareaRepIncrease]];
					[_x, "showFragRequest", [_GKrepMSG]] call ExileServer_system_network_send_to;
					_x setVariable ["ExileScore",_GKinarea];
					ExileClientPlayerScore = _GKinarea;
					(owner _x) publicVariableClient "ExileClientPlayerScore";
					ExileClientPlayerScore = nil;
				};
			}forEach allPlayers;
		};
};