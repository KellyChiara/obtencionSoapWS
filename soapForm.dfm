object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 298
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object verificaConexionBtn: TButton
    Left = 8
    Top = 105
    Width = 81
    Height = 32
    Caption = 'verificaCon'
    TabOrder = 0
    OnClick = verificaConexionBtnClick
  end
  object getCuisBtn: TButton
    Left = 112
    Top = 106
    Width = 81
    Height = 29
    Caption = 'cuis'
    TabOrder = 1
    OnClick = getCuisBtnClick
  end
  object Memo1: TMemo
    Left = 240
    Top = 16
    Width = 383
    Height = 257
    Lines.Strings = (
      '')
    TabOrder = 2
  end
  object Button1: TButton
    Left = 40
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
  end
  object HTTPRIO1: THTTPRIO
    OnAfterExecute = HTTPRIO1AfterExecute
    WSDLLocation = 
      'https://pilotosiatservicios.impuestos.gob.bo/v2/FacturacionCodig' +
      'os?wsdl'
    Service = 'ServicioFacturacionCodigos'
    Port = 'ServicioFacturacionCodigosPort'
    HTTPWebNode.OnBeforePost = HTTPRIO1HTTPWebNode1BeforePost
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 40
    Top = 48
  end
  object HTTPReqResp1: THTTPReqResp
    URL = 
      'https://pilotosiatservicios.impuestos.gob.bo/v2/FacturacionCodig' +
      'os?wsdl'
    Left = 104
    Top = 48
  end
end
