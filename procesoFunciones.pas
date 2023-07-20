unit procesoFunciones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, soapForm, Velthuis.BigIntegers;

type
  TForm2 = class(TForm)
    procesoCudBtn: TButton;
    Memo1: TMemo;
    procedure procesoCudBtnClick(Sender: TObject);
  private
    { Private declarations }
    function getmodule11 (cadena : string; numDig,limMult  : Integer; x10 : Boolean) : string;
    function getBase16(pString: string): string;
    function getBase10(pString: string): string;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
  //System.SysUtils, System.Math.Vectors;
uses System.Math;
procedure TForm2.procesoCudBtnClick(Sender: TObject);
var sucursal, modalidad, tipEmision, tipFactura, tipSector, nroFactura,
    pos, I : Integer;
    cudp : string;
    nit : Int64;
    cud : string;
    modulo11 : string;
    codigo : string;
begin
  nit := 2525555016;
  sucursal := 0;
  modalidad := 1;
  //online/offline/masiva
  tipEmision := 1;
  //con/sin derecho credito fiscal
  tipFactura := 1;
  //factura compra venta/recibo/notad�bito
  tipSector := 1;
  nroFactura := 4220;
  codigo := '';
  //punto de venta
  pos := 0;
  cudp := Format('%0.*D',[13,nit])+FormatDateTime('yyyyMMddHHnnssZZ', Now)+
          Format('%0.*D', [4, sucursal])+ modalidad.ToString +
          tipEmision.ToString + tipFactura.ToString + Format('%0.*D', [2, tipSector]) +
          Format('%0.*D', [10, nroFactura])+ Format('%0.*D', [4, pos]);
  modulo11 := getmodule11(cudp, 1, 9, false);
  cudp := cudp + modulo11;
  cud := getBase16(cudp);
  cud := cud;
end;

//funcion modulo11
function TForm2.getmodule11 (cadena : string; numDig,limMult  : Integer; x10 : Boolean) : string;
var
    mult, suma, I, n, dig : Integer;
begin
  if not x10 then
    numDig := 1;
  for n := 1 to numDig do
  begin
    suma := 0;
    mult := 2;
    for i := cadena.Length -1 downto 0 do
    begin
      suma := suma + (mult *  StrToInt(Copy(cadena, i, 1)));
      if ++mult > limMult then
        mult := 2;
    end;
    if x10 then
      dig := ((suma *10 ) mod 11) mod 10
    else
      dig := suma mod 11;
    if dig = 10 then
      cadena := cadena + '1';
    if dig = 11 then
      cadena := cadena + '0';
    if dig < 10 then
      cadena := cadena + dig.ToString;
  end;
  Result := cadena.Substring(cadena.Length - numDig, cadena.Length);
end;

//function base 16
function TForm2.getBase16(pString: string): string;
var
  vValor: BigInteger;
begin
  vValor := BigInteger.Parse(pString);
  Result := vValor.ToHexString;
end;

//funcion base 10
function TForm2.getBase10(pString: string): string;
var
  vValor: BigInteger;
begin
  vValor := BigInteger.Parse('$' + pString);
  Result := vValor.ToString();
end;
end.
