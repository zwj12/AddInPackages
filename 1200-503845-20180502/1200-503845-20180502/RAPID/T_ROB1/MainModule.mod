MODULE MainModule

    PROC main()
        ExecEngine;
        MoveAbsJ jointHome\NoEOffs,speedAir,fine,tool0;
        MoveAbsJ jointHome\NoEOffs,speedAir,z50,tool0;
        UnLockToolChanger;
        Stop;
        LockToolChanger;
        Stop;
    ENDPROC

ENDMODULE