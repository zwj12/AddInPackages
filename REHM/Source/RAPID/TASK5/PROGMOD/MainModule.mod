MODULE MainModule
    PERS bool boolDebug:=FALSE;
    PERS bool boolStop:=FALSE;

    PROC main()
        VAR bool bResult:=TRUE;
        VAR bool bTimeOut;
        
        InitREHM;
        
        WHILE bResult DO
            WaitDO sdoArc1ArcOn,1\MaxTime:=5\TimeFlag:=bTimeOut;
            IF bTimeOut THEN
                IF boolStop THEN
                    ErrWrite\W,"REHM equipment task stopped","Task stopped by user";
                    Stop;
                    boolStop:=FALSE;
                ENDIF
            ENDIF
            WaitDO sdoArc1ArcOn,0;
        ENDWHILE
        
    ENDPROC

ENDMODULE