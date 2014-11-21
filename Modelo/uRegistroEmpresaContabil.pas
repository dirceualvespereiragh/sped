unit uRegistroEmpresaContabil;
// Cada objeto Contábil precisa saber
// qual empresa ele pertence por isso criamos esta
// classe TRegistroEmpresaContabil herdada de TRegistro
// para ser o Pai de todos os objetos da Contabilidade

interface

uses
   classes, uRegistro, uEmpresa;

type
   TRegistroEmpresaContabil = class(TRegistro)
  private
    fEmpresa: Tempresa;
   public
      property Empresa : Tempresa read fEmpresa write fEmpresa;
   end;

Implementation

end.
