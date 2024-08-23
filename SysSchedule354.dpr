program SysSchedule354;

uses
  System.StartUpCopy,
  FMX.Forms,
  uSplash in 'uSplash.pas' {fSplash},
  uModulo in 'uModulo.pas' {Modulo: TDataModule},
  uLogin in 'uLogin.pas' {fLogin},
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  uCadastroUser in 'uCadastroUser.pas' {fCadastroUser};


{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TModulo, Modulo);
  Application.CreateForm(TfSplash, fSplash);
  Application.CreateForm(TfLogin, fLogin);

  //Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
