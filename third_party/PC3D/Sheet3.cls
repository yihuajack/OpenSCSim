VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Sheet3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Option Explicit

Private Sub Worksheet_Change(ByVal Target As Range)
    Dim KeyCells As Range

    'Don't execute this routine when loading a new file!
    If Not bEnableChangeHandlers Then Exit Sub
    
    ' The variable KeyCells contains the cells that will
    ' cause an alert when they are changed.
    Set KeyCells = Range(lifetimeValueCells & ", " & lifetimeUnitCells)
    
    If Not Application.Intersect(KeyCells, Range(Target.Address)) Is Nothing Then
        bEnableChangeHandlers = False
        Application.Calculation = xlCalculationManual 'Necessary for Mac compatibility
        Call OnDeviceChange
        Application.Calculation = xlCalculationAutomatic
        bEnableChangeHandlers = True
    End If
    
    Set KeyCells = Range(bulkRecombinationValueCells & ", " & bulkRecombinationDropdownCells)
    
    If Not Application.Intersect(KeyCells, Range(Target.Address)) Is Nothing Then bNeedReset = True

    Set KeyCells = Range(surfaceRecombinationCells)
    
    If Not Application.Intersect(KeyCells, Range(Target.Address)) Is Nothing Then bNeedReset = True

End Sub


