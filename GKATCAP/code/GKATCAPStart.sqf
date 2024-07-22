/*
GKAT CAP
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/

private["_GKJetSpawnedAt","_GKSpawnTime","_GKlastSpawnedAt"];

GK_liveJets = count(GK_liveJetsArray);
		
			if (GK_liveJets < GKMaxJets) then
				{
					_GKJetSpawnedAt = format ["LastJetSpawnedAt"];
					_GKSpawnTime = GKSpawnTime;
					_GKlastSpawnedAt = missionNamespace getVariable [_GKJetSpawnedAt, 0];

					if (time - _GKlastSpawnedAt >= _GKSpawnTime) then
					{
						"Spawning Jet" call GKATCAPLogging;
						[]spawn GKATCAP;
						missionNamespace setVariable [_GKJetSpawnedAt, time];
					};
				};