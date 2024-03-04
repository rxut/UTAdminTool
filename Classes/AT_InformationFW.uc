// ============================================================
// AT.InformationFW.
// ============================================================
class AT_InformationFW expands UWindowFramedWindow;

function Created() {
	Super.Created();
	SetSize(216, 103);
	WinLeft = (Root.WinWidth - WinWidth) / 2;
	WinTop = (Root.WinHeight - WinHeight) / 2;
}

defaultproperties
{
	ClientClass=Class'AT_InformationCW'
	WindowTitle="Admin Tool - General Info"
}
