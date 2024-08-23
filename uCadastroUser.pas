unit uCadastroUser;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ExtCtrls, Data.DB,
  MemDS, DBAccess, Uni, FMX.Edit, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TfCadastroUser = class(TForm)
    ImageViewer1: TImageViewer;
    Panel1: TPanel;
    ImageViewer2: TImageViewer;
    ImageViewer3: TImageViewer;
    ImageViewer4: TImageViewer;
    ImageViewer5: TImageViewer;
    ImageViewer6: TImageViewer;
    udsUser: TUniDataSource;
    uqUser: TUniQuery;
    ImageViewer7: TImageViewer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtNome: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    edtEndereco: TEdit;
    edtDesc: TEdit;
    uqUserid: TIntegerField;
    uqUsernome: TStringField;
    uqUsertelefone: TStringField;
    uqUseremail: TStringField;
    uqUserendereco: TStringField;
    uqUserdescricao: TStringField;
    uqUserdata_criacao: TDateTimeField;
    uqUserdata_aniversario: TDateField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    procedure ImageViewer7Click(Sender: TObject);
    procedure ImageViewer2Click(Sender: TObject);
    procedure ImageViewer5Click(Sender: TObject);
    procedure ImageViewer6Click(Sender: TObject);
    procedure ImageViewer4Click(Sender: TObject);
    procedure ImageViewer3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadastroUser: TfCadastroUser;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}

procedure TfCadastroUser.ImageViewer2Click(Sender: TObject);
begin
            // Verificar se a tabela est� em Inser��o ou Edi��o
          if (uqUser.State) in [dsInsert, dsEdit]
             Then Begin
                    ShowMessage ('Tabela j� est� em uso!'+
                                 CHR(13)+
                                 'Cancele, se desejar');
                    Exit;
                  End;

          uqUser.Insert;
end;

procedure TfCadastroUser.ImageViewer3Click(Sender: TObject);
begin
 ShowMessage ('Atividades canceladas!');
          uqUser.Cancel;
end;

procedure TfCadastroUser.ImageViewer4Click(Sender: TObject);
begin
       { Criticas antes de salvar
- Verificar se todas as informa��es est�o presentes
}
// Verificar se a tabela est� em Inser��o ou Edi��o
If (uqUser.State) in [dsInsert, dsEdit]
Then Begin
uqUser.Post; // metodo para gravar
ShowMessage ('Dados gravados com sucesso!');
Exit;
End;
ShowMessage ('Tabela n�o est� em Edi��o ou Inser��o!'
+ CHR(13)+
'Grava��o Cancelada!');
end;

procedure TfCadastroUser.ImageViewer5Click(Sender: TObject);
begin
// Verificar se a tabela est� em Inser��o ou Edi��o
          if (uqUser.State) in [dsInsert, dsEdit]
             Then Begin
                    ShowMessage ('Tabela j� est� em uso!' + CHR(13)+
                                 'Cancele, antes de Deletar');
                    Exit;
                  End;
          // Perguntar antes
          If MessageDlg('Deletar Registro?', TMsgDlgType.MTConfirmation,
                         [TMsgDlgBtn.MBYes, TMsgDlgBtn.MBNO],0)
                         = MRYes
             Then Begin
                    uqUser.Delete;   // Excluindo registro
                    ShowMessage ('Exclu�do com Sucesso!');
                  End
             Else ShowMessage ('N�o Exclu�do!')
end;

procedure TfCadastroUser.ImageViewer6Click(Sender: TObject);
begin
 // Verificar se a tabela est� em Inser��o ou Edi��o
          if (uqUser.State) in [dsInsert, dsEdit]
             Then Begin
                    ShowMessage ('Tabela j� est� em uso!'+
                                 CHR(13)+
                                 'Cancele, se desejar');
                    Exit;
                  End;

          uqUser.Edit;
end;

procedure TfCadastroUser.ImageViewer7Click(Sender: TObject);
begin
// Verificar se a tabela est� em Inser��o ou Edi��o
          If (uqUser.State) in [dsInsert, dsEdit]
             Then Begin
                    ShowMessage ('Tabela est� em uso!' + CHR(13)+
                                 'Cancele, antes de Sair');
                    Exit;
                  End;
          Close;
end;

end.
