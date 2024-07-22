uiSleep 30;
if(isNil'MARKER_ID')then
{
	private _centerPosition = getMarkerPos "Large CAP";
	private _radius = (getMarkerSize "Large CAP") select 0;
	private _circumference = 2 * pi * _radius;
	private _steps = _circumference / 40;
	private _anglePerStep = 360 / _steps;
	for "_i" from 0 to _steps do
	{
		private _angle = _i * _anglePerStep;
		private _position =
		[
			(_centerPosition select 0) + (cos _angle) * _radius,
			(_centerPosition select 1) + (sin _angle) * _radius,
			100
		];
			private _object = createSimpleObject ["exile_assets\model\exile_zonemarker_Red.p3d", _position,true];
			_object setDir (-_angle + 90);
	};
MARKER_ID = true;
};
