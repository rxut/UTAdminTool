//=============================================================================
// AT_MainWindow.
//=============================================================================
class AT_MainWindow extends UWindowDialogClientWindow config(AdminTool);

var PlayerPawn LocalPlayer;
var UWindowComboControl AdminPasswordCombo;
var UWindowSmallButton  AdminLoginButton;
var globalconfig string LastPasswords[16];
var globalconfig string ShowMiscTab;
var UWindowPageControl Pages;

function Created()
{
     local int Left,Top,Width,Height,x;

     Super.Created();

	Left = 5;
	Top = 10;
	Width = WinWidth - Left - 10;
	Height = 20;

    Pages = UWindowPageControl(CreateWindow(class'UWindowPageControl', 0, 25, 330, 400));
    Pages.SetMultiLine(True);
    Pages.AddPage("Game", class'AT_GameOptionsWindow');
    Pages.AddPage("Server", class'AT_ServerOptionsWindow');

    if (ShowMiscTab == "True")
    { Pages.AddPage("Misc.", class'AT_MiscWindow'); }

    AdminPasswordCombo = UWindowComboControl(CreateControl(Class'UWindowComboControl',Left,5,227.0,Height));
	AdminPasswordCombo.SetHelpText("Enter the password that will give you admin on this server!");

	for (x = 0; x < 16; x++)
	{
		if (LastPasswords[x] != "")
		AdminPasswordCombo.AddItem(LastPasswords[x]);
	}

	AdminPasswordCombo.SetText("Admin Pass:");
	AdminPasswordCombo.SetValue(LastPasswords[0]);
	AdminPasswordCombo.SetFont(F_Normal);
  	AdminPasswordCombo.Align = TA_Left;
	AdminPasswordCombo.SetNumericOnly(False);
	AdminPasswordCombo.SetMaxLength(60);
	AdminPasswordCombo.SetEditable(True);
	AdminPasswordCombo.EditBoxWidth = 150;

//	AdminPasswordCombo.SetDelayedNotify(True);
	Top += Height;
	AdminLoginButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 234, 5, 83, Height));
}

function bool AdminCheck(optional bool Warn)
{
	LocalPlayer = GetPlayerOwner();

	if (LocalPlayer != None && (LocalPlayer.bAdmin || LocalPlayer.PlayerReplicationInfo.bAdmin)) {
		return True;
	} else {
		if (Warn) {
			MessageBox("Admin Tool","Local player is unavailable or not logged in as admin!",MB_OK,MR_NONE);
			Log("AT_CW.AdminCheck(): Failed to find local player, or local player is not admin!");
		}
		return False;
	}
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

function BeforePaint(Canvas C, float X, float Y)
{
	if (AdminCheck()) {
		AdminLoginButton.SetText("Log out");
	} else {
		AdminLoginButton.SetText("Log in");
	}
}

function Notify(UWindowDialogControl C, byte E)
{
	local int x,y;
	local bool b;

	switch(E) {
		case DE_Click:
			switch(C) {
				case AdminLoginButton:
					if (AdminCheck()) {
                                    GetPlayerOwner().ConsoleCommand("say -[ AT v3.6 ]-");
						LocalPlayer.ConsoleCommand("adminlogout");
					} else {
						b = False;
						for (x = 0; x < 16; x++)	// Find old password
						{
							if (AdminPasswordCombo.GetValue() == LastPasswords[x])
							{
								b = True;
								y = x;
								break;
							}
						}
						if (b)	// Old password found, erase if from list and move others accordingly
						{
							for (x = y+1; x < 16; x++)
								LastPasswords[x-1] = LastPasswords[x];
						}
						for (x = 1; x < 16; x++) // Move all password one step down
							LastPasswords[16-x] = LastPasswords[15-x];
						LastPasswords[0] = AdminPasswordCombo.GetValue();
						SaveConfig();
						AdminPasswordCombo.Clear();
						for (x = 0; x < 16; x++)
						{
							if (LastPasswords[x] != "")
								AdminPasswordCombo.AddItem(LastPasswords[x]);
						}
						AdminPasswordCombo.SetValue(LastPasswords[0]);
						LocalPlayer.ConsoleCommand("adminlogin"@LastPasswords[0]);
					}
					return;       
                     }
			break;
	}
	Super.Notify(C,E);
}

defaultproperties
{
	LastPasswords(0)=""
	LastPasswords(1)=""
	ShowMiscTab="True"
}
