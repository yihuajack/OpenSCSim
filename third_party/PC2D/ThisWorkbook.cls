VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ThisWorkbook"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Private Sub Workbook_Open()
        On Error Resume Next
        Application.Calculation = xlAutomatic 'Restore recalc
        Application.Worksheets("Excitation").Activate
        Range("A1").Select
End Sub