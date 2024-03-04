//=============================================================================
// AT_ServerOptionsWindow.
//=============================================================================
class AT_ServerOptionsWindow extends UWindowPageWindow config(AT);

var UWindowEditControl	AdminPassEdit;
var UWindowSmallButton  AdminPassButton;
var UWindowSmallButton  GetAdminPassButton;

var UWindowEditControl	TickrateEdit;
var UWindowSmallButton  SetTickrateButton;
var UWindowSmallButton  GetTickrateButton;

var UWindowEditControl	ServerNameEdit;
var UWindowSmallButton  SetServerNameButton;
var UWindowSmallButton  GetServerNameButton;

var UWindowEditControl	AdminNameEdit;
var UWindowSmallButton  SetAdminNameButton;
var UWindowSmallButton  GetAdminNameButton;

var UWindowEditControl	AdminEmailEdit;
var UWindowSmallButton  SetAdminEmailButton;
var UWindowSmallButton  GetAdminEmailButton;

var UWindowEditControl	MOTD1Edit;
var UWindowSmallButton  SetMOTD1Button;
var UWindowSmallButton  GetMOTD1Button;

var UWindowEditControl	MOTD2Edit;
var UWindowSmallButton  SetMOTD2Button;
var UWindowSmallButton  GetMOTD2Button;

var UWindowEditControl	MOTD3Edit;
var UWindowSmallButton  SetMOTD3Button;
var UWindowSmallButton  GetMOTD3Button;

var UWindowEditControl	MOTD4Edit;
var UWindowSmallButton  SetMOTD4Button;
var UWindowSmallButton  GetMOTD4Button;

var UWindowSmallButton  RestartServerButton;
var UWindowLabelControl  RestartServerLabel;


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
	AdminPassEdit = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,10,220.0,Height));
	AdminPassEdit.SetText("Admin Password:");
	AdminPassEdit.SetHelpText("Enter the admin password you wish to set on the server.");
	AdminPassEdit.SetValue("");
	AdminPassEdit.SetFont(F_Normal);
	AdminPassEdit.SetNumericOnly(False);
	AdminPassEdit.SetMaxLength(20);
	AdminPassEdit.SetDelayedNotify(True);

      Top += Height;
	AdminPassButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234.0,10.0,40.0,35.0));
	AdminPassButton.SetText("Set");	

      Top += Height;
	GetAdminPassButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 277.0,10.0,40.0,35.0));
	GetAdminPassButton.SetText("Get");	

		Top += Height;
	TickrateEdit = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,30,220.0,Height));
	TickrateEdit.SetText("Server Tickrate:");
	TickrateEdit.SetHelpText("Enter the tickrate you wish to set on the server.");
	TickrateEdit.SetValue("");
	TickrateEdit.SetFont(F_Normal);
	TickrateEdit.SetNumericOnly(True);
	TickrateEdit.SetMaxLength(3);
	TickrateEdit.SetDelayedNotify(True);
	
		Top += Height;
	SetTickrateButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234.0,30.0,40.0,35.0));
	SetTickrateButton.SetText("Set");

		Top += Height;
	GetTickrateButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 277.0,30.0,40.0,35.0));
	GetTickrateButton.SetText("Get");

      Top += Height;
	ServerNameEdit = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,50,220.0,Height));
	ServerNameEdit.SetText("Server Name:");
	ServerNameEdit.SetHelpText("Enter the new server name.");
	ServerNameEdit.SetValue("");
	ServerNameEdit.SetFont(F_Normal);
	ServerNameEdit.SetNumericOnly(False);
	ServerNameEdit.SetDelayedNotify(True);

      Top += Height;
	SetServerNameButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234.0,50.0,40.0,35.0));
	SetServerNameButton.SetText("Set");		

      Top += Height;
	GetServerNameButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 277.0,50.0,40.0,35.0));
	GetServerNameButton.SetText("Get");

      Top += Height;
	AdminNameEdit = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,70,220.0,Height));
	AdminNameEdit.SetText("Admin Name:");
	AdminNameEdit.SetHelpText("Enter the new admin name.");
	AdminNameEdit.SetValue("");
	AdminNameEdit.SetFont(F_Normal);
	AdminNameEdit.SetNumericOnly(False);
	AdminNameEdit.SetDelayedNotify(True);

      Top += Height;
	SetAdminNameButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234.0,70.0,40.0,35.0));
	SetAdminNameButton.SetText("Set");		

      Top += Height;
	GetAdminNameButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 277.0,70.0,40.0,35.0));
	GetAdminNameButton.SetText("Get");	

      Top += Height;
	AdminEmailEdit = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,90,220.0,Height));
	AdminEmailEdit.SetText("Admin E-mail:");
	AdminEmailEdit.SetHelpText("Enter the new admin E-mail.");
	AdminEmailEdit.SetValue("@");
	AdminEmailEdit.SetFont(F_Normal);
	AdminEmailEdit.SetNumericOnly(False);
	AdminEmailEdit.SetDelayedNotify(True);

      Top += Height;
	SetAdminEmailButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234.0,90.0,40.0,35.0));
	SetAdminEmailButton.SetText("Set");		

      Top += Height;
	GetAdminEmailButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 277.0,90.0,40.0,35.0));
	GetAdminEmailButton.SetText("Get");

      Top += Height;
	MOTD1Edit = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,110,220.0,Height));
	MOTD1Edit.SetText("MOTD Line1:");
	MOTD1Edit.SetHelpText("1st MOTD line.");
	MOTD1Edit.SetValue("");
	MOTD1Edit.SetFont(F_Normal);
	MOTD1Edit.SetNumericOnly(False);
	MOTD1Edit.SetDelayedNotify(True);

      Top += Height;
	SetMOTD1Button = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234.0,110.0,40.0,35.0));
	SetMOTD1Button.SetText("Set");		

      Top += Height;
	GetMOTD1Button = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 277.0,110.0,40.0,35.0));
	GetMOTD1Button.SetText("Get");

      Top += Height;
	MOTD2Edit = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,130,220.0,Height));
	MOTD2Edit.SetText("MOTD Line2:");
	MOTD2Edit.SetHelpText("2nd MOTD line.");
	MOTD2Edit.SetValue("");
	MOTD2Edit.SetFont(F_Normal);
	MOTD2Edit.SetNumericOnly(False);
	MOTD2Edit.SetDelayedNotify(True);

      Top += Height;
	SetMOTD2Button = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234.0,130.0,40.0,35.0));
	SetMOTD2Button.SetText("Set");		

      Top += Height;
	GetMOTD2Button = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 277.0,130.0,40.0,35.0));
	GetMOTD2Button.SetText("Get");

      Top += Height;
	MOTD3Edit = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,150,220.0,Height));
	MOTD3Edit.SetText("MOTD Line3:");
	MOTD3Edit.SetHelpText("3rd MOTD line.");
	MOTD3Edit.SetValue("");
	MOTD3Edit.SetFont(F_Normal);
	MOTD3Edit.SetNumericOnly(False);
	MOTD3Edit.SetDelayedNotify(True);

      Top += Height;
	SetMOTD3Button = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234.0,150.0,40.0,35.0));
	SetMOTD3Button.SetText("Set");		

      Top += Height;
	GetMOTD3Button = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 277.0,150.0,40.0,35.0));
	GetMOTD3Button.SetText("Get");

      Top += Height;
	MOTD4Edit = UWindowEditControl(CreateControl(Class'UWindowEditControl',Left,170,220.0,Height));
	MOTD4Edit.SetText("MOTD Line4:");
	MOTD4Edit.SetHelpText("4th MOTD line.");
	MOTD4Edit.SetValue("");
	MOTD4Edit.SetFont(F_Normal);
	MOTD4Edit.SetNumericOnly(False);
	MOTD4Edit.SetDelayedNotify(True);

      Top += Height;
	SetMOTD4Button = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234.0,170.0,40.0,35.0));
	SetMOTD4Button.SetText("Set");		

      Top += Height;
	GetMOTD4Button = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 277.0,170.0,40.0,35.0));
	GetMOTD4Button.SetText("Get");

		Top += Height;
	RestartServerLabel = UWindowLabelControl(CreateControl(Class'UWindowLabelControl',Left,192.0,100.0,Height));
  	RestartServerLabel.SetText( "Restart Server:" );
  	RestartServerLabel.SetFont(F_Normal);

    Top += Height;
	RestartServerButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 120.0,190.0,197.0,Height));
	RestartServerButton.SetText("Restart"); 

      Top += Height;
	AboutButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 4.0,358.0,50.0,35.0));
	AboutButton.SetText("About");
}

function Notify(UWindowDialogControl C, byte E)
{
	local string s;

	switch(E) {
		case DE_Click:
			switch(C) {
				case AdminPassButton:
					if (!AdminCheck(True)) return;
					s = AdminPassEdit.GetValue();
                              if( s == "" ) Deny();
					else { 
                              GetPlayerOwner().ConsoleCommand("admin set Engine.GameInfo AdminPassword"@s);
                              AdminPassChanged();
                              }
					return;
				case GetAdminPassButton:
					if (!AdminCheck(True)) return;
                              GetPlayerOwner().ClientMessage("Current Admin Password:");
					GetPlayerOwner().ConsoleCommand("admin get  Engine.Gameinfo AdminPassword");
					return;
				case SetTickrateButton:
						if (!AdminCheck(True)) return;
						s = TickrateEdit.GetValue();
						GetPlayerOwner().ConsoleCommand("admin set IpDrv.TcpNetDriver NetServerMaxTickRate"@s);
								GetPlayerOwner().ConsoleCommand("say Server Tickrate set to: "@s);
						return;
				case GetTickrateButton:
						if (!AdminCheck(True)) return;
								GetPlayerOwner().ClientMessage("Tickrate:");
						GetPlayerOwner().ConsoleCommand("admin get IpDrv.TcpNetDriver NetServerMaxTickRate");
						return;
				case SetServerNameButton:
					if (!AdminCheck(True)) return;
					s = ServerNameEdit.GetValue();
					GetPlayerOwner().ConsoleCommand("admin set  Engine.GameReplicationInfo ServerName"@s);
					return;
				case GetServerNameButton:
					if (!AdminCheck(True)) return;
                              GetPlayerOwner().ClientMessage("Server Name:");
					GetPlayerOwner().ConsoleCommand("admin get  Engine.GameReplicationInfo ServerName");
					return;
				case SetAdminNameButton:
					if (!AdminCheck(True)) return;
					s = AdminNameEdit.GetValue();
					GetPlayerOwner().ConsoleCommand("admin set  Engine.GameReplicationInfo AdminName"@s);
					return;
				case GetAdminNameButton:
					if (!AdminCheck(True)) return;
                              GetPlayerOwner().ClientMessage("Admin Name:");
					GetPlayerOwner().ConsoleCommand("admin get  Engine.GameReplicationInfo AdminName");
					return;
				case SetAdminEmailButton:
					if (!AdminCheck(True)) return;
					s = AdminEmailEdit.GetValue();
					GetPlayerOwner().ConsoleCommand("admin set  Engine.GameReplicationInfo AdminEmail"@s);
					return;
				case GetAdminEmailButton:
					if (!AdminCheck(True)) return;
                              GetPlayerOwner().ClientMessage("Admin E-mail:");
					GetPlayerOwner().ConsoleCommand("admin get  Engine.GameReplicationInfo AdminEmail");
					return;
				case SetMOTD1Button:
					if (!AdminCheck(True)) return;
					s = MOTD1Edit.GetValue();
					GetPlayerOwner().ConsoleCommand("admin set  Engine.GameReplicationInfo MOTDLine1"@s);
					return;
				case GetMOTD1Button:
					if (!AdminCheck(True)) return;
                              GetPlayerOwner().ClientMessage("MOTD 1:");
					GetPlayerOwner().ConsoleCommand("admin get  Engine.GameReplicationInfo MOTDLine1");
					return;
				case SetMOTD2Button:
					if (!AdminCheck(True)) return;
					s = MOTD2Edit.GetValue();
					GetPlayerOwner().ConsoleCommand("admin set  Engine.GameReplicationInfo MOTDLine2"@s);
					return;
				case GetMOTD2Button:
					if (!AdminCheck(True)) return;
                              GetPlayerOwner().ClientMessage("MOTD 2:");
					GetPlayerOwner().ConsoleCommand("admin get  Engine.GameReplicationInfo MOTDLine2");
					return;
				case SetMOTD3Button:
					if (!AdminCheck(True)) return;
					s = MOTD3Edit.GetValue();
					GetPlayerOwner().ConsoleCommand("admin set  Engine.GameReplicationInfo MOTDLine3"@s);
					return;
				case GetMOTD3Button:
					if (!AdminCheck(True)) return;
                              GetPlayerOwner().ClientMessage("MOTD 3:");
					GetPlayerOwner().ConsoleCommand("admin get  Engine.GameReplicationInfo MOTDLine3");
					return;
				case SetMOTD4Button:
					if (!AdminCheck(True)) return;
					s = MOTD4Edit.GetValue();
					GetPlayerOwner().ConsoleCommand("admin set  Engine.GameReplicationInfo MOTDLine4"@s);
					return;
				case GetMOTD4Button:
					if (!AdminCheck(True)) return;
                              GetPlayerOwner().ClientMessage("MOTD 4:");
					GetPlayerOwner().ConsoleCommand("admin get  Engine.GameReplicationInfo MOTDLine4");
					return;
				case RestartServerButton:
					if (!AdminCheck(True)) return;
                              GetPlayerOwner().ClientMessage("AdminTool ~ Restarting server using \"Admin quit\" command");
					GetPlayerOwner().ConsoleCommand("admin quit");
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

function Deny()
 { MessageBox("Admin Tool","You can't set AdminPass to \"nothing\"!",MB_OK,MR_NONE);
   Log("AT_MenuItem.AdminCheck(): Not allowing AdminPass to be \"nothing\"!");
 }

function AdminPassChanged()
{
   local string s;
   s = AdminPassEdit.GetValue();

   MessageBox("Admin Tool","AdminPass is now ~"@s,MB_OK,MR_NONE);
}

function WriteText(canvas C, string text, int q)
{
  local float W, H;
  TextSize(C, text, W, H);
  ClipText(C, 10, q, text, false);
}

function Tick( float DeltaTime )
{
  if (AdminCheck())
    {
			SetTickrateButton.bDisabled = False;
			GetTickrateButton.bDisabled = False;
            AdminPassButton.bDisabled = False;
			GetAdminPassButton.bDisabled = False;
            SetServerNameButton.bDisabled = False;
            GetServerNameButton.bDisabled = False;
            SetAdminNameButton.bDisabled = False;
            GetAdminNameButton.bDisabled = False;
            SetAdminEmailButton.bDisabled = False;
            GetAdminEmailButton.bDisabled = False;
            SetMOTD1Button.bDisabled = False;
            GetMOTD1Button.bDisabled = False;
            SetMOTD2Button.bDisabled = False;
            GetMOTD2Button.bDisabled = False;
            SetMOTD3Button.bDisabled = False;
            GetMOTD3Button.bDisabled = False;
            SetMOTD4Button.bDisabled = False;
            GetMOTD4Button.bDisabled = False;
			RestartServerButton.bDisabled = False;
    }	
  else
    {
			SetTickrateButton.bDisabled = True;
			GetTickrateButton.bDisabled = True;
            AdminPassButton.bDisabled = True;
			GetAdminPassButton.bDisabled = True;
            SetServerNameButton.bDisabled = True;
            GetServerNameButton.bDisabled = True;
            SetAdminNameButton.bDisabled = True;
            GetAdminNameButton.bDisabled = True;
            SetAdminEmailButton.bDisabled = True;
            GetAdminEmailButton.bDisabled = True;
            SetMOTD1Button.bDisabled = True;
            GetMOTD1Button.bDisabled = True;
            SetMOTD2Button.bDisabled = True;
            GetMOTD2Button.bDisabled = True;
            SetMOTD3Button.bDisabled = True;
            GetMOTD3Button.bDisabled = True;
            SetMOTD4Button.bDisabled = True;
            GetMOTD4Button.bDisabled = True;
			RestartServerButton.bDisabled = True;
    }	
}