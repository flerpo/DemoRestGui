    { com/stomp/defaults.i }
    SESSION:APPL-ALERT = YES.
    SESSION:SYSTEM-ALERT = YES.
    SESSION:DEBUG-ALERT = YES.
    
    DEF VAR myStomp AS com.stomp.stomp_mqc.
    DEF VAR l-cnt AS INT NO-UNDO.  
     
    myStomp = NEW com.stomp.stomp_mqc().
    myStomp:connect("{&defaulthost}", "{&defaultport}", "sender", "").
    DO l-cnt = 1 TO 10:
        myStomp:sendtext("/queue/meep", 
                         subst("Hello world &1 &2", l-cnt, ISO-DATE(NOW))).
        /* be gentle on the receiver : pause 1.*/
        
    END.
    myStomp:waitfor(1).
    myStomp:disconnect(myStomp:ConnectionId).
 