//
//  DefinitionTests.swift
//  PauContainer_Example
//
//  Created by Pau on 02/04/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import PauContainer

class DefinitionTests: XCTestCase {
    var container: PauContainer = PauContainer()
    
    override func setUp() {
        super.setUp()
        container = PauContainer()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_objectStored_sameIsRetrieved() {
        let objectToStore = "objectToStore"
        let definition = Definition(element: objectToStore)
        let objectRestored = try! definition.resolveProperty() as String
        XCTAssertEqual(objectToStore, objectRestored)
    }
    
    func test_objectStored_differentTypeAsked_Throws() {
        let objectToStore = "objectToStore"
        let definition = Definition(element: objectToStore)
        XCTAssertThrowsError(try definition.resolveProperty() as CGPoint) { error in
            switch error {
            case PauContainer.Errors.IncorrectType: break
                // All is good, keep calm and keep coding
            default:
                XCTFail("\(error) exception thrown when different type is asked, expected Incorrect Type")
            }
        }
    }
}
