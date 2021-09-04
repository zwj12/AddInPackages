MODULE UtilityModule
    !*****************************************************
    !Module Name: UtilityModule
    !Version:     1.0
    !Description: -
    !Date:        2018-5-3
    !Author:      Michael
    !*****************************************************

    CONST num nunClampRunMaxTime:=4;
    VAR errnum ERR_SignalMissing:=-1;
    VAR num erroridSignalMissing:=4802;

    TASK PERS num numYearLubricateTrackLast:=2018;
    TASK PERS num numMonthLubricateTrackLast:=4;
    TASK PERS num numDayLubricateTrackLast:=2;
    TASK PERS num numLubricationIntervalDays:=3;

    PROC BitSetGO(VAR signalgo goData,num numBitPos)
        VAR dnum dnumGoData;
        dnumGoData:=GOutputDnum(goData);
        BitSet dnumGoData,numBitPos+1;
        SetGO goData,dnumGoData;
    ENDPROC

    PROC BitClearGO(VAR signalgo goData,num numBitPos)
        VAR dnum dnumGoData;
        dnumGoData:=GOutputDnum(goData);
        BitClear dnumGoData,numBitPos+1;
        SetGO goData,dnumGoData;
    ENDPROC

    FUNC dnum GetSignedValueByUnSigned(dnum dnumData,num numberofBits)
        VAR dnum dnumTemp;
        VAR dnum dnumValue;
        dnumTemp:=PowDnum(2,numberofBits)-1;
        dnumData:=TruncDnum(dnumData);
        dnumData:=BitAndDnum(dnumData,dnumTemp);
        IF BitCheckDnum(dnumData,numberofBits) THEN
            dnumValue:=BitNegDnum(dnumData)+1;
            dnumValue:=BitAndDnum(dnumValue,dnumTemp);
            RETURN 0-dnumValue;
        ELSE
            RETURN dnumData;
        ENDIF
    ENDFUNC

    FUNC num GetTotalDays(num numYear,num numMonth,num numDay)
        VAR num numTotalDays;
        VAR num numYearTemp;
        VAR num numMonthTemp;
        numYearTemp:=numYear;
        numMonthTemp:=numMonth;
        numTotalDays:=numDay;
        WHILE numMonthTemp>1 DO
            numTotalDays:=numTotalDays+GetMonthDays(numYear,numMonthTemp);
            numMonthTemp:=numMonthTemp-1;
        ENDWHILE
        WHILE numYearTemp>2018 DO
            numTotalDays:=numTotalDays+GetYearDays(numYearTemp);
            numYearTemp:=numYearTemp-1;
        ENDWHILE
        RETURN numTotalDays;
    ENDFUNC

    FUNC num GetMonthDays(num numYear,num numMonth)
        TEST numMonth
        CASE 1,3,5,7,8,10,12:
            RETURN 31;
        CASE 4,6,9,11:
            RETURN 30;
        CASE 2:
            IF numYear MOD 4=0 THEN
                RETURN 29;
            ELSE
                RETURN 28;
            ENDIF
        DEFAULT:
            RETURN 0;
        ENDTEST
    ENDFUNC

    FUNC num GetYearDays(num numYear)
        IF numYear MOD 4=0 THEN
            RETURN 366;
        ELSE
            RETURN 365;
        ENDIF
    ENDFUNC

    PROC LubricateTrack()
        VAR num numYearToday;
        VAR num numMonthToday;
        VAR num numDayToday;
        VAR num numTotalDaysLast;
        VAR num numTotalDaysToday;
        VAR string strToday;
        VAR bool boolOK;
        strToday:=CDate();
        boolOK:=StrToVal(StrPart(strToday,1,4),numYearToday);
        boolOK:=StrToVal(StrPart(strToday,6,2),numMonthToday);
        boolOK:=StrToVal(StrPart(strToday,9,2),numDayToday);
        numTotalDaysLast:=GetTotalDays(numYearLubricateTrackLast,numMonthLubricateTrackLast,numDayLubricateTrackLast);
        numTotalDaysToday:=GetTotalDays(numYearToday,numMonthToday,numDayToday);
        IF numTotalDaysToday-numTotalDaysLast>=numLubricationIntervalDays THEN
            IF DI_Oilcheck1=0 THEN
                LogAppend "Please add the lubricant to the left track";
            ELSE
                PulseDO\High\PLength:=8,Do_Oilon1;
                LogAppend "The left track was Lubricated";
            ENDIF
            IF DI_Oilcheck2=0 THEN
                LogAppend "Please add the lubricant to the right track";
            ELSE
                PulseDO\High\PLength:=8,Do_Oilon2;
                LogAppend "The right track was lubricated";
            ENDIF
            IF DI_Oilcheck1=1 AND DI_Oilcheck2=1 THEN
                numYearLubricateTrackLast:=numYearToday;
                numMonthLubricateTrackLast:=numMonthToday;
                numDayLubricateTrackLast:=numDayToday;
            ENDIF
        ENDIF
    ENDPROC

    PROC ChangeTool(toolno numToolNo\switch NoReturnHome)
        VAR toolno numCurrentToolNo;
        VAR jointtarget jointHomeTemp:=[[0,0,0,0,0,0],[0,0,9E+09,9E+09,9E+09,9E+09]];
        VAR jointtarget jointTemp;
        jointTemp:=CJointT();
        jointHomeTemp:=jointHome;
        jointHomeTemp.extax.eax_a:=jointTemp.extax.eax_a;
        jointHomeTemp.extax.eax_b:=jointTemp.extax.eax_b;
        MoveAbsJ jointHomeTemp,speedAir,fine,tool0;
        numCurrentToolNo:=GInput(giTC_ToolCode);
        IF numCurrentToolNo=numToolNo THEN
            RETURN ;
        ELSEIF numCurrentToolNo>0 THEN
            ToolModifyNewPos(numCurrentToolNo);
            TcDropOffTool numCurrentToolNo;
            LogAppend "TcDropOffTool "+ValToStr(numCurrentToolNo);
        ENDIF
        IF numToolNo>0 THEN
            ToolModifyNewPos(numToolNo);
            TcPickupTool numToolNo\TimeOut:=10;
            LogAppend "TcPickupTool "+ValToStr(numToolNo);
        ENDIF
        IF NOT Present(NoReturnHome) THEN
            MoveAbsJ jointHomeTemp,speedAir,fine,tool0;
        ENDIF
    ENDPROC

    PROC ToolModifyNewPos(toolno numToolNo)
        VAR jointtarget jointTemp;
        jointTemp:=CJointT();
        TcLockPos{numToolNo}.trans.x:=TcLockPos{numToolNo}.trans.x+jointTemp.extax.eax_a-TcLockPos{numToolNo}.extax.eax_a;
        TcDropPos{numToolNo}.trans.x:=TcDropPos{numToolNo}.trans.x+jointTemp.extax.eax_a-TcDropPos{numToolNo}.extax.eax_a;
        TcLockPos{numToolNo}.trans.y:=TcLockPos{numToolNo}.trans.y-(jointTemp.extax.eax_b-TcLockPos{numToolNo}.extax.eax_b);
        TcDropPos{numToolNo}.trans.y:=TcDropPos{numToolNo}.trans.y-(jointTemp.extax.eax_b-TcDropPos{numToolNo}.extax.eax_b);

        TcLockPos{numToolNo}.extax.eax_a:=jointTemp.extax.eax_a;
        TcDropPos{numToolNo}.extax.eax_a:=jointTemp.extax.eax_a;
        TcHomePos{numToolNo}.extax.eax_a:=jointTemp.extax.eax_a;
        TcLockPos{numToolNo}.extax.eax_b:=jointTemp.extax.eax_b;
        TcDropPos{numToolNo}.extax.eax_b:=jointTemp.extax.eax_b;
        TcHomePos{numToolNo}.extax.eax_b:=jointTemp.extax.eax_b;
    ENDPROC

    PROC ChangeScanner()
        ChangeTool toolno1_Scanner;
    ENDPROC

    PROC ChangeWeldGun()
        ChangeTool toolno2_WeldGun;
    ENDPROC


    PROC ChangePlasmaGun()
        ChangeTool toolno3_PlasmaGun;
    ENDPROC

    PROC DropTool()
        ChangeTool 0;
    ENDPROC

    PROC UnLockToolChanger()
        IF giTC_ToolCode>0 THEN
            LogAppend "giTC_ToolCode should be 0";
        ELSEIF diTool1_Prsnt1=0 THEN
            LogAppend "diTool1_Prsnt1 should be 1";
        ELSEIF diTool2_Prsnt1=0 THEN
            LogAppend "diTool2_Prsnt1 should be 1";
        ELSEIF diTool3_Prsnt1=0 THEN
            LogAppend "diTool3_Prsnt1 should be 1";
        ELSE
            Reset doTC_Lock;
            Set doTC_UnLock;
            LogAppend "UnLockToolChanger Manually";
        ENDIF
    ENDPROC

    PROC LockToolChanger()
        Reset doTC_UnLock;
        Set doTC_Lock;
        LogAppend "LockToolChanger Manually";
    ENDPROC

    PROC OperateToolStandClamp(toolno numToolNo,\switch Open|switch Close\switch NoCheck)
        VAR string my_message{5};
        VAR string strdoOpenClamp;
        VAR string strdoCloseClamp;
        VAR string strdiClampOpened;
        VAR string strdiClampClosed;
        VAR signaldo signaldoOpenClamp;
        VAR signaldo signaldoCloseClamp;
        VAR signaldi signaldiClampOpened;
        VAR signaldi signaldiClampClosed;

        TEST numToolNo
        CASE 1,2,3:
            strdoOpenClamp:="doOpenClamp_Stnd"+ValToStr(numToolNo);
            strdoCloseClamp:="doCloseClamp_Stnd"+ValToStr(numToolNo);
            strdiClampOpened:="diClampOpened_Stnd"+ValToStr(numToolNo);
            strdiClampClosed:="diClampClosed_Stnd"+ValToStr(numToolNo);
            AliasIO strdoOpenClamp,signaldoOpenClamp;
            AliasIO strdoCloseClamp,signaldoCloseClamp;
            AliasIO strdiClampOpened,signaldiClampOpened;
            AliasIO strdiClampClosed,signaldiClampClosed;
        DEFAULT:
            LogAppend "The numToolNo is wrong: "+ValToStr(numToolNo);
            Stop;
            RETURN ;
        ENDTEST

        IF Present(Open) THEN
            SetDO signaldoCloseClamp,0;
            SetDO signaldoOpenClamp,1;
            IF NOT Present(NoCheck) THEN
                my_message:=["The clamp is not opened!","","","",""];
                SignalDITestRetryAndSkip\signaldiTest:=signaldiClampOpened,high,my_message\numMaxTime:=nunClampRunMaxTime;
            ENDIF
        ELSE
            SetDO signaldoOpenClamp,0;
            SetDO signaldoCloseClamp,1;
            IF NOT Present(NoCheck) THEN
                my_message:=["The clamp is not closed!","","","",""];
                SignalDITestRetryAndSkip\signaldiTest:=signaldiClampClosed,high,my_message\numMaxTime:=nunClampRunMaxTime;
            ENDIF
        ENDIF
    ENDPROC

    PROC SignalDITestRetryAndSkip(\VAR signaldi signaldiTest|string signaldiTestName,dionum dioValue,string strMessageArray{*},\num numMaxTime)
        VAR string strHeader:="Retry or Skip input signal test";
        VAR bool boolTimeOut;
        VAR string my_buttons{2}:=["Retry","Skip"];
        VAR btnres answer;
        VAR signaldi signaldiTestTemp;
        VAR signalorigin mysignalOrig;
        VAR string strSignalNameOrig;

        IF Present(signaldiTest) THEN
            AliasIO signaldiTest,signaldiTestTemp;
        ELSEIF Present(signaldiTestName) THEN
            AliasIO signaldiTestName,signaldiTestTemp;
        ELSE
            BookErrNo ERR_SignalMissing;
            RAISE ERR_SignalMissing;
        ENDIF

        mysignalOrig:=GetSignalOrigin(signaldiTestTemp,strSignalNameOrig);
        LogAppend "SignalDI Test Name: "+strSignalNameOrig+", dioValue:"+ValToStr(dioValue);

        WHILE signaldiTestTemp<>dioValue DO
            IF Present(numMaxTime) THEN
                WaitDI signaldiTestTemp,dioValue,\MaxTime:=numMaxTime\TimeFlag:=boolTimeOut;
            ELSE
                boolTimeOut:=TRUE;
            ENDIF
            IF boolTimeOut THEN
                LogAppend strHeader\boolNoTPWrite:=TRUE;
                FOR i FROM 1 TO 5 DO
                    IF strMessageArray{i}<>"" THEN
                        LogAppend strMessageArray{i}\boolNoTPWrite:=TRUE;
                    ENDIF
                ENDFOR
                answer:=UIMessageBox(\Header:=strHeader\MsgArray:=strMessageArray\BtnArray:=my_buttons\Icon:=iconInfo);
                IF answer=1 THEN
                    ! Operator selection Retry
                    LogAppend "Retry"\boolNoTPWrite:=TRUE;
                ELSEIF answer=2 THEN
                    ! Operator selection Skip
                    LogAppend "Skip"\boolNoTPWrite:=TRUE;
                    RETURN ;
                ELSE
                    ! No such case defined
                ENDIF
            ENDIF
        ENDWHILE

    ERROR
        IF ERRNO=ERR_SignalMissing THEN
            !ErrRaise "ERR_SignalMissing",erroridSignalMissing,ERRSTR_TASK,ERRSTR_CONTEXT,ERRSTR_UNUSED,ERRSTR_UNUSED,ERRSTR_UNUSED;
            ErrLog erroridSignalMissing,"ERR_SignalMissing",ERRSTR_TASK,ERRSTR_CONTEXT,ERRSTR_UNUSED,ERRSTR_UNUSED;
            RAISE ERR_SignalMissing;
        ENDIF

    ENDPROC
ENDMODULE