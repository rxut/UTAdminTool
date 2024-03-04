// ============================================================
// AT.AT_InformationCW.
// ============================================================
class AT_InformationCW extends UWindowPageWindow;

function Created(){
  local UWindowLabelControl Author;
  local UWindowLabelControl Version;
  local UWindowLabelControl Date;
  local UWindowLabelControl Web;
  local UWindowLabelControl Authorx;
  local UWindowLabelControl Versionx;
  local UWindowLabelControl Datex;
  local UWindowLabelControl Webx;

  Author = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 10, 5, 100, 1));
  Author.Align = TA_Left;
  Author.Font = 1;
  Author.SetText("Author:");

  Version = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 10, 25, 100, 1));
  Version.Align = TA_Left;
  Version.Font = 1;
  Version.SetText("Version:");

  Date = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 10, 45, 100, 1));
  Date.Align = TA_Left;
  Date.Font = 1;
  Date.SetText("Date Released:");

  Web = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 10, 65, 100, 1));
  Web.Align = TA_Left;
  Web.Font = 1;
  Web.SetText("Web:");

  Authorx = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 53, 5, 200, 1));
  Authorx.Align = TA_Left;
  Authorx.Font = 0;
  Authorx.SetText("rX [original by TNSe & [os]sphx]");

  Versionx = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 55, 25, 200, 1));
  Versionx.Align = TA_Left;
  Versionx.Font = 0;
  Versionx.SetText("1.0");

  Datex = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 87, 45, 200, 1));
  Datex.Align = TA_Left;
  Datex.Font = 0;
  Datex.SetText("Mar 4, 2024");

  Webx = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 38, 65, 200, 1));
  Webx.Align = TA_Left;
  Webx.Font = 0;
  Webx.SetText("https://ut99tdm.com/discord");

}