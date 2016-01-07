Unit Unit1;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst;

Type
  TForm1 = Class(TForm)
    CheckListBox1:TCheckListBox;
    Button2:TButton;
    Button1:TButton;
    Procedure Button1Click(Sender:TObject);
    Procedure Button2Click(Sender:TObject);
    Procedure FormActivate(Sender:TObject);
    procedure CheckListBox1DblClick(Sender: TObject);
  Private
    Procedure EtatConnectionUSB(Var Msg:TMessage);
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  Form1:TForm1;
  Eject:Boolean;

Implementation

Uses EjectUSB;

{$R *.dfm}

Procedure TForm1.EtatConnectionUSB(Var Msg:TMessage);
Begin
  // / Déconnexion physique / / Connexion physique /
  If (Msg.wParam = $8004) Or (Msg.wParam = $8000) Then
    If DEV_BROADCAST_HDR(Msg.LParam)^.dbch_devicetype = 2 Then
      If DEV_BROADCAST_VOLUME(Msg.LParam)^.dbcv_flags = 0 Then
        If Not Eject Then
          Begin
            CheckListBox1.Clear;
            Liste_USB(CheckListBox1.Items, True, True, True);
          End;
End;

Procedure TForm1.Button1Click(Sender:TObject);
Var
  I:Integer;
  Drive:String;
Begin
  For I := 0 To CheckListBox1.Count - 1 Do
    If CheckListBox1.Checked[I] Then
      Begin
        Eject := True;
        Drive := CheckListBox1.Items.Strings[i];
        // Eject_USB(LetVol: String;Rep,TempRep: Integer;MessageEject,MultiSupport: Boolean);
        // LetVol : Lettre du volume à Ejecter
        // Rep : Nombre de tentative d'ejection
        // TempRep : Temps en ms entre chaque tentative d'ejection
        // MessageEject : Affichage de la bulle d'ejection et des erreurs
        // MultiSupport : Pour les lecteurs MultiCartes par exemple cela supprime l'adaptateur complet
        If MessageDlg('确认弹出选中的盘符：'+Drive+' 及其所在的硬件?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
          Begin
            If Eject_USB(Drive[1], 4, 300, True, True) Then
              CheckListBox1.ItemEnabled[I] := False;
          End
        Else
          Begin
            If Eject_USB(Drive[1], 4, 300, True, False) Then
              CheckListBox1.ItemEnabled[I] := False;
          End;
      End;
  CheckListBox1.Clear;
  Liste_USB(CheckListBox1.Items, True, True, True);
  Eject := False;
End;

Procedure TForm1.Button2Click(Sender:TObject);
Begin
  CheckListBox1.Clear;
  Liste_USB(CheckListBox1.Items, True, True, True);
End;

Procedure TForm1.FormActivate(Sender:TObject);
Begin
  CheckListBox1.Clear;
  // Liste_USB(Lecteurs:TStrings;DriveRemovable,DriveFixed,DriveCDRom:Boolean);
  // Lecteurs : Récupération des volumes dans un TStrings
  // DriveRemovable : Récupération des périphériques autres que disques et média USB
  // DriveFixed : Récupération des disques USB
  // DriveCDROM : Récupération des médias USB
  Liste_USB(CheckListBox1.Items, True, True, True);
End;

procedure TForm1.CheckListBox1DblClick(Sender: TObject);
begin
    Button1Click(Sender);
end;

End.

