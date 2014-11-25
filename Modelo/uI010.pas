unit uI010;

interface

// O Modelo não precisa conhecer ninguem
// Ai esta o interessante do MVC.
// Desta forma o modelo fica desacoplado e podendo ser utilizado por vários controles

uses
   Contnrs,            //  <--  Nesta Unit está implementado TObjectList

   MVCInterfaces,uRegistroEmpresaContabil,uIndicadorOperacoes, uEmpresa ;

type
   TI010 = class(TRegistroEmpresaContabil)
      private
         fID                    : Integer;   // Toda chave primaria nossa no banco dentro do objeto vai chamar ID
         FOnModeloMudou         : TModeloMudou;
         fIndicadorOperacoes    : TIndicadorOperacoes;
         fI100                  : TObjectList;
         fSped                  : Integer;
         procedure SetOnModeloMudou(const Value: TModeloMudou);
         procedure SetI100(const Value: TObjectList);
         procedure SetID(const Value: Integer);
         procedure SetIndicadorOperacoes(const Value: TIndicadorOperacoes);
      public
         property ID                   : Integer                read fID                    write SetID;
         property IndicadorOperacoes   : TIndicadorOperacoes    read fIndicadorOperacoes    write SetIndicadorOperacoes;
         property I100                 : TObjectList            read fI100                  write SetI100;
         property Sped                 : integer                  read fSped                  write fSped;
         //property OnModeloMudou: TModeloMudou read GetOnModeloMudou write SetOnModeloMudou; // Precisa ver se assim funciona em versões mais novas de Delphi
         property OnModeloMudou: TModeloMudou read FOnModeloMudou write SetOnModeloMudou;      // Assim funcionou em Delphi 7
         function getTodosDoSped : TObjectList;
         function inserir   ()   : Boolean;
         constructor create();
   end;

implementation


uses uI010BD;

{ TI010 }

constructor TI010.create;
begin
   Empresa := TEmpresa.create;
end;

function TI010.getTodosDoSped: TObjectList;
var
   lI010BD : TI010BD;
begin
   lI010BD := lI010BD.Create;
   result := lI010BD.getTodosDoSped(self);
   lI010BD.Free;
   lI010BD := nil;
end;

function TI010.inserir: Boolean;
var
   lI010BD : TI010BD;
begin
   lI010BD := TI010BD.Create;
   result := lI010BD.Inserir(self);
   lI010BD.Free;
   lI010BD := nil;

end;

procedure TI010.SetI100(const Value: TObjectList);
begin
  fI100 := Value;
end;

procedure TI010.SetID(const Value: Integer);
begin
  fID := Value;
end;

procedure TI010.SetIndicadorOperacoes(const Value: TIndicadorOperacoes);
begin
  fIndicadorOperacoes := Value;
end;

procedure TI010.SetOnModeloMudou(const Value: TModeloMudou);
begin

end;

end.
