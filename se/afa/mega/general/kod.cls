 
/*------------------------------------------------------------------------
   File        : kod
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : eara02
   Created     : Sat Oct 20 17:28:26 CEST 2018
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Json.ObjectModel.JsonObject FROM PROPATH.
USING Progress.Json.ObjectModel.JsonArray FROM PROPATH.
USING se.afa.mega.general.HttpGet FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS se.afa.mega.general.kod: 
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE TEMP-TABLE ttKod LIKE Kod.   
    DEFINE VARIABLE hAppSrv AS HANDLE. 
    DEFINE VARIABLE rest    AS HttpGet.

    CONSTRUCTOR PUBLIC kod (  ):
        
        DEFINE VARIABLE pistatuskod  AS INTEGER .
        DEFINE VARIABLE pcstatustext AS CHARACTER.
        DEFINE VARIABLE poResponse   AS JsonObject.
        DEFINE VARIABLE ja           AS JsonArray.
        DEFINE VARIABLE h            AS HANDLE.
        DEFINE VARIABLE ret          AS LOGICAL    NO-UNDO.
        DEFINE VARIABLE cnctParam    AS CHARACTER  NO-UNDO.
        
        rest = NEW HttpGet().
        
        /*        CREATE SERVER hAppSrv.                                                   */
        /*                                                                                 */
        /*        cnctParam = "-URL http://localhost:8080/apsv -sessionModel Session-Free".*/
        /*                                                                                 */
        /*        ret = hAppSrv:CONNECT(cnctParam).                                        */
        /*                                                                                 */
        /*        IF NOT ret THEN                                                          */
        /*          RETURN ERROR "Failed to connect to AppServer".                         */
        /*                                                                                 */
        /*        poResponse = rest:restcallala('http://localhost:8080/moop/web/kod/').*/
        RUN hsPubJsonRestAnrop.p ('GET',
            'http://localhost:8080/moop/web/kod/'
            ,""
            ,""
            ,?
            ,OUTPUT piStatusKod
            ,OUTPUT pcStatusText
            ,OUTPUT poResponse).
        /*                                                 */
        /*                                                 */
        ja = poResponse:GetJsonArray('ttKod').
           
        ASSIGN 
            h = TEMP-TABLE ttKod:HANDLE.
        h:READ-JSON ('JsonArray', ja, 'append').
        
        
    END CONSTRUCTOR.
    
    METHOD PUBLIC CHARACTER getKod(INPUT termkod AS CHARACTER, INPUT avk AS CHARACTER):
        
        FIND FIRST ttKod WHERE ttkod.TermKod = TermKod AND  ttkod.Avk = avk NO-ERROR.
        RETURN ttKod.Namn.
        
    END METHOD.

END CLASS.