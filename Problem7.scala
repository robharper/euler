object Problem7 {
  def main(args : Array[String]) : Unit = {
    
    def isDivBy( x: Long, checkers: List[Long] ) = {
      checkers exists (y => x % y == 0)
    }
    
    val count = 10001
    
    var foundPrimes:List[Long] = List(2)
    var toCheck:Long = 3;
    while( foundPrimes.length < count ) {
      if( isDivBy(toCheck, foundPrimes) == false ) {
        foundPrimes = foundPrimes + toCheck
      }
      toCheck += 2
    }
    
    println(foundPrimes.last)
  }
}
