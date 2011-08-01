// Problem 1
// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
// Find the sum of all the multiples of 3 or 5 below 1000.

object Euler1 {
  def main(args : Array[String]) : Unit = {
    
    val limit = 1000;
    val i = 3
    val j = 5
    
    // Approach 1
    // i + 2*i + 3*i + 4*i ... = i*(1+2+3+4...)
    var start = System.currentTimeMillis
    
    // Sum the i multiples
    val iCount = Math.floor(limit/i);
    val iSum = i * (iCount)*(iCount+1)/2
    
    // Sum the j multiples
    val jCount : Int = if(limit%j==0) (limit/j) - 1 else Math.floor(limit/j).toInt
    val jSum = j * (jCount)*(jCount+1)/2
    
    // Sum the common multiples
    val fac = i*j
    val facCount = Math.floor(limit/fac)
    val facSum = fac * (facCount)*(facCount+1)/2
    
    // i + j - common
    val answer = iSum + jSum - facSum
    val time = System.currentTimeMillis - start
    
    println(answer + " - " + time );
    
    // Approach 2 (simple)
    start = System.currentTimeMillis
    var answer2 = 0
    for( i <- 3 to 999 if i%3==0 || i%5 == 0) answer2 += i
    val time2 = System.currentTimeMillis - start
    println(answer2 + " - " + time2 );
  }
}