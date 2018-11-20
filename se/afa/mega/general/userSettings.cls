 
 /*------------------------------------------------------------------------
    File        : userSettings
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : EARA02
    Created     : Tue Nov 20 22:00:03 CET 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Json.ObjectModel.ObjectModelParser FROM PROPATH.
USING Progress.Json.ObjectModel.JsonObject FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW.


CLASS se.afa.mega.general.userSettings: 
DEFINE VARIABLE lRetOk AS LOGICAL NO-UNDO.
DEFINE VARIABLE hUserSettings AS HANDLE.
DEFINE VARIABLE JsonUser AS JsonObject NO-UNDO.
DEFINE VARIABLE myParser   AS ObjectModelParser NO-UNDO.


    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
        
    CONSTRUCTOR PUBLIC userSettings (  ):
        SUPER ().
        
        myParser = NEW ObjectModelParser().
        JsonUser = CAST(myParser:ParseFile('c:\temp\userSettings.json'), JsonObject).
        
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC CHARACTER getSetting( INPUT NAME AS CHARACTER   ):

        RETURN JsonUser:GetCharacter(name).

    END METHOD.
    
    METHOD PUBLIC VOID updateSetting( INPUT NAME AS CHARACTER, INPUT updatedValue AS CHARACTER   ):

        JsonUser:Set(name, updatedValue).
        JsonUser:WriteFile('c:\temp\userSettings.json', TRUE).

    END METHOD.    
    
    
    




END CLASS.