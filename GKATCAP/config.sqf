/*
GATZ CAP
Created by GATZ Game Hosting
https://discord.gg/K86Sf9TNJG
*/

GKSpawnTime = 60;									//Delay between spawning each jet on server start.

GKMaxJets = 1;										//Max number of jets to have on server at the same time.

GKJetAISide = EAST;									//Side The AI should be on.

GKRespect = round (random [10000, 20000, 25000]);	//Respect payout to player for destroying jet.
													//If jet only gets damaged and crashing to ground is what destroys it the player does not get respect.

GKMoney = round (random [100000, 120000, 150000]);		//Money payout to player for destroying jet.

GKPos = selectRandom [[18983.7,27999.1,0],[28008.3,11016.7,0],[3984.03,3478.15,0]];
				
GK_Plane = [										//list of jets for system to choose from. 			
				"B_Plane_Fighter_01_F",
				"O_Plane_Fighter_02_F",
				"I_Plane_Fighter_04_F",
				"CUP_B_F35B_USMC"
			];
