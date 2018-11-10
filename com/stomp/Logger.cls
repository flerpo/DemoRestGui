CLASS com.stomp.Logger:

    /*
    A very basic logging class, writes output to a file
    */

    def private stream s-log.
    DEF PRIVATE VARIABLE l-filename AS CHAR NO-UNDO.

    CONSTRUCTOR PUBLIC Logger(
        INPUT i-filename AS CHAR
        ):
        l-filename = subst("&1/&2&3&4", 
            SESSION:TEMP-DIRECTORY, 
            i-filename,
            ENTRY(1, REPLACE(REPLACE(REPLACE(ISO-DATE(NOW), "-", ""), ":", ""), "T", ""), "."),
            ".log").
        openstream().
    END CONSTRUCTOR.

    DESTRUCTOR PUBLIC Logger():
        closestream().
    END DESTRUCTOR.

    METHOD PRIVATE VOID openstream():
        OUTPUT stream s-log to value(l-filename).
    END METHOD.

    METHOD PRIVATE VOID closestream():
        OUTPUT stream s-log close.
    END METHOD.

    METHOD PUBLIC VOID writeMessage(
        INPUT iSeverity AS INTEGER,
        INPUT iMessage AS CHARACTER
        ):

        /* if the stream is closed re-open it */
/*        if seek(s-log) = ? then openstream().                                      */
/*        put stream s-log unformatted iso-date(now) " " iSeverity " " iMessage skip.*/
    END.

END CLASS.
