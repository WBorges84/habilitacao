object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 177
  Width = 252
  object conn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\willi\OneDrive\Documentos\Embarcadero\Studio\P' +
        'rojects\Habilitacao\View\Win32\Debug\DB\db_hab.db'
      'OpenMode=ReadWrite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 32
    Top = 8
  end
end
