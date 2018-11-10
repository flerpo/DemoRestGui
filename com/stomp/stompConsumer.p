{ com/stomp/defaults.i }

DEF VAR myQueue AS CHAR FORM "x(32)" NO-UNDO.
DEF VAR myCnt AS INT  NO-UNDO.
DEF VAR myMsg AS CHAR FORM "x(67)" NO-UNDO.

FORM 
    myQueue myCnt myMsg 
    WITH FRAME f-queue DOWN.
                      
    DEF VAR myStomp AS com.stomp.stomp_mqc.
    DEF VAR startdt AS DATETIME NO-UNDO.
    
    myStomp = NEW com.stomp.stomp_mqc().
    myStomp:connect("{&defaulthost}", "{&defaultport}", "receiver", "").
    myStomp:SetMessageHandlerProcedure("messagehandler", THIS-PROCEDURE).
    myStomp:dosubscribe("/queue/meep").

    PAUSE 0 BEFORE-HIDE.
    startdt = NOW.
    DO WHILE INTERVAL(NOW, startdt, "seconds") < 40:
        myStomp:waitfor(1).
        PROCESS EVENTS.
        DISP myCnt.
    END.
    myStomp:disconnect(myStomp:ConnectionId).

PROCEDURE messagehandler:
    DEF INPUT PARAM iQueue AS CHAR NO-UNDO.    
    DEF INPUT PARAM iMessage AS CHAR NO-UNDO.    

    myCnt = myCnt + 1.
    /*
    down with frame f-queue.
    disp 
        iQueue @ myQueue
        myCnt
        iMessage @ myMsg
        with frame f-queue.
        */

END PROCEDURE. /* messagehandler */
