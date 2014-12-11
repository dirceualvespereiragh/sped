unit ui100;

interface

// O Modelo não precisa conhecer ninguem
// Ai esta o interessante do MVC.
// Desta forma o modelo fica desacoplado e podendo ser utilizado por vários controles

uses
   Contnrs,            //  <--  Nesta Unit está implementado TObjectList

   MVCInterfaces,uRegistroEmpresaContabil,uCST, uI010;

type
   TI100 = class(TRegistroEmpresaContabil)
      private
         fID              : Integer;   // Toda chave primaria nossa no banco dentro do objeto vai chamar ID
         FOnModeloMudou: TModeloMudou;
         fTotalFaturamento: Real;
         fValorPIS: Real;
         fBaseCalculoCOFINS: Real;
         fBaseCalculoPIS: Real;
         fValorCOFINS: Real;
         fAliquotaCOFINS: Real;
         fAliquotaPIS: Real;
         fCST: TCST;
         fI010: TI010;
         procedure SetOnModeloMudou(const Value: TModeloMudou);
         procedure SetAliquotaCOFINS(const Value: Real);
         procedure SetAliquotaPIS(const Value: Real);
         procedure SetBaseCalculoCOFINS(const Value: Real);
         procedure SetBaseCalculoPIS(const Value: Real);
         procedure SetCST(const Value: TCST);
         procedure SetID(const Value: Integer);
         procedure SetTotalFaturamento(const Value: Real);
         procedure SetValorCOFINS(const Value: Real);
         procedure SetValorPIS(const Value: Real);
         procedure SetI010(const Value: TI010);
      public
         property ID                : Integer     read fID                    write SetID;
         property I010              : TI010       read fI010                  write SetI010;
         property CST               : TCST        read fCST                   write SetCST;
         property TotalFaturamento  : Real        read fTotalFaturamento      write SetTotalFaturamento;
         property AliquotaPIS       : Real        read fAliquotaPIS           write SetAliquotaPIS;
         property BaseCalculoPIS    : Real        read fBaseCalculoPIS        write SetBaseCalculoPIS;
         property ValorPIS          : Real        read fValorPIS              write SetValorPIS;
         property AliquotaCOFINS    : Real        read fAliquotaCOFINS        write SetAliquotaCOFINS;
         property BaseCalculoCOFINS : Real        read fBaseCalculoCOFINS     write SetBaseCalculoCOFINS;
         property ValorCOFINS       : Real        read fValorCOFINS           write SetValorCOFINS;
         //property OnModeloMudou: TModeloMudou read GetOnModeloMudou write SetOnModeloMudou; // Precisa ver se assim funciona em versões mais novas de Delphi
         property OnModeloMudou: TModeloMudou read FOnModeloMudou write SetOnModeloMudou;      // Assim funcionou em Delphi 7
         function GetTodosdoI010 : TObjectList;
         function inserir : boolean;
         constructor create();
   end;

implementation

uses
   UI100BD, UEmpresa;



constructor TI100.create;
begin
   Empresa            := TEmpresa.create;
   fCST               := TCST.create;
   fI010              := TI010.create;
end;


procedure TI100.SetAliquotaCOFINS(const Value: Real);
begin
  fAliquotaCOFINS := Value;
end;

procedure TI100.SetAliquotaPIS(const Value: Real);
begin
  fAliquotaPIS := Value;
end;

procedure TI100.SetBaseCalculoCOFINS(const Value: Real);
begin
  fBaseCalculoCOFINS := Value;
end;

procedure TI100.SetBaseCalculoPIS(const Value: Real);
begin
  fBaseCalculoPIS := Value;
end;

procedure TI100.SetCST(const Value: TCST);
begin
  fCST := Value;
end;

procedure TI100.SetI010(const Value: TI010);
begin
  fI010 := Value;
end;

procedure TI100.SetID(const Value: Integer);
begin
  fID := Value;
end;

procedure TI100.SetOnModeloMudou(const Value: TModeloMudou);
begin

end;

procedure TI100.SetTotalFaturamento(const Value: Real);
begin
  fTotalFaturamento := Value;
end;

procedure TI100.SetValorCOFINS(const Value: Real);
begin
  fValorCOFINS := Value;
end;

procedure TI100.SetValorPIS(const Value: Real);
begin
  fValorPIS := Value;
end;

function TI100.GetTodosdoI010: TObjectList;
var
   lI100BD : TI100BD;
begin
   lI100BD := TI100BD.Create;
   result := lI100BD.GetTodosdoI010(self);
end;

function TI100.inserir: boolean;
var
   lI100BD : TI100BD;
begin
   lI100BD := TI100BD.Create;
   result := lI100BD.Inserir(self);
   lI100BD.Free;
   lI100BD := nil;
end;

end.
