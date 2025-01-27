object DMLibroRecetas: TDMLibroRecetas
  OldCreateOrder = False
  Height = 402
  Width = 611
  object idhttp: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 559
    Top = 16
  end
  object QLibroRecetas: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 496
    Top = 16
  end
  object DSLibroRecetas: TDataSource
    DataSet = CDSLibroRecetas
    Left = 416
    Top = 16
  end
  object BASE: TIBDatabase
    ServerType = 'IBServer'
    Left = 352
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    Left = 288
    Top = 16
  end
  object CDSLibroRecetas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 72
  end
end
