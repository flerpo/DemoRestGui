 
/*------------------------------------------------------------------------
   File        : listen
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : eara02
   Created     : Fri Nov 02 15:45:40 CET 2018
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS se.afa.mega.general.listen: 
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE VARIABLE hPubSubSession AS HANDLE NO-UNDO.
    DEFINE VARIABLE hConsumer      AS HANDLE NO-UNDO.
    CONSTRUCTOR PUBLIC listen (  ):
        SUPER ().
        
        /* Subscribes and receives a Text message. */
       
        /* Creates a session object. */
        RUN jms/pubsubsession.p PERSISTENT SET hPubSubSession
            ("-H localhost -S 5162 -AppService sonicMQ1 ").
        RUN setBrokerURL IN hPubSubSession ("tcp://localhost:61616").
        RUN beginSession IN hPubSubSession.    
        
    END CONSTRUCTOR.
    
    METHOD PRIVATE VOID start_listen(TOPICName AS CHARACTER):
        
        RUN createMessageConsumer IN hPubSubSession 
            (SELF,  /* this procedure will handle it */
            "golfHandler",   /* name of internal procedure */
            OUTPUT hConsumer).
        RUN subscribe IN hPubSubSession 
            ("moop",     /* name of topic */
            ?,               /* subscription is not durable */
            ?,               /* no message selector */
            FALSE,           /* want my own messages too */
            hConsumer).      /* handles the incoming messages*/
        /* Start receiving messages */
        RUN startReceiveMessages IN hPubSubSession.
    END METHOD.

END CLASS.