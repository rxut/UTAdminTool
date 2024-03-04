//=============================================================================
// AT_Window.
//=============================================================================
class AT_Window extends UWindowFramedWindow;

function Created()
{
     Super.Created();
     SetSizePos();
}

function ResolutionChanged(float W, float H)
{
     Super.ResolutionChanged(W, H);
     SetSizePos();
}

function SetSizePos()
{
     SetSize(333, 440);
     WinLeft = Int((Root.WinWidth - WinWidth) / 2);
     WinTop = Int((Root.WinHeight - WinHeight) / 2);
}

function BeginPlay()
{
     Super.BeginPlay();
     WindowTitle = "UT Simple Server Admin Tool 1.0 by rX";
     ClientClass = class'AT_MainWindow';
     bSizable = False;     
}