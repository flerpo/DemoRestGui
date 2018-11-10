class com.stomp.stomp_mqc:

    define private variable pSocketHandle as handle no-undo.
    define private variable pHandlerProc as handle no-undo.
    define private variable msghndproc as character initial ? no-undo.
    define private variable msghndhnd as handle no-undo.
    define public variable PortName as character initial "61613" no-undo.
    define public variable HostName as character initial "localhost" no-undo.
    define public variable ConnectionId as char no-undo.

    def var Logfile as com.stomp.Logger.

    constructor public stomp_mqc( ): 
      
        Logfile = new com.stomp.logger("stomp").
        Logfile:WriteMessage(3, "constructed").
      
    end constructor. 
    
    destructor public stomp_mqc( ): 
      
        if valid-handle(pSocketHandle) 
        then do:
            pSocketHandle:disconnect().
            delete object pSocketHandle.
        end.
        if valid-handle(pHandlerProc) 
        then delete procedure pHandlerProc.
        Logfile:WriteMessage(3, "destructed").

    end destructor. 

    method public void ProcessData(
        input iSocket as handle, 
        input iData as char
        ):

        case entry(1, iData, chr(10)):
            when "CONNECTED" then processConnected(iSocket, iData).
            when "MESSAGE" then processMessage(iSocket, iData).
        end case.
    end method.
    
    method private void processConnected(
        input iSocket as handle, 
        input iData as char
        ):
        def var lLine as char no-undo.
        def var lCnt as int no-undo.
        /* session:ID:ccedevsrv-34158-1214494201050-5:31*/
        do lCnt = 1 to num-entries(iData, chr(10)):
            lLine = entry(lCnt, iData, chr(10)).
            if lLine begins "session:id:" 
            then ConnectionId = substring(lLine, 12).
        end.

    end method.

    method private void processMessage(
        input iSocket as handle, 
        input iData as char
        ):
        def var lLine as char no-undo.
        def var lCnt as int no-undo.
        def var lQueue as char no-undo.
        def var lTimeStamp as char no-undo.
        def var lPriority as int  no-undo.
        def var lInMessage as log  no-undo.
        def var lMessage as char no-undo.
        
    /*
    MESSAGE
    destination:/queue/LISA.job
    timestamp:1214687246322
    priority:0
    expires:0
    message-id:ID:ccedevsrv-34158-1214494201050-5:52:-1:1:9
    
    Hello world 9 2008-06-28T23:07:26.322+02:00

    */
        do lCnt = 1 to num-entries(iData, chr(10)):
            lLine = entry(lCnt, iData, chr(10)).
            if lInMessage 
            then lMessage = lMessage + "~n" + lLine.
            else do:
                if lLine begins "destination:" 
                then lQueue = substring(lLine, 13).
                else if lLine = "" then lInMessage = yes.
            end.
        end.
        if valid-handle(msghndhnd) 
        then run value(msghndproc) in msghndhnd (lQueue, lMessage).

    end method.

    method private void sendframe(
        input iFrame as char
        ):

        def var lMemPtr as memptr no-undo.
        def var lNumBytes as int no-undo.
        
        lNumBytes = length(iFrame).
        set-size(lMemPtr) = lNumBytes + 1. /* add 1 bytes for 0-terminated string */
        put-string(lMemPtr, 1) = iFrame. 
    
        error-status:error = no.
        pSocketHandle:write(lMemPtr, 1, lNumBytes + 1 /*get-size(lMemPtr) */) no-error.
        set-size(lMemPtr) = 0.
    
        if error-status:error
        then do:
            Logfile:writeMessage(1, error-status:get-message(1)).
            return error.
        end.
        else Logfile:writeMessage(3, subst("Outbound~n&1", iFrame)).

    end method.

    method public void abort (
        input iTransactionId as char
        ):
        def var lFrame as char no-undo.
    
        lFrame = subst("ABORT&1transaction: &2&1&1", chr(10), iTransactionId).
        sendFrame(lFrame).
    end method.

    method public void begin(
        input iTransactionId as char
        ):

        def var lFrame as char no-undo.
        
        lFrame = subst("BEGIN&1transaction: &2&1&1", chr(10), iTransactionId).
        sendFrame(lFrame).
    
    end method.

    method public void commit(
        input iTransactionId as char
        ):

        def var lFrame as char no-undo.
        
        lFrame = subst("COMMIT&1transaction: &2&1&1", chr(10), iTransactionId).
        sendFrame(lFrame).
    
    end method.

    method public void connect(
        input iHostName as char,
        input iPort as char,
        input iUserName as char,
        input iPassCode as char
        ):

        def var lFrame as char no-undo.
        HostName = iHostName.
        PortName = iPort.
        tcp_connect().
        lFrame = subst("CONNECT&1login: &2&1passcode:&3&1&1", chr(10), iUserName, iPassCode).
        sendFrame(lFrame).
        
        waitfor(0).
        
    end method.

    method public void SetMessageHandlerProcedure(
        input iProcName as char,
        input iProcHandle as handle
        ):
        msghndproc = iProcName.
        msghndhnd = iProcHandle.
    end method.

    method public void waitfor(
        input iPauseSec as deci
        ):
        wait-for read-response of pSocketHandle pause iPauseSec.
    end method.

    method public void disconnect(
        input iConnectionId as char
        ):
        
        def var lFrame as char no-undo.
        
        lFrame = subst("DISCONNECT&1&1", chr(10), iConnectionId).
        sendFrame(lFrame).
    
    end method.

    method public void sendtext(
        input i-queue as char,
        input i-message as char
        ):
        
        def var lFrame as char no-undo.
        lFrame = subst("SEND&1destination: &2&1persistent:true&1&1&3&1", chr(10), i-queue, i-message).
        sendFrame(lFrame).
        
    end method.
    
    method public void dosubscribe(
        input i-queue as char):
        dosubscribe(i-queue, "auto").
    end method.

    method public void dosubscribe(
        input i-queue as char,
        input i-ack as char
        ):

        def var lFrame as char no-undo.
        
        lFrame = subst("SUBSCRIBE&1destination: &2&1ack:&3&1&1", chr(10), i-queue, i-ack).
        sendFrame(lFrame).
    
    end method.

    method public void unsubscribe(
        input i-queue as char
        ):
    
        def var lFrame as char no-undo.
        
        lFrame = subst("UNSUBSCRIBE&1destination: &2&1&1", chr(10), i-queue).
        sendFrame(lFrame).
    
    end method.

    method private log tcp_connect() :
        Logfile:WriteMessage(3, subst("connect -H &1 -S &2", HostName, PortName)).
        if not valid-handle(pSocketHandle) 
        then do:
            create socket pSocketHandle.
            
            run com/stomp/stompSocketProc.p persistent set pHandlerProc
                (this-object, logFile).
            pSocketHandle:SET-READ-RESPONSE-PROCEDURE("tcp_readhandler",
                pHandlerProc).
        end.
        if pSocketHandle:connect(subst("-H &1 -S &2", HostName, PortName))
        then Logfile:writeMessage(3, subst("Connection to &1 port &2", HostName, PortName)).
        else Logfile:writeMessage(1, subst("Failed to connect to &1 port &2", HostName, PortName)).
    
    end method.

end class.
