t1       // program and label + block ;
t2       // const ;
t2 error // const duplicate var ;
t3 error // send value to const var ;
t4       // decleration ; 
t4 error // decleration duplicate var ; 
t5       // send value to var as const and as user ; 
t5 error // decleration const send value ; 
t6       // type between int and real real := int ;
t6 error // type between int and real int  := real ;
t7       // real type check ;
t8       // boolean check const and normal ;
t9       // try the type ; 
t9 error // try the type by wrong speling ; 
t10      // try the type with all var ;
t11      // array ;
t12      // send value to the array ; 
t12 error//send real value to array ; 
t13      //send real value to array by var ; 
t13 error//send value by expresen and var ; 
t14      //send value by expresen and var expresen  ; 
t14 error//send minus value ;
t15      // test for more then one dimention array send value ;
t15 error// send wrong index ; 
t16      // assign value of array item to another var ;
t16 error// assign value of array item to another type var ;
t17      // assign value of array item to another vararray ;
t17 error// assign ansign value of array item to another vararray ;
t17 error1// assign value of array item to another undeclered vararray ;
t18       // write method test ;
t18 error // write comma first of method  test ;
t18       // read method test ;
t19       // readln method test ;
t20       // array with const value index ;
t21       // array with const value index and command line  ;
t22       // if ;
t23       // if else ;
t24       // if elseif else begin end ; ...
t25       // repeat until ;
t26       // for ;
t27       // while ; 
t28       // break ;
t28 error // break not in loop ;
t29       // do while ; 
