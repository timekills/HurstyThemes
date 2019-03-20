#!/usr/bin/env bash

# This file is NOT part of The RetroPie Project
#
# This script is a third party script to install the RetroHursty
# Emulation Station themes onto a RetroPie build.
#
#

function depends_hurstythemes() {
    if isPlatform "x11"; then
        getDepends feh
    else
        getDepends fbi
    fi
}

function install_theme_hurstythemes() {
    local theme="$1"
    local repo="$2"
    if [[ -z "$repo" ]]; then
        repo="RetroHursty69"
    fi
    if [[ -z "$theme" ]]; then
        theme="carbon"
        repo="RetroPie"
    fi
    sudo git clone "https://github.com/$repo/es-theme-$theme.git" "/etc/emulationstation/themes/$theme"
}

function uninstall_theme_hurstythemes() {
    local theme="$1"
    if [[ -d "/etc/emulationstation/themes/$theme" ]]; then
        sudo rm -rf "/etc/emulationstation/themes/$theme"
    fi
}

function disable_script() {
dialog --infobox "...processing..." 3 20 ; sleep 2
ifexist=`cat /opt/retropie/configs/all/autostart.sh |grep themerandom |wc -l`
if [[ ${ifexist} > "0" ]]
then
  perl -pi -w -e 's/\/home\/pi\/scripts\/themerandom.sh/#\/home\/pi\/scripts\/themerandom.sh/g;' /opt/retropie/configs/all/autostart.sh
fi
sleep 2
}

function enable_script() {
dialog --infobox "...processing..." 3 20 ; sleep 2
ifexist=`cat /opt/retropie/configs/all/autostart.sh |grep themerandom |wc -l`
if [[ ${ifexist} > "0" ]]
then
  perl -pi -w -e 's/#\/home\/pi\/scripts\/themerandom.sh/\/home\/pi\/scripts\/themerandom.sh/g;' /opt/retropie/configs/all/autostart.sh
else
  cp /opt/retropie/configs/all/autostart.sh /opt/retropie/configs/all/autostart.sh.bkp
  echo "/home/pi/scripts/themerandom.sh" > /tmp/autostart.sh
  cat /opt/retropie/configs/all/autostart.sh >> /tmp/autostart.sh
  chmod 777 /tmp/autostart.sh
  cp /tmp/autostart.sh /opt/retropie/configs/all
fi
sleep 2
}

function gui_hurstythemes() {
    local themes=(
        'RetroHursty69 300Sweet'
        'RetroHursty69 AdventureTimeSweet'
        'RetroHursty69 AladdinSweet'
        'RetroHursty69 AlienSweet'
        'RetroHursty69 AmericanDadSweet'
        'RetroHursty69 AngryBirdSweet'
        'RetroHursty69 AnimalCrossingSweet'
        'RetroHursty69 AntManSweet'
        'RetroHursty69 AssassinsSweet'
        'RetroHursty69 AstroBoySweet'
        'RetroHursty69 AustinPowersSweet'
        'RetroHursty69 AvatarSweet'
        'RetroHursty69 BackFutureSweet'
        'RetroHursty69 BanjoSweet'
        'RetroHursty69 BatmanSweet'
        'RetroHursty69 BattletoadsSweet'
        'RetroHursty69 BayonettaSweet'
        'RetroHursty69 BeautyBeastSweet'
        'RetroHursty69 BeavisButtHeadSweet'
        'RetroHursty69 BeetleJuiceSweet'
        'RetroHursty69 BettyBoopSweet'
        'RetroHursty69 BioshockSweet'
        'RetroHursty69 BloodyRoarSweet'
        'RetroHursty69 BombermanSweet'
        'RetroHursty69 BreathofFireSweet'
        'RetroHursty69 BrianLaraSweet'
        'RetroHursty69 BubbleBobbleSweet'
        'RetroHursty69 BuffySweet'
        'RetroHursty69 BugsLifeSweet'
        'RetroHursty69 CODSweet'
        'RetroHursty69 CaptAmericaSweet'
        'RetroHursty69 CarsSweet'
        'RetroHursty69 CastlevaniaSweet'
        'RetroHursty69 ChronoTriggerSweet'
        'RetroHursty69 ChuckySweet'
        'RetroHursty69 ChunLiSweet'
        'RetroHursty69 ContraSweet'
        'RetroHursty69 CrashBandiSweet'
        'RetroHursty69 CrazyTaxiSweet'
        'RetroHursty69 CupheadSweet'
        'RetroHursty69 DKCountrySweet'
        'RetroHursty69 DarkstalkersSweet'
        'RetroHursty69 DayTentacleSweet'
        'RetroHursty69 DeadpoolSweet'
        'RetroHursty69 DeadorAliveSweet'
        'RetroHursty69 DevilMayCrySweet'
        'RetroHursty69 DiabloSweet'
        'RetroHursty69 DieHardSweet'
        'RetroHursty69 DigDugSweet'
        'RetroHursty69 DigimonSweet'
        'RetroHursty69 DoomSweet'
        'RetroHursty69 DoraemonSweet'
        'RetroHursty69 DoubleDragonSweet'
        'RetroHursty69 DrMarioSweet'
        'RetroHursty69 DrWhoSweet'
        'RetroHursty69 DragonballZSweet'
        'RetroHursty69 DragonsLairSweet'
        'RetroHursty69 DuckHuntSweet'
        'RetroHursty69 ETSweet'
        'RetroHursty69 EarthboundSweet'
        'RetroHursty69 DukeNukemSweet'
        'RetroHursty69 EarthwormJimSweet'
        'RetroHursty69 EvilDeadSweet'
        'RetroHursty69 FamilyGuySweet'
        'RetroHursty69 Fantastic4Sweet'
        'RetroHursty69 FarCrySweet'
        'RetroHursty69 FalloutSweet'
        'RetroHursty69 FatalFurySweet'
        'RetroHursty69 FelixSweet'
        'RetroHursty69 FinalFantasySweet'
        'RetroHursty69 FindingNemoSweet'
        'RetroHursty69 FlintstonesSweet'
        'RetroHursty69 FortniteSweet'
        'RetroHursty69 ForzaSweet'
        'RetroHursty69 FoxSweet'
        'RetroHursty69 FreddySweet'
        'RetroHursty69 Friday13thSweet'
        'RetroHursty69 FullThrottleSweet'
        'RetroHursty69 FuturamaSweet'
        'RetroHursty69 FuryRoadSweet'
        'RetroHursty69 FroggerSweet'
        'RetroHursty69 FZeroSweet'
        'RetroHursty69 GEXSweet'
        'RetroHursty69 GOWSweet'
        'RetroHursty69 GTASweet'
        'RetroHursty69 GhostbustersSweet'
        'RetroHursty69 GhostRiderSweet'
        'RetroHursty69 GhoulsSweet'
        'RetroHursty69 GoldenEyeSweet'
        'RetroHursty69 GranTurismoSweet'
        'RetroHursty69 GrimFandangoSweet'
        'RetroHursty69 HalfLifeSweet'
        'RetroHursty69 HaloSweet'
        'RetroHursty69 HalloweenSweet'
        'RetroHursty69 HarryPotterSweet'
        'RetroHursty69 HarvestMoonSweet'
        'RetroHursty69 HelloKittySweet'
        'RetroHursty69 HitmanSweet'
        'RetroHursty69 HulkSweet'
        'RetroHursty69 IncrediblesSweet'
        'RetroHursty69 IndianaJonesSweet'
        'RetroHursty69 InspectorGadgetSweet'
        'RetroHursty69 IronGiantSweet'
        'RetroHursty69 IronManSweet'
        'RetroHursty69 ITSweet'
        'RetroHursty69 JetSetSweet'
        'RetroHursty69 JetsonsSweet'
        'RetroHursty69 JudgeDreddSweet'
        'RetroHursty69 JurassicParkSweet'
        'RetroHursty69 KOFSweet'
        'RetroHursty69 KillerInstinctSweet'
        'RetroHursty69 KillLaKillSweet'
        'RetroHursty69 KindomHeartsSweet'
        'RetroHursty69 KirbySweet'
        'RetroHursty69 KlonoaSweet'
        'RetroHursty69 KongSweet'
        'RetroHursty69 KratosSweet'
        'RetroHursty69 LaraCroftSweet'
        'RetroHursty69 LegoSweet'
        'RetroHursty69 LionKingSweet'
        'RetroHursty69 LordRingsSweet'
        'RetroHursty69 LuigiSweet'
        'RetroHursty69 MLPSweet'
        'RetroHursty69 MOTUSweet'
        'RetroHursty69 MarioBrosSweet'
        'RetroHursty69 MarioKartSweet'
        'RetroHursty69 MarioPartySweet'
        'RetroHursty69 MartiMagicSweet'
        'RetroHursty69 MarvelvsCapcomSweet'
        'RetroHursty69 MassEffectSweet'
        'RetroHursty69 MatrixSweet'
        'RetroHursty69 MaxPayneSweet'
        'RetroHursty69 MechWarriorSweet'
        'RetroHursty69 MegaManSweet'
        'RetroHursty69 MeninBlackSweet'
        'RetroHursty69 MetalGearSweet'
        'RetroHursty69 MetalSlugSweet'
        'RetroHursty69 MetroidSweet'
        'RetroHursty69 MillenniumSweet'
        'RetroHursty69 MinecraftSweet'
        'RetroHursty69 MonkeyBallSweet'
        'RetroHursty69 MonsterHunterSweet'
        'RetroHursty69 MonstersIncSweet'
        'RetroHursty69 MooMesaSweet'
        'RetroHursty69 MortalKombatSweet'
        'RetroHursty69 MuppetsSweet'
        'RetroHursty69 MysticalNinjaSweet'
        'RetroHursty69 NinjaGaidenSweet'
        'RetroHursty69 OddWorldSweet'
        'RetroHursty69 OptimusSweet'
        'RetroHursty69 OutrunSweet'
        'RetroHursty69 OverwatchSweet'
        'RetroHursty69 PaRappaSweet'
        'RetroHursty69 PacmanSweet'
        'RetroHursty69 PaperMarioSweet'
        'RetroHursty69 ParodiusSweet'
        'RetroHursty69 PepsiManSweet'
        'RetroHursty69 PersonaSweet'
        'RetroHursty69 PikminSweet'
        'RetroHursty69 PokemonSweet'
        'RetroHursty69 PopeyeSweet'
        'RetroHursty69 PowerRangersSweet'
        'RetroHursty69 PredatorSweet'
        'RetroHursty69 PrinceofPersiaSweet'
        'RetroHursty69 ProfessorLaytonSweet'
        'RetroHursty69 PunchOutSweet'
        'RetroHursty69 QBertSweet'
        'RetroHursty69 Rainbow6Sweet'
        'RetroHursty69 RachetClankSweet'
        'RetroHursty69 RamboSweet'
        'RetroHursty69 RaymanSweet'
        'RetroHursty69 ReadyPlayer1Sweet'
        'RetroHursty69 RedDeadSweet'
        'RetroHursty69 RenStimpySweet'
        'RetroHursty69 ResidentEvilSweet'
        'RetroHursty69 RoboCopSweet'
        'RetroHursty69 RockBandSweet'
        'RetroHursty69 RogerRabbitSweet'
        'RetroHursty69 RogueSquadronSweet'
        'RetroHursty69 RyuSweet'
        'RetroHursty69 SMWorldSweet'
        'RetroHursty69 SWHothSweet'
        'RetroHursty69 SackBoySweet'
        'RetroHursty69 SamuraiShoSweet'
        'RetroHursty69 SawSweet'
        'RetroHursty69 ScoobyDooSweet'
        'RetroHursty69 ShaneWarneSweet'
        'RetroHursty69 ShrekSweet'
        'RetroHursty69 SilentHillSweet'
        'RetroHursty69 SimCitySweet'
        'RetroHursty69 SimpsonsSweet'
        'RetroHursty69 SimsSweet'
        'RetroHursty69 SmashBrosSweet'
        'RetroHursty69 SmurfsSweet'
        'RetroHursty69 SouthParkSweet'
        'RetroHursty69 SonicSweet'
        'RetroHursty69 SoulCaliburSweet'
        'RetroHursty69 SouljaBoySweet'
        'RetroHursty69 SpaceChannel5Sweet'
        'RetroHursty69 SpeedRacerSweet'
        'RetroHursty69 SpidermanSweet'
        'RetroHursty69 SplinterCellSweet'
        'RetroHursty69 SpongebobSweet'
        'RetroHursty69 SpyroSweet'
        'RetroHursty69 StarTrekSweet'
        'RetroHursty69 StrangerThingsSweet'
        'RetroHursty69 StreetsRageSweet'
        'RetroHursty69 SuicideSquadSweet'
        'RetroHursty69 SupermanSweet'
        'RetroHursty69 TMNTSweet'
        'RetroHursty69 TeamFortress2Sweet'
        'RetroHursty69 TekkenSweet'
        'RetroHursty69 TerminatorSweet'
        'RetroHursty69 ToejamEarlSweet'
        'RetroHursty69 TonyHawkSweet'
        'RetroHursty69 TotalRecallSweet'
        'RetroHursty69 ToyStorySweet'
        'RetroHursty69 TronSweet'
        'RetroHursty69 TronLegacySweet'
        'RetroHursty69 TwistedMetalSweet'
        'RetroHursty69 UnchartedSweet'
        'RetroHursty69 UpSweet'
        'RetroHursty69 VenomSweet'
        'RetroHursty69 ViewtifulJoeSweet'
        'RetroHursty69 VirtuaFighterSweet'
        'RetroHursty69 VirtuaTennisSweet'
        'RetroHursty69 WallESweet'
        'RetroHursty69 WarioSweet'
        'RetroHursty69 WitcherSweet'
        'RetroHursty69 WolfensteinSweet'
        'RetroHursty69 WonderWomanSweet'
        'RetroHursty69 WormsSweet'
        'RetroHursty69 WoWSweet'
        'RetroHursty69 WrestleManiaSweet'
        'RetroHursty69 XMenSweet'
        'RetroHursty69 YoshiSweet'
        'RetroHursty69 YuGiOhSweet'
        'RetroHursty69 ZeldaSweet'
        'RetroHursty69 ZombiesAteSweet'
        'RetroHursty69 arcade1up_aspectratio54'
        'RetroHursty69 back2basics'
        'RetroHursty69 batmanburton'
        'RetroHursty69 bitfit'
        'RetroHursty69 bluray'
        'RetroHursty69 boxalloyblue'
        'RetroHursty69 boxalloyred'
        'RetroHursty69 boxcity'
        'RetroHursty69 cabsnazzy'
        'RetroHursty69 cardcrazy'
        'RetroHursty69 circuit'
        'RetroHursty69 comiccrazy'
        'RetroHursty69 corg'
        'RetroHursty69 crisp'
        'RetroHursty69 crisp_light'
        'RetroHursty69 cyber'
        'RetroHursty69 darkswitch'
        'RetroHursty69 disenchantment'
        'RetroHursty69 donkeykonkey'
        'RetroHursty69 dragonballz'
        'RetroHursty69 evilresident'
        'RetroHursty69 fabuloso'
        'RetroHursty69 garfieldism'
        'RetroHursty69 graffiti'
        'RetroHursty69 greenilicious'
        'RetroHursty69 halloweenspecial'
        'RetroHursty69 heman'
        'RetroHursty69 heychromey'
        'RetroHursty69 heychromey_aspectratio54'
        'RetroHursty69 homerism'
        'RetroHursty69 hurstybluetake2'
        'RetroHursty69 hurstyspin'
        'RetroHursty69 incredibles'
        'RetroHursty69 infinity'
        'RetroHursty69 joysticks'
        'RetroHursty69 license2game'
        'RetroHursty69 lightswitch'
        'RetroHursty69 magazinemadness'
	'RetroHursty69 mariobrosiii'
        'RetroHursty69 mario_melee'
        'RetroHursty69 merryxmas'
        'RetroHursty69 minecraft'
        'RetroHursty69 minions'
        'RetroHursty69 mysticorb'
        'RetroHursty69 NegativeColor'
        'RetroHursty69 NegativeSepia'
        'RetroHursty69 neogeo_only'
        'RetroHursty69 orbpilot'
        'RetroHursty69 pacman'
        'RetroHursty69 pitube'
        'RetroHursty69 primo'
        'RetroHursty69 primo_light'
        'RetroHursty69 retroboy'
        'RetroHursty69 retroboy2'
        'RetroHursty69 retrogamenews'
        'RetroHursty69 retroroid'
        'RetroHursty69 snapback'
        'RetroHursty69 snazzy'
        'RetroHursty69 soda'
        'RetroHursty69 spaceinvaders'
        'RetroHursty69 stirling'
        'RetroHursty69 sublime'
        'RetroHursty69 supersweet'
        'RetroHursty69 supersweet_aspectratio54'
        'RetroHursty69 tmnt'
        'RetroHursty69 tributeGoT'
        'RetroHursty69 tributeSTrek'
        'RetroHursty69 tributeSWars'
        'RetroHursty69 vertical_arcade'
	'RetroHursty69 vertical_limit_verticaltheme'
        'RetroHursty69 whiteslide'
        'RetroHursty69 whitewood'
        'RetroHursty69 AladdinCool'
        'RetroHursty69 AnimalCrossingCool'
	'RetroHursty69 ArmyMenCool'
        'RetroHursty69 BanjoCool'
        'RetroHursty69 BatmanCool'
	'RetroHursty69 BayonettaCool'
        'RetroHursty69 BombermanCool'
	'RetroHursty69 BowserCool'
        'RetroHursty69 BubbleBobbleCool'
	'RetroHursty69 BubsyCool'
        'RetroHursty69 CastlevaniaCool'
	'RetroHursty69 CaptainAmericaCool'
        'RetroHursty69 ContraCool'
        'RetroHursty69 CrashBandicootCool'
	'RetroHursty69 CupheadCool'
        'RetroHursty69 DarkstalkersCool'
        'RetroHursty69 DayTentacleCool'
        'RetroHursty69 DeadOrAliveCool'
        'RetroHursty69 DevilMayCryCool'
        'RetroHursty69 DKCountryCool'
        'RetroHursty69 DonkeyKongCool'
        'RetroHursty69 DoubleDragonCool'
        'RetroHursty69 DragonballZCool'
        'RetroHursty69 DrMarioCool'
        'RetroHursty69 DuckHuntCool'
        'RetroHursty69 EarthwormJimCool'
	'RetroHursty69 EggmanCool'
	'RetroHursty69 FalloutCool'
        'RetroHursty69 FatalFuryCool'
        'RetroHursty69 FinalFantasyCool'
        'RetroHursty69 FroggerCool'
        'RetroHursty69 FZeroCool'
        'RetroHursty69 GexCool'
        'RetroHursty69 GhoulsNGhostsCool'
	'RetroHursty69 GodOfWarCool'
        'RetroHursty69 GoldenEyeCool'
        'RetroHursty69 GrimFandangoCool'
        'RetroHursty69 GTACool'
	'RetroHursty69 HaloCool'
	'RetroHursty69 HarleyQuinnCool'
        'RetroHursty69 HarryPotterCool'
        'RetroHursty69 HeManCool'
        'RetroHursty69 HulkCool'
        'RetroHursty69 IncrediblesCool'
        'RetroHursty69 IndianaJonesCool'
	'RetroHursty69 InspectorGadgetCool'
        'RetroHursty69 JetSetRadioCool'
        'RetroHursty69 KillerInstinctCool'
        'RetroHursty69 KindomHeartsCool'
        'RetroHursty69 KirbyCool'
        'RetroHursty69 KOFCool'
        'RetroHursty69 LegoCool'
        'RetroHursty69 LittleBigPlanetCool'
        'RetroHursty69 LuigiCool'
        'RetroHursty69 MarioBrosCool'
        'RetroHursty69 MarioCool'
        'RetroHursty69 MarioKartCool'
        'RetroHursty69 MarioPartyCool'
        'RetroHursty69 MegaManCool'
        'RetroHursty69 MetalSlugCool'
        'RetroHursty69 MetroidCool'
        'RetroHursty69 MGSCool'
        'RetroHursty69 MonkeyBallCool'
        'RetroHursty69 MortalKombatCool'
        'RetroHursty69 OddworldCool'
        'RetroHursty69 OutrunCool'
        'RetroHursty69 PacmanCool'
        'RetroHursty69 ParappaCool'
        'RetroHursty69 ParodiusCool'
        'RetroHursty69 PepsiManCool'
        'RetroHursty69 PikminCool'
        'RetroHursty69 PokemonCool'
        'RetroHursty69 PowerRangersCool'
        'RetroHursty69 PredatorCool'
        'RetroHursty69 PrincePersiaCool'
        'RetroHursty69 PunchOutCool'
        'RetroHursty69 QBertCool'
	'RetroHursty69 RachetClankCool'
        'RetroHursty69 RaymanCool'
        'RetroHursty69 RenStimpyCool'
        'RetroHursty69 ResidentEvilCool'
        'RetroHursty69 RobocopCool'
        'RetroHursty69 SamuraiShodownCool'
        'RetroHursty69 ShrekCool'
        'RetroHursty69 SimpsonsCool'
        'RetroHursty69 SimsCool'
        'RetroHursty69 SmashBrosCool'
        'RetroHursty69 SmurfsCool'
        'RetroHursty69 SonicCool'
        'RetroHursty69 SoulCaliburCool'
        'RetroHursty69 SouthParkCool'
        'RetroHursty69 SpaceChannel5Cool'
        'RetroHursty69 SpaceInvadersCool'
        'RetroHursty69 SpiderManCool'
	'RetroHursty69 SplatoonCool'
        'RetroHursty69 SplinterCellCool'
        'RetroHursty69 SpyroCool'
        'RetroHursty69 StarFoxCool'
        'RetroHursty69 StarTrekCool'
        'RetroHursty69 StreetFighterCool'
        'RetroHursty69 StreetsOfRageCool'
	'RetroHursty69 SupermanCool'
        'RetroHursty69 TekkenCool'
        'RetroHursty69 TMNTCool'
        'RetroHursty69 TerminatorCool'
	'RetroHursty69 ToadCool'
        'RetroHursty69 TonyHawkCool'
        'RetroHursty69 ToyStoryCool'
        'RetroHursty69 TwistedMetalCool'
	'RetroHursty69 UnchartedCool'
	'RetroHursty69 WaluigiCool'
        'RetroHursty69 WarioCool'
        'RetroHursty69 WolfensteinCool'
	'RetroHursty69 WolverineCool'
        'RetroHursty69 WormsCool'
        'RetroHursty69 WrestlemaniaCool'
        'RetroHursty69 XMenCool'
        'RetroHursty69 YoshiCool'
	'RetroHursty69 YuGiOhCool'
        'RetroHursty69 ZeldaCool'
	'RetroHursty69 BatmanSpin'
	'RetroHursty69 BombermanSpin'
	'RetroHursty69 BowserSpin'
	'RetroHursty69 CaptainAmericaSpin'
	'RetroHursty69 CrashBandicootSpin'
	'RetroHursty69 DonkeyKongSpin'
	'RetroHursty69 DragonballZSpin'
	'Retroursty69 DrMarioSpin'
	'RetroHursty69 EarthwormJimSpin'
	'RetroHursty69 FatalFurySpin'
	'RetroHursty69 FinalFantasySpin'
	'RetroHursty69 FroggerSpin'
	'RetroHursty69 FZeroSpin'
	'RetroHursty69 GexSpin'
	'RetroHursty69 GhoulsNGhostsSpin'
	'RetroHursty69 GodOfWarSpin'
	'RetroHursty69 GrimFandangoSpin'
	'RetroHursty69 GTASpin'
	'RetroHursty69 HaloSpin'
	'RetroHursty69 HarleyQuinnSpin'
	'RetroHursty69 HulkSpin'
	'RetroHursty69 IncrediblesSpin'
	'RetroHursty69 IndianaJonesSpin'
	'RetroHursty69 JetSetRadioSpin'
	'RetroHursty69 KillerInstinctSpin'
	'RetroHursty69 SmurfsSpin'
	'RetroHursty69 SonicSpin'
	'RetroHursty69 SoulCaliburSpin'
	'RetroHursty69 SouthParkSpin'
	'RetroHursty69 SpaceChannel5Spin'
	'RetroHursty69 SpaceInvadersSpin'
	'RetroHursty69 SpidermanSpin'
	'RetroHursty69 SplattoonSpin'
	'RetroHursty69 SplinterCellSpin'
	'RetroHursty69 SpyroSpin'
	'RetroHursty69 StarFoxSpin'
	'RetroHursty69 StreetFighterSpin'
	'RetroHursty69 StreetsOfRageSpin'
	'RetroHursty69 TekkenSpin'
	'RetroHursty69 TerminatorSpin'
	'RetroHursty69 TMNTSpin'
	'RetroHursty69 ToadSpin'
	'RetroHursty69 ToyStorySpin'
	'RetroHursty69 WarioSpin'
	'RetroHursty69 WormsSpin'
	'RetroHursty69 WrestlingSpin'
	'RetroHursty69 XMenSpin'
	'RetroHursty69 YoshiSpin'
	'RetroHursty69 ZeldaSpin'
    )
    while true; do
        local theme
        local installed_themes=()
        local repo
        local options=()
        local status=()
        local default

        options+=(U "Update install script - script will exit when updated")
        options+=(E "Enable ES bootup theme randomizer")
        options+=(D "Disable ES bootup theme randomizer")

        local i=1
        for theme in "${themes[@]}"; do
            theme=($theme)
            repo="${theme[0]}"
            theme="${theme[1]}"
            if [[ -d "/etc/emulationstation/themes/$theme" ]]; then
                status+=("i")
                options+=("$i" "Update or Uninstall $theme (installed)")
                installed_themes+=("$theme $repo")
            else
                status+=("n")
                options+=("$i" "Install $theme (not installed)")
            fi
            ((i++))
        done
        local cmd=(dialog --default-item "$default" --backtitle "Hursty's ES Themes Installer" --menu "Hursty's ES Themes Installer - Choose an option" 22 76 16)
        local choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        default="$choice"
        [[ -z "$choice" ]] && break
        case "$choice" in
            U)  #update install script to get new theme listings
                cd "/home/pi/RetroPie/retropiemenu" 
                mv "hurstythemes.sh" "hurstythemes.sh.bkp" 
                wget "https://raw.githubusercontent.com/retrohursty69/HurstyThemes/master/hurstythemes.sh" 
                if [[ -f "/home/pi/RetroPie/retropiemenu/hurstythemes.sh" ]]; then
                  echo "/home/pi/RetroPie/retropiemenu/hurstythemes.sh" > /tmp/errorchecking
                 else
                  mv "hurstythemes.sh.bkp" "hurstythemes.sh"
                fi
                chmod 777 "hurstythemes.sh" 
                exit
                ;;
            E)  #enable ES bootup theme randomizer
                enable_script
                ;;
            D)  #disable ES bootup theme randomizer
                disable_script
                ;;
            *)  #install or update themes
                theme=(${themes[choice-1]})
                repo="${theme[0]}"
                theme="${theme[1]}"
#                if [[ "${status[choice]}" == "i" ]]; then
                if [[ -d "/etc/emulationstation/themes/$theme" ]]; then
                    options=(1 "Update $theme" 2 "Uninstall $theme")
                    cmd=(dialog --backtitle "$__backtitle" --menu "Choose an option for theme" 12 40 06)
                    local choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                    case "$choice" in
                        1)
                            install_theme_hurstythemes "$theme" "$repo"
                            ;;
                        2)
                            uninstall_theme_hurstythemes "$theme"
                            ;;
                    esac
                else
                    install_theme_hurstythemes "$theme" "$repo"
                fi
                ;;
        esac
    done
}

gui_hurstythemes
