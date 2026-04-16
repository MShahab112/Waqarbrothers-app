[Setup]
AppName=Waqar Brothers Daily Account Book
AppVersion=1.6
AppPublisher=Waqar & Brothers
DefaultDirName={localappdata}\WaqarBrothers
DefaultGroupName=Waqar Brothers
OutputDir=C:\WaqarBrothers\installer_output
OutputBaseFilename=WaqarBrothersSetup
Compression=lzma
SolidCompression=yes
SetupIconFile=WB_icon_256x256.ico
UninstallDisplayName=Waqar Brothers Daily Account Book
PrivilegesRequired=lowest
DisableProgramGroupPage=yes
WizardStyle=modern

[Files]
Source: "C:\WaqarBrothers\dist\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs


[Dirs]
Name: "{app}\uploads"
Name: "{app}\backups"

[Icons]
Name: "{autodesktop}\Waqar Brothers"; Filename: "{app}\WaqarBrothers.exe"; IconFilename: "{app}\WaqarBrothers.exe"
Name: "{group}\Waqar Brothers"; Filename: "{app}\WaqarBrothers.exe"
Name: "{group}\Uninstall Waqar Brothers"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\WaqarBrothers.exe"; Description: "Launch Waqar Brothers"; Flags: nowait postinstall skipifsilent
