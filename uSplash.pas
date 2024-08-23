unit uSplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ExtCtrls;

type
  TfSplash = class(TForm)
    LogoSistema: TImageViewer;
    Progresso: TProgressBar;
    txt_Contagem: TLabel;
    LogoEmpressa: TImageViewer;
    Label2: TLabel;
    Tempo: TTimer;
    procedure TempoTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSplash: TfSplash;

implementation

{$R *.fmx}

uses uLogin;

procedure TfSplash.FormActivate(Sender: TObject);
begin
          Tempo.Enabled := true;
end;

procedure TfSplash.TempoTimer(Sender: TObject);
begin
          Begin
         // Verifica se chegou a 100
         If Progresso.Value = 100
            then Begin
                   // Fecha o relogio
                   Tempo.Enabled := False;

                   // Esconde a telas splash
                   fSplash.Hide;

                 { Carrega a tela principal (se não tiver tela de login)
                   FPrincipal.ShowModal;
                 }


                   // Carrega a tela de login (Se tiver controle de login)
                   fLogin.ShowModal;

                   // Libera a tela Splah
                   FSplash.ReleaseForm;

                   // Fecha a tela splash
                   FSplash.Close;
                 End;

         // Vai contando
         Progresso.Value := Progresso.Value + 1;


         // Quantide já percorrida
         txt_Contagem.Text := 'Aguarde. Carregando ... '
                        + Progresso.Value.ToString
                        + '%';

end;
end;

end.
