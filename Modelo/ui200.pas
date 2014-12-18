unit ui200;

interface

uses
   Contnrs,

   MVCInterfaces,uRegistroEmpresaContabil, uI100 , uNumeroCampo, uTipoDetalhamento, uContaContabil;

type
   TI200 = class(TRegistroEmpresaContabil)
      private
         fID                  : Integer;
         FOnModeloMudou       : TModeloMudou;
         fNumeroCampo         : TNumeroCampo;
         fTipoDetalhamento    : TTipoDetalhamento;
         fValorDetalhado      : Real;
         fContaContabil       : TContaContabil;
         fI100: TI100;
         procedure SetID(const Value: Integer);
         procedure SetOnModeloMudou(const Value: TModeloMudou);
         procedure SetNumeroCampo(const Value: TNumeroCampo);
         procedure SetTipoDetalhamento(const Value: TTipoDetalhamento);
         procedure SetValorDetalhado(const Value: Real);
         procedure SetContaContabil(const Value: TContaContabil);
    procedure SetI100(const Value: TI100);
      public
         property ID                : Integer            read fID               write SetID;
         property OnModeloMudou     : TModeloMudou       read FOnModeloMudou    write SetOnModeloMudou;      // Assim funcionou em Delphi 7
         property I100              : TI100              read fI100             write SetI100;
         property NumeroCampo       : TNumeroCampo       read fNumeroCampo      write SetNumeroCampo;
         property TipoDetalhamento  : TTipoDetalhamento  read fTipoDetalhamento write SetTipoDetalhamento;
         property ValorDetalhado    : Real               read fValorDetalhado   write SetValorDetalhado;
         property ContaContabil     : TContaContabil     read fContaContabil    write SetContaContabil;
         constructor create();
   end;

implementation

uses
   UI200BD, UEmpresa;


constructor TI200.create;
begin
   Empresa            := TEmpresa.create;
   I100               := TI100.create;
   NumeroCampo        := TNumeroCampo.create;
   TipoDetalhamento   := TTipoDetalhamento.create;
end;


procedure TI200.SetContaContabil(const Value: TContaContabil);
begin
  fContaContabil := Value;
end;

procedure TI200.SetI100(const Value: TI100);
begin
  fI100 := Value;
end;

procedure TI200.SetID(const Value: Integer);
begin
  fID := Value;
end;

procedure TI200.SetNumeroCampo(const Value: TNumeroCampo);
begin
  fNumeroCampo := Value;
end;

procedure TI200.SetOnModeloMudou(const Value: TModeloMudou);
begin
  FOnModeloMudou := Value;
end;

procedure TI200.SetTipoDetalhamento(const Value: TTipoDetalhamento);
begin
  fTipoDetalhamento := Value;
end;

procedure TI200.SetValorDetalhado(const Value: Real);
begin
  fValorDetalhado := Value;
end;

end.
