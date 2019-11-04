//
//  Demo_ProjectTests.swift
//  Demo_ProjectTests
//
//  Created by MAC on 03/11/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import XCTest
@testable import Demo_Project
class Demo_ProjectTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    // MARK : making correct chunk test case
    func testForCorrectTextFormating() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      
        let result =  Utilities.splistMessage(message:"\(Constants.text)" )
        if(result.count > 0){
         XCTAssert(true)
        }else{
         XCTAssert(false)
        }

    }
    
    // MARK : making not chunk test case
    func testForFalseTextFormating() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let result =  Utilities.splistMessage(message:"\(Constants.failText)" )
        if(result.count > 0){
          XCTAssert(true)
        }else{
          XCTAssert(false)
        }

    }


    // MARK : performance test for executing 1 lakh records in less then 3 seconds
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
            for _ in 0..<100000 {
            _ =   Utilities.splistMessage(message:"\(Constants.text)" )
               
            }
        }
    }

}

