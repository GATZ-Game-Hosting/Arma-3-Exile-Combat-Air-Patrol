/*
GKAT CAP
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/

GKSpawnTime = 60;									//Delay between spawning each jet on server start.

GKMaxJets = 3;										//Max number of jets to have on server at the same time.

GKJetAISide = EAST;									//Side The AI should be on.

GKSearchDist = 2000;								//max radius the AI jet will search for a suitable target.			

GKRespect = round (random [10000, 20000, 25000]);	//Respect payout to player for destroying jet.
													//If jet only gets damaged and crashing to ground is what destroys it the player does not get respect.

GKMoney = round (random [35000, 50000, 75000]);		//Money payout to player for destroying jet.
				
GK_Plane = [										//list of jets for system to choose from. 			
				"B_Plane_Fighter_01_F",				
				"B_Plane_Fighter_01_Stealth_F",		
				"O_Plane_Fighter_02_F",
				"O_Plane_Fighter_02_Stealth_F",
				"I_Plane_Fighter_04_F",
				"CUP_B_F35B_USMC"
			];