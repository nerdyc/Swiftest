import XCTest

// 2014-06-05 (CN):
// Use <T : NSObject> as a workaround because the compiler doesn't like nil. It fails with "unimplemented IR generation
// feature non-fixed class layout"

class Expectation <T : NSObject> {
  var actualValue : T?
  var negative : Bool = false
  
  init() {
    self.actualValue = nil
  }

  init(actualValue: T?) {
    self.actualValue = actualValue
  }
  
  var to : Expectation {
    return self
  }
  
  var notTo : Expectation {
    negative = !negative
    return self
  }

  var notToBe : Expectation {
    return notTo
  }
  
  // ===== EQUALITY ====================================================================================================
  
  func equal(expectedValue : T?) {
    if actualValue? && expectedValue? {
      if negative {
        XCTAssertNotEqual(actualValue!, expectedValue!)
      } else {
        XCTAssertEqual(actualValue!, expectedValue!)
      }
    } else if actualValue? || expectedValue? {
      if !negative {
        XCTFail("\(actualValue) != \(expectedValue)");
      }
    } else { // both are nil
      if negative {
        XCTFail("\(actualValue) != \(expectedValue)");
      }
    }
  }
  
  func be(expectedValue : T?) {
    equal(expectedValue)
  }
  
  func beNil() {
    equal(nil)
  }
  
}

func expect<T : NSObject>(actualValue: T?) -> Expectation<T> {
  return Expectation(actualValue: actualValue)
}
