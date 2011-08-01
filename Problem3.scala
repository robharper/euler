// Euler problem 3: What is the largest prime factor of the number 600851475143 ?
object Problem3 {
  def main(args : Array[String]) : Unit = {
    
    /**
     * Find the largest prime factor of a number
     */
    
    /**
     * Is x divisible by y or anything less than y but greater than 1 
     */
    def dividableMoreThanOne( x: Long, y: Long ) : Boolean = {
        if( y > x/2 ) false
        else x % y == 0 || divisibleMoreThanOne(x, y+1)
      }
    
    def isPrime( x: Long ) : Boolean =  divisibleMoreThanOne(x,2) == false
    
    
    val test = 600851475143L    
    var maxFactor = Math.sqrt(test)
    var remaining = test
    var currentTest = 2
    
    while( currentTest < maxFactor ) {
      if( remaining % currentTest == 0 ) {
        // found a factor!
        remaining = remaining/currentTest
        maxFactor = Math.sqrt(remaining)
        println(currentTest)
        
        if( isPrime(remaining) ) {
           println(remaining + " - Done!")
        } else {
          println("Keep looking")
        }

      } else {
        // Not a factor, check next
        currentTest += 1
      }
    }
    
  }
}

