MODULE ErrorHandlingModule
    !*****************************************************
    !Module Name:   ErrorHandlingModule
    !Version:       1.0
    !Description:   Global persistent data object is shared by all tasks
    !Date:          2018-10-16
    !Author:        Michael
    !*****************************************************

    PROC MyPreProc()
        VAR num nErrNo;
        VAR string stJointName;
        SetDO doFr2ArcOn,0;
        ! Get Errornumber
        nErrNo:=GetArcErrNo();
        ! Get Jointnumber
        stJointName:=GetJointNumber();
        Logging\INFO, "MyPreProc "+"Failing robtarget name:"+stJointName+":"+ValToStr(nErrNo);
        !UIMsgBox\Header:="MyPreProc T_ROB1","Failing robtarget name:"+stJointName\MsgLine2:=" Arc Elog error        :        "+ValToStr(nErrNo);
    ENDPROC

    PROC MyPostProc()
        VAR string stBtnSelected;
        TEST nAEResumeType
        CASE RESUME_KILL:
            stBtnSelected:="Abort";
        CASE RESUME_SKIP_FWD:
            stBtnSelected:="Skip FWD";
        CASE RESUME_SKIP_SEAM:
            stBtnSelected:="Skip Seam";
        CASE RESUME_SKIP_PART:
            stBtnSelected:="Skip Part";
        CASE RESUME_SKIP_OFF:
            stBtnSelected:="Resume";
        ENDTEST
        Logging\INFO, "MyPreProc "+"Selected action:"+stBtnSelected;
        !UIMsgBox\Header:="MyPostProc T_ROB1","Selected action:"+stBtnSelected;
    ENDPROC

    FUNC num GetArcErrNo()
        RETURN GOutput(goWER_ErrNum_2);
    ENDFUNC

    FUNC string GetJointNumber()
        RETURN stArcToPoint;
    ENDFUNC
    
ENDMODULE