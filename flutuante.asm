.data
	number1: .double 3.14
	number2: .double 2.71 
.text
main: 
      ldc1 $f2, number1
      ldc1 $f4, number2
     
      add.d $f12, $f2, $f4 