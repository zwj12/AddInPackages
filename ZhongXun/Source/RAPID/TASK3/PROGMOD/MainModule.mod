MODULE MainModule
    TASK PERS jointtarget jointCurrent:=[[96.5842,-16.6496,18.7289,-12.429,-52.0762,86.7299],[-1325,-500,390.507,9E+09,9E+09,9E+09]];
    TASK PERS num numTaskIdleTime:=0.05;

    PROC main()
        WHILE TRUE DO
            jointCurrent:=CJointT(\TaskName:="T_ROB1");
            SetAO Ao144_GantryX,Round(jointCurrent.extax.eax_a);
            SetAO Ao160_GantryY,Round(jointCurrent.extax.eax_b);
            SetAO Ao176_GantryZ,Round(jointCurrent.extax.eax_c);
            WaitTime numTaskIdleTime;
        ENDWHILE
    ENDPROC
ENDMODULE