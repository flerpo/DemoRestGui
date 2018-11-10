 
 /*------------------------------------------------------------------------
    File        : HttpGet
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : eara02
    Created     : Fri Oct 26 12:29:35 CEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Json.ObjectModel.JsonObject FROM PROPATH.
USING Progress.Json.ObjectModel.ObjectModelParser FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS se.afa.mega.general.HttpGet: 


 METHOD PUBLIC JsonObject restcallala(pURL AS CHARACTER  ):
        
        DEFINE VARIABLE result      AS JsonObject        NO-UNDO.
        DEFINE VARIABLE myParser    AS ObjectModelParser NO-UNDO. 
        DEFINE VARIABLE ojson       AS JsonObject        NO-UNDO. 
 

        DEFINE VARIABLE HttpClient  AS CLASS             System.Net.WebClient. 
        DEFINE VARIABLE webResponse AS LONGCHAR          NO-UNDO. 
        FIX-CODEPAGE (webResponse) = "UTF-8".
    
        HttpClient = NEW System.Net.WebClient(). 
        HttpClient:Proxy:Credentials = System.Net.CredentialCache:DefaultNetworkCredentials. 
        httpclient:ENCODING = System.Text.Encoding:UTF8.
        DEFINE VARIABLE c AS CHARACTER NO-UNDO.
        webResponse = HttpClient:DownloadString(purl).
        myParser = NEW ObjectModelParser().
         
        result = CAST(myParser:Parse(webResponse),JsonObject).
        HttpClient:Dispose().
        DELETE OBJECT HttpClient.
        RETURN RESULT. 

    END METHOD.

END CLASS.