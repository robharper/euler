object Problem2 {
  def main(args : Array[String]) : Unit = {}
  
	  /**
    
	  Don't bother calculating the odd values, just skip even to even directly:
    
	   1        3             6
		odd odd even odd odd even
		
		t(n) = t(n-1) + t(n-2)
		= t(n-2)+t(n-3) + t(n-3)+t(n-4)
		= t(n-3)+t(n-4)+t(n-3) + t(n-3)+t(n-5)+t(n-6)
		= 4*t(n-3)+t(n-6)
	    --> t(n), t(n-3), t(n-6) all even
	   */
	  var last2 = 2
	  var last1 = 8
	  var cur = 0
	  var sum = 10
	  while(cur < 4000000) {	    
	    sum += cur	    
        cur = 4*last1 + last2
        last2 = last1
	    last1 = cur
	  }
	  
	  println(sum)
   
   
	  // Naive approach
	  var n2 = 0
	  var n1 = 1
	  var sum2 = 0
	  var n = 0
	  while( n < 4000000 ) {	    
	    if( n % 2.0 == 0 ) sum2 += n	    
        n = n2 + n1
        n1 = n2
	    n2 = n
	  }
      println(sum2)
}
