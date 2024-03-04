//=============================================================================
// AT_PlayerFrameCW.
//=============================================================================
class AT_PlayerFrameCW extends UMenuDialogClientWindow;

var UWindowControlFrame Frame;

function Created()
{
	Frame = UWindowControlFrame(CreateWindow(class'UWindowControlFrame', 0, 0, WinWidth, WinHeight));
	Super.Created();
}

function BeforePaint(Canvas C, float X, float Y)
{
	Super.BeforePaint(C, X, Y);

	Frame.WinLeft = 0;
	Frame.WinTop = 0;
	Frame.SetSize(WinWidth, WinHeight);
}