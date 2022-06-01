unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects,MultiCircularProgress,
  FMX.ListBox, FMX.Colors;

Type

  TForm4 = class(TForm)
    Edit1: TEdit;
    Button2: TButton;
    Label1: TLabel;
    ComboBox2: TComboBox;
    Label6: TLabel;
    ComboColorBox1: TComboColorBox;
    Label2: TLabel;
    Label3: TLabel;
    ComboColorBox2: TComboColorBox;
    Label4: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboColorBox1Change(Sender: TObject);
    procedure ComboColorBox2Change(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    ProgressTracks:TMultiCircularProgress;
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.Button2Click(Sender: TObject);
var i:integer;
    x:TStringList;
begin
ProgressTracks.NumberOfTracks:=Edit1.Text.ToInteger;
Randomize;
for i:=0 to ProgressTracks.NumberOfTracks-1 do ProgressTracks.Progresses[i]:=Random(100);
Label4.Text:='Total Progress : '+ ProgressTracks.OverallProgress.ToString+'%';
end;

procedure TForm4.ComboBox2Change(Sender: TObject);
begin
ProgressTracks.ShowPies:=True;
ProgressTracks.ShowArcs:=True;
case ComboBox2.ItemIndex of
1:ProgressTracks.ShowPies:=False;
2:ProgressTracks.ShowArcs:=False;
end;
end;

procedure TForm4.ComboColorBox1Change(Sender: TObject);
begin
ProgressTracks.ProgressBackColor:=ComboColorBox1.Color;
end;

procedure TForm4.ComboColorBox2Change(Sender: TObject);
begin
ProgressTracks.ProgressColor:=ComboColorBox2.Color;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
ProgressTracks:=TMultiCircularProgress.Create(Self);
ProgressTracks.Parent:=Self;
ProgressTracks.Position.X:=30;
ProgressTracks.Position.Y:=30;
end;

end.
