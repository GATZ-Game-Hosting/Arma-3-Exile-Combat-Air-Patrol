if (!isServer) exitWith {};

Params ["_playerClose"];

Private ["_GKcenter","_GKpos","_playerX","_playerY","_markerX","_markerY","_playerpos","_player","_spawnX","_spawnY","_differenceX","_differenceY","_totalplayers"];

_totalplayers = count _playerClose;

_GKcenter = getMarkerPos "GKAT CAP";

if (_totalplayers > 1) then
	{
	_GKpos = _GKcenter getPos [5025, random 360];
	}
	else
	{
		_markerX = _GKcenter select 0;
		_markerY = _GKcenter select 1;
		
		_player = _playerClose select 0;
		_playerpos = getPos _player;
		
		_playerX = _playerpos select 0;
		_playerY = _playerpos select 1;
		
		if (_playerX > _markerX) then
			{
			_differenceX = _playerX - _markerX;
			_spawnX = _markerX - _differenceX;
			}
			else
			{
			_differenceX = _markerX - _playerx;
			_spawnX = _markerX + _differenceX;
			};
		
		if (_playerY > _markerY) then
			{
			_differenceY = _playerY - _markerY;
			_spawnY = _markerY - _differenceY;
			}
			else
			{
			_differenceY = _markerY - _playerY;
			_spawnY = _markerY + _differenceY;
			};
		
		_GKpos = [_spawnX, _spawnY, 0];
	};

_GKpos