//=============================================================================
// AT_MiscWindow.
//=============================================================================

class AT_MiscWindow extends UWindowPageWindow config(AdminTool);

var UWindowSmallButton  NetSpeedsButton;
var UWindowSmallButton  IPsButton;
var UWindowSmallButton  ShowDemosButton;
var UWindowSmallButton  RedeemerButton;
var UWindowSmallButton  DamageAmpButton;
var UWindowSmallButton  InvisibilityButton;
var UWindowSmallButton  KegButton;
var UWindowSmallButton  ShieldBeltButton;
var UWindowSmallButton  AboutButton;

var UWindowEditControl	Bots;
var UWindowSmallButton  AddBotsButton;
var UWindowSmallButton  RemoveBotsButton;

function Created()
{
	local int Left,Top,Width,Height;

	Super.Created();

	Left = 10;
	Top = 10;
	Width = WinWidth - Left - 10;
	Height = 20;

      Top += Height;
	NetSpeedsButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 114.0,10.0,200.0,35.0));
	NetSpeedsButton.SetText("Show"); 

      Top += Height;
	IPsButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 114.0,30.0,200.0,35.0));
	IPsButton.SetText("Show"); 

      Top += Height;
	ShowDemosButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 114.0,50.0,200.0,35.0));
	ShowDemosButton.SetText("Show"); 

      Top += Height;
	RedeemerButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 114.0,70.0,200.0,35.0));
	RedeemerButton.SetText("Remove"); 

      Top += Height;
	KegButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 114.0,90.0,200.0,35.0));
	KegButton.SetText("Remove"); 

      Top += Height;
	InvisibilityButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 114.0,110.0,200.0,35.0));
	InvisibilityButton.SetText("Remove"); 

      Top += Height;
	DamageAmpButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 114.0,130.0,200.0,35.0));
	DamageAmpButton.SetText("Remove"); 

      Top += Height;
	ShieldBeltButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 114.0,150.0,200.0,35.0));
	ShieldBeltButton.SetText("Remove"); 

	Top += Height;
	Bots = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,170.0,164.0,35.0));
	Bots.SetText("Modify Bots:");
	Bots.SetHelpText("Enter the number of bots you wish to add.");
	Bots.SetValue("");
	Bots.SetFont(F_Normal);
	Bots.SetNumericOnly(True);
	Bots.EditBoxWidth = 60;
	Bots.SetMaxLength(2);
	Bots.SetDelayedNotify(True);
	
		Top += Height;
	AddBotsButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 180.0,170.0,49.0,35.0));
	AddBotsButton.SetText("Add Bots");

		Top += Height;
	RemoveBotsButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234.0,170.0,80.0,35.0));
	RemoveBotsButton.SetText("Remove All Bots");

      Top += Height;
	AboutButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 4.0,358.0,50.0,35.0));
	AboutButton.SetText("About");
}

function WriteText(canvas C, string text, int q)
{
  local float W, H;
  TextSize(C, text, W, H);
  ClipText(C, 10, q, text, false);
}

function Paint(Canvas C, float X, float Y)
{
  Super.Paint(C,X,Y);

  //Set black:
  c.drawcolor.R=0;
  c.drawcolor.G=0;
  c.drawcolor.B=0;

  WriteText(C, "Show Netspeeds", 12);
  WriteText(C, "Show IPs", 32);
  WriteText(C, "Show Demos", 52);
  WriteText(C, "Redeemer:", 72);
  WriteText(C, "Big Keg O' Health:", 92);
  WriteText(C, "Invisibility:", 112);
  WriteText(C, "Damage Amp:", 132);
  WriteText(C, "Shield Belt:", 152);
}

function Notify(UWindowDialogControl C, byte E)
{
	local string s;
	
	switch(E) {
		case DE_Click:
			switch(C) {
				case NetSpeedsButton:
					if (!AdminCheck(True)) return;
							  GetPlayerOwner().ClientMessage("Netspeeds:");
					GetPlayerOwner().ConsoleCommand("mutate pureshownetspeeds");
					return;
				case IPsButton:
					if (!AdminCheck(True)) return;
                              GetPlayerOwner().ClientMessage("IPs:");
					GetPlayerOwner().ConsoleCommand("mutate pureshowips");
					return;
				case ShowDemosButton:
					if (!AdminCheck(True)) return;
                              GetPlayerOwner().ClientMessage("Listing which players are recording demos:");
					GetPlayerOwner().ConsoleCommand("mutate pureshowdemos");
					return;
				case RedeemerButton:
					if (!AdminCheck(True)) return;
					GetPlayerOwner().ConsoleCommand("admin killall warheadlauncher");
					return;
				case DamageAmpButton:
					if (!AdminCheck(True)) return;
					GetPlayerOwner().ConsoleCommand("admin killall udamage");
					return;
				case InvisibilityButton:
					if (!AdminCheck(True)) return;
					GetPlayerOwner().ConsoleCommand("admin killall ut_invisibility");
					return;
				case KegButton:
					if (!AdminCheck(True)) return;
					GetPlayerOwner().ConsoleCommand("admin killall killall healthpack");
					return;
				case AddBotsButton:
						if (!AdminCheck(True)) return;
						s = Bots.GetValue();
							GetPlayerOwner().ConsoleCommand("admin addbots"@s);
						GetPlayerOwner().ConsoleCommand("say "$s$" bots added to the match.");
						return;
				case RemoveBotsButton:
						if (!AdminCheck(True)) return;
							GetPlayerOwner().ConsoleCommand("admin killall bot");
						GetPlayerOwner().ConsoleCommand("say Removed all bots from the match.");
						return;
				case ShieldBeltButton:
					if (!AdminCheck(True)) return;
					GetPlayerOwner().ConsoleCommand("admin killall ut_shieldbelt");
					return;
				
				case AboutButton:
                    Root.CreateWindow(class'AT_InformationFW', 10, 10, 300, 300);
                    return;


			}
			break;
	}
	Super.Notify(C,E);
}

function Tick( float DeltaTime )
{

//enable/disable buttons that depend on Admin login
  if (AdminCheck())
    {
        NetSpeedsButton.bDisabled = False;
        IPsButton.bDisabled = False;
        ShowDemosButton.bDisabled = False;
        RedeemerButton.bDisabled = False;
        DamageAmpButton.bDisabled = False;
        InvisibilityButton.bDisabled = False;
		KegButton.bDisabled = False;
        AddBotsButton.bDisabled = False;
		RemoveBotsButton.bDisabled = False;
        ShieldBeltButton.bDisabled = False;
        
    }
  else
    {
        NetSpeedsButton.bDisabled = True;
        IPsButton.bDisabled = True;
     	ShowDemosButton.bDisabled = True;
        RedeemerButton.bDisabled = True;
        DamageAmpButton.bDisabled = True;
        InvisibilityButton.bDisabled = True;
        KegButton.bDisabled = True;
        AddBotsButton.bDisabled = True;
		RemoveBotsButton.bDisabled = True;
        ShieldBeltButton.bDisabled = True;
        
    }	
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
