import XCTest

class SwiftestTests: XCTestCase {
  
  func testToBeEqualWithBooleans() {
    expect(true).to.be(true)
    expect(true).notTo.be(false)
    
    expect(true).to.equal(true)
    expect(true).notTo.equal(false)
  }
  
  func testToBeEqualWithOptionals() {
    var emptyValue : String?
    var realValue = "Hello, world"
    var otherRealValue = "Hello, world"
    
    expect(realValue).to.equal(otherRealValue)
    expect(realValue).notTo.equal(emptyValue)
    expect(realValue).notTo.beNil()
    
    expect(emptyValue).to.equal(emptyValue)
    expect(emptyValue).notTo.equal(realValue)
    expect(emptyValue).to.beNil()
  }
  
}
