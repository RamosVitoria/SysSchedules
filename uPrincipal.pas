unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, Data.DB, MemDS, DBAccess, Uni, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.ExtCtrls,
  FMX.StdCtrls, FMX.DateTimeCtrls, FMX.Edit, FMX.Controls.Presentation,
  Data.Bind.Controls, Fmx.Bind.Navigator;

type
  TfPrincipal = class(TForm)
    lUsuarios: TListBox;
    udsUsuarios: TUniDataSource;
    uqUsuarios: TUniQuery;
    uqUsuariosid: TIntegerField;
    uqUsuariosnome: TStringField;
    uqUsuariostelefone: TStringField;
    uqUsuariosemail: TStringField;
    uqUsuariosendereco: TStringField;
    uqUsuariosdescricao: TStringField;
    uqUsuariosdata_criacao: TDateTimeField;
    uqUsuariosdata_aniversario: TDateField;
    lbID: TLabel;
    lbNome: TLabel;
    lbEmail: TLabel;
    lbInformacoes: TLabel;
    edtNome: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    edtEndereco: TEdit;
    lbDtaCad: TLabel;
    dtCriacao: TDateEdit;
    lbDtaAces: TLabel;
    dtAniver: TDateEdit;
    pCodigo: TPanel;
    lCodigo: TLabel;
    Label1: TLabel;
    edtDescricao: TEdit;
    BindNavigator1: TBindNavigator;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB1: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    Label2: TLabel;
    ImageViewer1: TImageViewer;
    SAIR: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    procedure RegFirstClick(Sender: TObject);
    procedure RegPriorClick(Sender: TObject);
    procedure RegNextClick(Sender: TObject);
    procedure RegLastClick(Sender: TObject);
    procedure RegInserirClick(Sender: TObject);
    procedure RegDeletarClick(Sender: TObject);
    procedure RegEditarClick(Sender: TObject);
    procedure RegGravarClick(Sender: TObject);
    procedure RegCancelarClick(Sender: TObject);
    procedure SAIRClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.fmx}

uses uCadastroUser;

procedure TfPrincipal.Button1Click(Sender: TObject);
begin
     Application.CreateForm(TfCadastroUser, fCadastroUser);
      fCadastroUser.ShowModal;
end;

procedure TfPrincipal.RegCancelarClick(Sender: TObject);
begin
          ShowMessage ('Atividades canceladas!');
          uqUsuarios.Cancel;
end;

procedure TfPrincipal.RegDeletarClick(Sender: TObject);
begin
 // Verificar se a tabela está em Inserção ou Edição
          if (uqUsuarios.State) in [dsInsert, dsEdit]
             Then Begin
                    ShowMessage ('Tabela já está em uso!' + CHR(13)+
                                 'Cancele, antes de Deletar');
                    Exit;
                  End;
          // Perguntar antes
          If MessageDlg('Deletar Registro?', TMsgDlgType.MTConfirmation,
                         [TMsgDlgBtn.MBYes, TMsgDlgBtn.MBNO],0)
                         = MRYes
             Then Begin
                    uqUsuarios.Delete;   // Excluindo registro
                    ShowMessage ('Excluído com Sucesso!');
                  End
             Else ShowMessage ('Não Excluído!')
end;

procedure TfPrincipal.RegEditarClick(Sender: TObject);
begin
 // Verificar se a tabela está em Inserção ou Edição
          if (uqUsuarios.State) in [dsInsert, dsEdit]
             Then Begin
                    ShowMessage ('Tabela já está em uso!'+
                                 CHR(13)+
                                 'Cancele, se desejar');
                    Exit;
                  End;

          uqUsuarios.Edit;
end;

procedure TfPrincipal.RegFirstClick(Sender: TObject);
begin
         // Verificar se a tabela está em Inserção ou Edição
          if (uqUsuarios.State) in [dsInsert, dsEdit]
             Then Begin
                    ShowMessage ('Tabela já está em uso!'+
                                 CHR(13)+
                                 'Cancele, se desejar');
                    Exit;
                  End;


          uqUsuarios.First;
end;

procedure TfPrincipal.RegGravarClick(Sender: TObject);
begin
   { Criticas antes de salvar
- Verificar se todas as informações estão presentes
}
// Verificar se a tabela está em Inserção ou Edição
If (uqUsuarios.State) in [dsInsert, dsEdit]
Then Begin
End;
uqUsuarios.Post; // metodo para gravar
ShowMessage ('Dados gravados com sucesso!');
Exit;
End;
//ShowMessage ('Tabela não está em Edição ou Inserção!'
//+ CHR(13)+
//'Gravação Cancelada!');
//end;

procedure TfPrincipal.RegInserirClick(Sender: TObject);
begin

          // Verificar se a tabela está em Inserção ou Edição
          if (uqUsuarios.State) in [dsInsert, dsEdit]
             Then Begin
                    ShowMessage ('Tabela já está em uso!'+
                                 CHR(13)+
                                 'Cancele, se desejar');
                    Exit;
                  End;

          uqUsuarios.Insert;
end;

procedure TfPrincipal.RegLastClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
          if (uqUsuarios.State) in [dsInsert, dsEdit]
             Then Begin
                    ShowMessage ('Tabela já está em uso!'+
                                 CHR(13)+
                                 'Cancele, se desejar');
                    Exit;
                  End;

          uqUsuarios.Last;
end;

procedure TfPrincipal.RegNextClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
          if (uqUsuarios.State) in [dsInsert, dsEdit]
             Then Begin
                    ShowMessage ('Tabela já está em uso!'+
                                 CHR(13)+
                                 'Cancele, se desejar');
                    Exit;
                  End;

          uqUsuarios.Next;
end;

procedure TfPrincipal.RegPriorClick(Sender: TObject);
begin
 // Verificar se a tabela está em Inserção ou Edição
          if (uqUsuarios.State) in [dsInsert, dsEdit]
             Then Begin
                    ShowMessage ('Tabela já está em uso!'+
                                 CHR(13)+
                                 'Cancele, se desejar');
                    Exit;
                  End;
          uqUsuarios.Prior;
end;

procedure TfPrincipal.SAIRClick(Sender: TObject);
begin
Close;
end;

end.
