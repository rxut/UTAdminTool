//=============================================================================
// AT_GameOptionsWindow.
//=============================================================================
class AT_GameOptionsWindow extends UWindowPageWindow config(AdminTool);

var UWindowSmallButton  AllowOneButton;
var UWindowLabelControl  AllowOneLabel;

var UWindowEditControl	GamepassEdit;
var UWindowSmallButton  SetGamepassButton;
var UWindowSmallButton  GetGamepassButton;

var UWindowEditControl	MaxPlayersEdit;
var UWindowSmallButton  MaxPlayersButton;
var UWindowSmallButton  GetMaxPlayersButton;

var UWindowEditControl	MaxSpectatorsEdit;
var UWindowSmallButton  MaxSpectatorsButton;
var UWindowSmallButton  GetMaxSpectatorsButton;

var UWindowEditControl  DemoNameEdit;
var UWindowSmallButton	StartDemoButton;

var UWindowSmallButton  RestartMapButton;
var UWindowLabelControl  RestartMapLabel;

var UWindowLabelControl LabelPlayer;
var AT_PlayerFrameCW PlayerFrame;
var AT_PlayerListBox PlayerList;
var UWindowLabelControl LabelSpecs;
var AT_PlayerFrameCW SpecFrame;
var AT_SpectatorListBox SpecList;

var UWindowSmallButton buttonKickPlayer;
var UWindowSmallButton buttonBanPlayer;
var UWindowSmallButton buttonKickSpec;
var UWindowSmallButton buttonBanSpec;

var UWindowSmallButton  AboutButton;

function Created()
{
	local int Left,Top,Width,Height;

	Super.Created();

	Left = 10;
	Top = 10;
	Width = WinWidth - Left - 10;
	Height = 20;

    Top += Height;
	LabelPlayer = UWindowLabelControl(CreateControl(class'UWindowLabelControl',40,140,160,20));
	LabelPlayer.SetText("Current Players:");
	PlayerFrame = AT_PlayerFrameCW(CreateWindow(class'AT_PlayerFrameCW', 10,158,149,170));
	PlayerList = AT_PlayerListBox(CreateWindow(class'AT_PlayerListBox',0, 0,100, 100));
	PlayerFrame.Frame.SetFrame(PlayerList);
	buttonKickPlayer = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 38, 332, 48, 35));
	buttonKickPlayer.SetText("Kick");
	buttonBanPlayer = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 90, 332, 48, 35));
	buttonBanPlayer.SetText("Ban");

    Top += Height;
	LabelSpecs = UWindowLabelControl(CreateControl(class'UWindowLabelControl',190,140,160,20));
	LabelSpecs.SetText("Current Spectators:");
	SpecFrame = AT_PlayerFrameCW(CreateWindow(class'AT_PlayerFrameCW', 167,158,149,170));
	SpecList = AT_SpectatorListBox(CreateWindow(class'AT_SpectatorListBox',0, 0,100, 100));
	SpecFrame.Frame.SetFrame(SpecList);
	buttonKickSpec = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 195, 332, 48,35));
	buttonKickSpec.SetText("Kick");
	buttonBanSpec = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 247, 332, 48,35));
	buttonBanSpec.SetText("Ban");

	Top += Height;
	AllowOneLabel = UWindowLabelControl(CreateControl(Class'UWindowLabelControl',Left,12.0,100.0,Height));
  	AllowOneLabel.SetText( "Skip Next ACE Check" );
  	AllowOneLabel.SetFont(F_Normal);

	Top += Height;
	AllowOneButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton',120,10.0,197.0,Height));
	AllowOneButton.SetText("NpLoader AllowOne"); 

	Top += Height;
	GamepassEdit = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,30.0,220.0,Height));
	GamepassEdit.SetText("Game Pass:");
	GamepassEdit.SetHelpText("Enter the gamepassword you wish to set on the server.");
	GamepassEdit.SetValue("");
	GamepassEdit.SetFont(F_Normal);
	GamepassEdit.SetNumericOnly(False);
	GamepassEdit.SetMaxLength(20);
	GamepassEdit.SetDelayedNotify(True);

    Top += Height;
	SetGamepassButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234.0,30.0,40.0,Height));
	SetGamepassButton.SetText("Set");	
	
    Top += Height;
	GetGamepassButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 277.0,30.0,40.0,Height));
	GetGamepassButton.SetText("Get");	

    Top += Height;
	MaxPlayersEdit = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,50.0,220.0,Height));
	MaxPlayersEdit.SetText("Max Players:");
	MaxPlayersEdit.SetHelpText("Number of maximum players you wish to set on the server.");
	MaxPlayersEdit.SetValue("");
	MaxPlayersEdit.SetFont(F_Normal);
	MaxPlayersEdit.SetNumericOnly(True);
	MaxPlayersEdit.SetMaxLength(2);
	MaxPlayersEdit.SetDelayedNotify(True);
	
    Top += Height;
	MaxPlayersButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234.0,50.0,40.0,Height));
	MaxPlayersButton.SetText("Set");

    Top += Height;
	GetMaxPlayersButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 277.0,50.0,40.0,Height));
	GetMaxPlayersButton.SetText("Get");
     
    Top += Height;
	MaxSpectatorsEdit = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,70.0,220.0,Height));
	MaxSpectatorsEdit.SetText("Max Spectators:");
	MaxSpectatorsEdit.SetHelpText("Number of maximum spectators you wish to set on the server.");
	MaxSpectatorsEdit.SetValue("");
	MaxSpectatorsEdit.SetFont(F_Normal);
	MaxSpectatorsEdit.SetNumericOnly(True);
	MaxSpectatorsEdit.SetMaxLength(2);
	MaxSpectatorsEdit.SetDelayedNotify(True);
	
    Top += Height;
	MaxSpectatorsButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234.0,70.0,40.0,Height));
	MaxSpectatorsButton.SetText("Set");

    Top += Height;
	GetMaxSpectatorsButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 277.0,70.0,40.0,Height));
	GetMaxSpectatorsButton.SetText("Get");
	
	Top += Height;
	DemoNameEdit = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,90,220.0,Height));
	DemoNameEdit.SetText("Server Demo Name:");
	DemoNameEdit.SetHelpText("Enter the demo filename for recording.");
	DemoNameEdit.SetValue(RequestDemoName(""));
	DemoNameEdit.SetFont(F_Normal);
	DemoNameEdit.SetNumericOnly(False);
	DemoNameEdit.SetMaxLength(80);
	DemoNameEdit.SetDelayedNotify(True);

	Top += Height;
	StartDemoButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234, 90, 83, Height));

	Top += Height;
	RestartMapLabel = UWindowLabelControl(CreateControl(Class'UWindowLabelControl',Left,112.0,100.0,Height));
  	RestartMapLabel.SetText( "Restart Map:" );
  	RestartMapLabel.SetFont(F_Normal);

    Top += Height;
	RestartMapButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 120.0,110.0,197.0,Height));
	RestartMapButton.SetText("Restart"); 

    Top += Height;
	AboutButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 4.0,358.0,50.0,35.0));
	AboutButton.SetText("About");
}

function Notify(UWindowDialogControl C, byte E)
{
	local string s;
	local AT_List I;

	switch(E) {
		case DE_Click:
			switch(C) {
		            case buttonKickPlayer:
	                        if (!AdminCheck(True)) return;
		                  for (I = AT_List(PlayerList.Items.Next); I != None; I = AT_List(I.Next))
		                  {
		                  if (I.bSelected) {	
			            GetPlayerOwner().ConsoleCommand("Kick " $I.Name);
			            PlayerList.bChanged = true; }	
		                  }
		                  return;
		            case buttonBanPlayer:
	                        if (!AdminCheck(True)) return;
		                  for (I = AT_List(PlayerList.Items.Next); I != None; I = AT_List(I.Next))
		                  {
		                  if (I.bSelected) {	
			            GetPlayerOwner().ConsoleCommand("KickBan " $I.Name);
			            PlayerList.bChanged = true; }	
		                  }
		                  return;
		            case buttonKickSpec:
	                        if (!AdminCheck(True)) return;
		                  for (I = AT_List(SpecList.Items.Next); I != None; I = AT_List(I.Next))
		                  {
		                  if (I.bSelected) {
		 	            GetPlayerOwner().ConsoleCommand("Kick " $I.Name);
			            SpecList.bChanged = true; }	
		                  } 
		                  return;
		            case buttonBanSpec:
	                        if (!AdminCheck(True)) return;
		                  for (I = AT_List(SpecList.Items.Next); I != None; I = AT_List(I.Next))
		                  {
		                  if (I.bSelected){
		 	            GetPlayerOwner().ConsoleCommand("KickBan " $I.Name);
			            SpecList.bChanged = true; }	
                              } 
		                  return;
					case AllowOneButton:
						if (!AdminCheck(True)) return;
								GetPlayerOwner().ClientMessage("Bypassing ACE Check for the next player that connects");
						GetPlayerOwner().ConsoleCommand("mutate nploader allowone");
						return;
					
					case SetGamepassButton:
						if (!AdminCheck(True)) return;
						s = GamepassEdit.GetValue();
						GetPlayerOwner().ConsoleCommand("admin set Engine.GameInfo Gamepassword"@s);
						return;
					case GetGamepassButton:
						if (!AdminCheck(True)) return;
								GetPlayerOwner().ClientMessage("Game Password:");
						GetPlayerOwner().ConsoleCommand("admin get Engine.GameInfo Gamepassword");
						return;
					case MaxPlayersButton:
						if (!AdminCheck(True)) return;
						s = MaxPlayersEdit.GetValue();
						GetPlayerOwner().ConsoleCommand("admin set Engine.GameInfo Maxplayers"@s);
								GetPlayerOwner().ConsoleCommand("say MaxPlayers set to: "@s);
						return;
					case GetMaxPlayersButton:
						if (!AdminCheck(True)) return;
								GetPlayerOwner().ClientMessage("Max Players:");
						GetPlayerOwner().ConsoleCommand("admin get Engine.GameInfo Maxplayers");
						return;
					case MaxSpectatorsButton:
						if (!AdminCheck(True)) return;
						s = MaxSpectatorsEdit.GetValue();
						GetPlayerOwner().ConsoleCommand("admin set engine.gameinfo MaxSpectators"@s);
								GetPlayerOwner().ConsoleCommand("say MaxSpectators set to: "@s);
						return;
					case GetMaxSpectatorsButton:
						if (!AdminCheck(True)) return;
								GetPlayerOwner().ClientMessage("Max Spectators:");
						GetPlayerOwner().ConsoleCommand("admin get engine.gameinfo MaxSpectators");
						return;
					case RestartMapButton:
						if (!AdminCheck(True)) return;
							GetPlayerOwner().ConsoleCommand("admin servertravel ?restart");
						return;
					case StartDemoButton:
						if (!GetPlayerOwner().bHunting) {
							s = RequestDemoName(DemoNameEdit.GetValue());
							Log("AT_MenuItem.Notify(): demorec"@s);
							GetPlayerOwner().ConsoleCommand("admin demorec"@s);
							GetPlayerOwner().ClientMessage("Server-Side Demo Recording Started, demo name: "@s);
						} else {
							DemoNameEdit.SetValue(RequestDemoName(""));
							Log("AT_MenuItem.Notify(): stopdemo");
							GetPlayerOwner().ConsoleCommand("admin stopdemo");
							GetPlayerOwner().ClientMessage("Server-Side Demo Recording Stopped");
						}
						return;
					case AboutButton:
						Root.CreateWindow(class'AT_InformationFW', 10, 10, 300, 300);
						return;
			}
			break;
	}
	Super.Notify(C,E);
}

function bool AdminCheck(optional bool Warn)
{

	if (GetPlayerOwner() != None && (GetPlayerOwner().bAdmin || GetPlayerOwner().PlayerReplicationInfo.bAdmin)) {
		return True;
	} else {
		if (Warn) {
			MessageBox("Admin Tool","Local player is unavailable or not logged in as admin!",MB_OK,MR_NONE);
			Log("AT_MenuItem.AdminCheck(): Failed to find local player, or local player is not admin!");
		 }
		return False;
	}
}

function string RequestDemoName(string DemoName)
{
	local LevelInfo Level;
	local string URL;
	local string LevelName;

	Level = getLevel();
	URL = Level.GetAddressURL();
	URL = Left(URL,InStr(URL,":")); // Cut off :port
	if (URL == "") {
		URL = "LocalGame";
	}

	URL = Replace(URL,".","_");

	LevelName = string(Level);
	LevelName = Replace(Left(LevelName,InStr(LevelName, "."))," ","_");

	if (DemoName == "") {
		if (Level == None) {
			DemoName = "";
		} else {
			DemoName = URL$"-"$LevelName$"-"$GetShortAbsoluteTime(Level);
		}
	}
	return DemoName;
}

function string GetShortAbsoluteTime(LevelInfo Level)
{
	local string AbsoluteTime;

	AbsoluteTime = string(Level.Year);

	if (Level.Month < 10)
		AbsoluteTime = AbsoluteTime$"_0"$Level.Month;
	else
		AbsoluteTime = AbsoluteTime$"_"$Level.Month;

	if (Level.Day < 10)
		AbsoluteTime = AbsoluteTime$"_0"$Level.Day;
	else
		AbsoluteTime = AbsoluteTime$"_"$Level.Day;

	if (Level.Hour < 10)
		AbsoluteTime = AbsoluteTime$"-0"$Level.Hour;
	else
		AbsoluteTime = AbsoluteTime$"-"$Level.Hour;

	if (Level.Minute < 10)
		AbsoluteTime = AbsoluteTime$"_0"$Level.Minute;
	else
		AbsoluteTime = AbsoluteTime$"_"$Level.Minute;

	return AbsoluteTime;
}

function Tick( float DeltaTime )
{
  if (AdminCheck())
    {
		buttonKickPlayer.bDisabled = False;
        buttonBanPlayer.bDisabled = False;
		buttonKickSpec.bDisabled = False;
        buttonBanSpec.bDisabled = False;
            
        SetGamepassButton.bDisabled = False;
		GetGamepassButton.bDisabled = False;
		MaxPlayersButton.bDisabled = False;
        GetMaxPlayersButton.bDisabled = False;
		MaxSpectatorsButton.bDisabled = False;
        GetMaxSpectatorsButton.bDisabled = False;
		AllowOneButton.bDisabled = False;
		RestartMapButton.bDisabled = False;
    } 
else {
		buttonKickPlayer.bDisabled = True;
        buttonBanPlayer.bDisabled = True;
		buttonKickSpec.bDisabled = True;
        buttonBanSpec.bDisabled = True;
        
        SetGamepassButton.bDisabled = True;
		GetGamepassButton.bDisabled = True;
		MaxPlayersButton.bDisabled = True;
        GetMaxPlayersButton.bDisabled = True;
		MaxSpectatorsButton.bDisabled = True;
        GetMaxSpectatorsButton.bDisabled = True;
		AllowOneButton.bDisabled = True;
		RestartMapButton.bDisabled = True;
	}
   if (!GetPlayerOwner().bHunting) 
      { StartDemoButton.SetText("Start Recording"); } 
   else 
      { StartDemoButton.SetText("Stop Recording"); }
}

function string Replace(string In,string Find,string Repl)
{
	local int x;
	x = InStr(In,Find);
	While (x >= 0) {
		In = Left(In,x)$Repl$Right(In,Len(In)-x-1);
		x = InStr(In,Find);
	}
	return In;
}