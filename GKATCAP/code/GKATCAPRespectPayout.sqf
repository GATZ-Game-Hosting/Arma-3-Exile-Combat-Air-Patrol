private ["_GKVictim","_GKInstigator","_InstigatorUID","_GKKillerRespect","_GKKillMSG1","_GKKillMSG2","_GKKillMSG1","_PayIncrease","_KillerPay"];

_GKvictim = _this select 0;
_GKInstigator = _this select 2;
_InstigatorUID = getPlayerUID _GKInstigator;

if ((!isNull _GKInstigator) && (isplayer _GKInstigator)) then
	{
		///Add Money
		_PayIncrease = _GKVictim getVariable "GKAT_Jet_Money";
		_KillerPay = _GKInstigator getVariable ["ExileMoney", 0];
		_KillerPay = _KillerPay + _PayIncrease;
		_GKInstigator setVariable ["ExileMoney",_KillerPay, true];
		_GKKillMSG2 = [[format ["Enemy Jet Down!"],_PayIncrease]];
		[_GKInstigator, "showFragRequest", [_GKKillMSG2]] call ExileServer_system_network_send_to;

		///Original Rep
		_GKRepIncrease = _GKVictim getVariable "GKAT_Jet_Respect";
		_GKKillerRespect = _GKInstigator getVariable ["ExileScore", 0];
		//_GKKillMSG1 = [[format ["Enemy Jet Down!"],_GKRepIncrease]];
		_GKKillerRespect = _GKKillerRespect + _GKRepIncrease;
		_GKInstigator setVariable ["ExileScore",_GKKillerRespect];
		//[_GKInstigator, "showFragRequest", [_GKKillMSG1]] call ExileServer_system_network_send_to;
		format["setAccountScore:%1:%2", _GKKillerRespect, _InstigatorUID] call ExileServer_system_database_query_fireAndForget;
		ExileClientPlayerScore = _GKKillerRespect;
		(owner _GKInstigator) publicVariableClient "ExileClientPlayerScore";
		ExileClientPlayerScore = nil;
	};