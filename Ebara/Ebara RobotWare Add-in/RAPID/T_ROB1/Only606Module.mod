MODULE Only606Module
    !*****************************************************
    !Module Name: Only606Module
    !Version:     1.0
    !Description: -
    !Date:        2018-7-23
    !Author:      Michael
    !*****************************************************

    FUNC pos CrossProd(pos vector1,pos vector2)
        VAR pos vectorCrossProd;
        vectorCrossProd.x:=vector1.y*vector2.z-vector1.z*vector2.y;
        vectorCrossProd.y:=vector1.z*vector2.x-vector1.x*vector2.z;
        vectorCrossProd.z:=vector1.x*vector2.y-vector1.y*vector2.x;
        RETURN vectorCrossProd;
    ENDFUNC

ENDMODULE