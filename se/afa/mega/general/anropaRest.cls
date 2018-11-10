 
/*------------------------------------------------------------------------
   File        : anropaRest
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : eara02
   Created     : Sun Oct 21 21:49:59 CEST 2018
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS se.afa.mega.general.anropaRest: 
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
        
    DEFINE VARIABLE hAppSrv AS HANDLE.    
        
    CONSTRUCTOR PUBLIC anropaRest (  ):
        SUPER ().
        DEFINE VARIABLE ret       AS LOGICAL   NO-UNDO.
        DEFINE VARIABLE cnctParam AS CHARACTER NO-UNDO.

        CREATE SERVER hAppSrv.

        cnctParam = "-URL http://localhost:8080/apsv -sessionModel Session-Free".

        ret = hAppSrv:CONNECT(cnctParam).

        IF NOT ret THEN
            RETURN ERROR "Failed to connect to AppServer".
        
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC Progress.Json.ObjectModel.JsonObject doGetStuff(anropsurl AS CHARACTER):
        
        DEFINE VARIABLE result AS Progress.Json.ObjectModel.JsonObject NO-UNDO.
        DEFINE VARIABLE piStatuscode AS INTEGER NO-UNDO.
        DEFINE VARIABLE pcStatusText AS CHARACTER NO-UNDO.
        
        RUN hsPubJsonRestAnrop.p ('GET',
                anropsurl
                ,""
                ,""  
                ,?  
                ,OUTPUT piStatusCode 
                ,OUTPUT pcStatusText 
                ,OUTPUT result ).

        RETURN result.

    END METHOD.    
    
    
    METHOD PUBLIC Progress.Json.ObjectModel.JsonObject doGetStuffAsync(anropsurl AS CHARACTER):
        
        DEFINE VARIABLE result AS Progress.Json.ObjectModel.JsonObject NO-UNDO.
        DEFINE VARIABLE piStatuscode AS INTEGER NO-UNDO.
        DEFINE VARIABLE pcStatusText AS CHARACTER NO-UNDO.
        DEFINE VARIABLE hreq AS HANDLE NO-UNDO.
        
        RUN hsPubJsonRestAnrop.p  ON  hAppSrv ASYNCHRONOUS SET hreq('GET',
                anropsurl
                ,""
                ,""  
                ,?  
                ,OUTPUT piStatusCode 
                ,OUTPUT pcStatusText 
                ,OUTPUT result ).
        WAIT-FOR PROCEDURE-COMPLETE OF hreq.

        RETURN result.

    END METHOD.
    
   

END CLASS.