unit MVCInterfaces;

interface

// Aqui declaramos a Interfaces que por definição são Classes Abstratas
//  IModel faz sentido pois obriga a criar os metodos
//  mas não entendi a necessidade de IView e IControle

type
   TModeloMudou = procedure of object;

   IModel = interface
      ['{9E0A6ECC-2A12-461F-AD82-0319DFBAB589}']  // Ctrl Shift G  gera esta chave
       procedure Initialize;
       function  GetOnModeloMudou: TModeloMudou;
//     Utilizando o metodo get no Delphi7 a variável não recebia valor
       procedure SetOnModeloMudou(value: TModeloMudou);
       property  OnModeloMudou : TModeloMudou read  GetOnModeloMudou  write SetOnModeloMudou;
   end;

   IView = interface
      ['{665DFC9C-5757-4B72-8923-E5B47B9DCDC1}']
      procedure Initialize;
   end;

   IControle = interface
      ['{4844BF80-0094-494B-BC29-289C2904E275}']
      procedure Initialize;
   end;

implementation

end.
