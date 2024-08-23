unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.DB,
  DBAccess, Uni, MemDS, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit;

type
  TfLogin = class(TForm)
    uqUsuarios: TUniQuery;
    udsUsuarios: TUniDataSource;
    Label1: TLabel;
    Label2: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnEntrar: TButton;
    btnSair: TButton;
    Label3: TLabel;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

{$R *.fmx}

uses uPrincipal, uModulo;

procedure TfLogin.btnEntrarClick(Sender: TObject);
Var Consulta : String;
begin
       // Verificar a autenticação
             uqUsuarios.Active := False;   // Desligar a query           String;
             uqUsuarios.SQL.Clear;         // Limpar o SQL
             { Ajusta valores dos componentes para variaveis
               txtUsuario   := edtUsuario.Text;
               txtSenha     := edtSenha.Text;
               NivelUsuario := IntToStr(cbTipoUser.ItemIndex);
             }

             // Jogar o SQL (Sempre deixar um espaço antes da aspas que fecha
             Consulta := 'Select *              ' +
                         'From usuarios         ' +
                         'Where usuario       = ' + QuotedStr(edtUsuario.Text) +
                         '  and senha         = ' + QuotedStr(edtSenha.Text);

             uqUsuarios.SQL.Add(Consulta);
             uqUsuarios.Active := True;    // Executa a query

             // Verificar se existe no banco uma resposta correta
             If uqUsuarios.Fields[0].AsInteger > 0
                Then Begin
                  // Liberar a entrada no sistema
                  // Criar a tela principal aqui e tirar do Source
                  //ShowMessage ('Usuário Aceito');
                  Application.CreateForm(TfPrincipal, fPrincipal);
                  FPrincipal.Show;
                  Exit;
                End;

             ShowMessage ('Usuário inválido!');

end;

procedure TfLogin.btnSairClick(Sender: TObject);
begin
Close;
end;

end.
