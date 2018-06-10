.data
	number1: .float 3.14
	number2: .float 2.51 
.text
	lwc1 $f0, number1
	lwc1 $f2, number2
	
	c.eq.s $f0, $f2
	
	 
    