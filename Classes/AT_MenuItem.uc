class AT_MenuItem extends UMenuModMenuItem;

function Setup()
{ 
     MenuCaption = "Admin Tool";
     MenuHelp = "Admin Tool";
     SaveConfig();
     StaticSaveConfig();
} 

function Execute()
{ 
     MenuItem.Owner.Root.CreateWindow(class'AT_Window',50,50,50,50);
}