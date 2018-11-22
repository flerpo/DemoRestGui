 
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
    DEFINE VARIABLE hUserSettings      AS HANDLE.
    DEFINE VARIABLE JsonUser           AS JsonObject        NO-UNDO.
    DEFINE VARIABLE myParser           AS ObjectModelParser NO-UNDO.
    DEFINE VARIABLE myUserSettingsFile AS CHARACTER         INIT "c:\temp\userSettings.json".

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
        
    CONSTRUCTOR PUBLIC userSettings (  ):
        DEFINE VARIABLE lOk AS LOGICAL NO-UNDO.
        SUPER ().
        myParser = NEW ObjectModelParser().
        IF SEARCH(myUserSettingsFile) <> ? THEN 
        DO:
            JsonUser = CAST(myParser:ParseFile(myUserSettingsFile), JsonObject) NO-ERROR.
            
        END.
        ELSE 
        DO:
            DEFINE VARIABLE joBlank AS JsonObject NO-UNDO.
            joBlank = NEW JsonObject().
            joBlank:Add('theme', 'Windows8').
            joBlank:WriteFile(myUserSettingsFile).
            JsonUser = CAST(myParser:ParseFile(myUserSettingsFile), JsonObject) NO-ERROR.
            
        END.
        
       
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