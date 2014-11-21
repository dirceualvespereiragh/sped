unit uSped;

interface

uses
   Contnrs,            //  <--  Nesta Unit está implementado TObjectList

   MVCInterfaces,uRegistro,uEmpresa, UI010;

type
   TSped = class(TRegistro)
      private
         fID              : Integer;
         FOnModeloMudou   : TModeloMudou;
         fEmpresa         : TEmpresa;
         fI010s           : TObjectList;
         procedure SetEmpresa(const Value: TEmpresa);
         procedure SetI010s(const Value: TObjectList);
         procedure SetID(const Value: Integer);
         procedure SetOnModeloMudou(const Value: TModeloMudou);
         procedure AdicionaI010 (fI010 : TI010);
         function  GetI010s   : TObjectList;
      public
         property ID                : Integer      read fID                 write SetID;
         property Empresa           : TEmpresa     read fEmpresa            write SetEmpresa;
         property I010s             : TObjectList  read GetI010s            write SetI010s;
         property OnModeloMudou     : TModeloMudou read FOnModeloMudou      write SetOnModeloMudou;
         function TodosDaEmpresa : TObjectList;
         function inserir   ()  : Boolean;
         function Procurar  ()  : TRegistro;
         constructor create();
   end;

implementation

Uses
uSpedBD;
{ TSped }

constructor TSped.create;
begin
   Empresa := TEmpresa.create;
   I010s   := TObjectList.create;
end;

function TSped.GetI010s: TObjectList;
begin
   result := fI010s;
end;
//}  Exemplo desta função em Java
//public Set getAutores() {
//return Collections.unmodifiableSet(this.autores);
//}




procedure TSped.SetEmpresa(const Value: TEmpresa);
begin
  fEmpresa := Value;
end;

procedure TSped.SetI010s(const Value: TObjectList);
var
   I : Integer;
begin
  I := 0;
  while (I < (Value.Count) ) do begin
     AdicionaI010( TI010(value.Items[i]) );
     inc(I);
  end;
end;
// exemplo desta função em  do Java
//public void setAutores(Set autores) {
//Iterator iterator = autores.iterator();
//while (iterator.hasNext()){
//Autor autor = (Autor)iterator.next();
//this.adicionarAutor(autor);
//}


procedure TSped.AdicionaI010(fI010: TI010);
begin
   if GetI010s.indexOf(fI010s) = -1 then begin // o Objeto Especialidade ainda não existe na Lista de Objetos
      fI010s.Add(fI010);
      // fI010s.AdicionaSped(self);   -- Acredito que não é necessário fazer este chamada neste caso
   end;
end;
//}  função em Java
//public void adicionarAutor(Autor autor){
//if (!this.getAutores().contains(autor)){
//this.autores.add(autor);
//autor.adicionarLivro(this);
//}




procedure TSped.SetID(const Value: Integer);
begin
  fID := Value;
end;

procedure TSped.SetOnModeloMudou(const Value: TModeloMudou);
begin
  FOnModeloMudou := Value;
end;

function TSped.TodosDaEmpresa: TObjectList;
var
   lSpedBD : TSpedBD;
begin
   lSpedBD := TSpedBD.Create;
   result := lSpedBD.TodosDaEmpresa(self);
   lSpedBD.Free;
   lSpedBD := nil;
end;

function TSped.Procurar(): TRegistro;
var
   lSpedBD : TSpedBD;
begin
   lSpedBD := TSpedBD.Create;
   result := lSpedBD.Procurar(self);
   lSpedBD.Free;
   lSpedBD := nil;
end;

function TSped.inserir(): Boolean;
var
   lSpedBD : TSpedBD;
begin
   lSpedBD := TSpedBD.Create;
   result := lSpedBD.Inserir(self);
   lSpedBD.Free;
   lSpedBD := nil;
end;

end.
