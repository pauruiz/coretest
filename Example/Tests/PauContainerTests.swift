import XCTest
import PauContainer

class PauContainerTests: XCTestCase {
    var container: PauContainer = PauContainer()
    
    override func setUp() {
        super.setUp()
        container = PauContainer()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_objectStored_sameIsRetrieved() {
        let objectToStore = "Hello"
        container.register(Definition(element: objectToStore))
        let retrievedObject = try! container.resolve() as String
        XCTAssertEqual(objectToStore, retrievedObject)
    }
    
    func test_twoSameObjectTypeAreStored_lastIsRetrieved() {
        let firstObjectToStore = "First"
        let secondObjectToStore = "Second"
        container.register(Definition(element: firstObjectToStore))
        container.register(Definition(element: secondObjectToStore))
        let retrievedObject = try! container.resolve() as String
        XCTAssertEqual(secondObjectToStore, retrievedObject)
    }
    
    func test_retrievingObjectTypeNotStored_Throws() {
        XCTAssertThrowsError(try container.resolve() as String) { (error) in
            switch error {
            case PauContainer.Errors.NonStoredType:
                // All is fine, all is good
                break
            default:
                XCTFail("We are throwing a different error than NonStoredType resolving from an empty container")
            }
        }
    }
    
    func test_resetingContainer_removesElements() {
        let objectToRegister = "Hello, I am scared to be reset"
        container.register(Definition(element: objectToRegister))
        XCTAssertEqual(objectToRegister, try! container.resolve() as String)
        container.reset()
        XCTAssertThrowsError(try container.resolve() as String) { error in
            switch error {
            case PauContainer.Errors.NonStoredType:
                // All is fine, all is good
                break
            default:
                XCTFail("We are throwing a different exception than NonStoredType after trying to retrieve an element with the container reset")
            }
        }
    }
}
