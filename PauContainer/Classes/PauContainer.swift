import Foundation

public final class PauContainer {
    var definitions = [DefinitionKey: DefinitionType]()

    public enum Errors:Error {
        case IncorrectType
        case NonStoredType
    }

    public init() { }
    
    /// Register a definition of an object
    public func register<T>(_ definition: Definition<T>) {
        let key = DefinitionKey(type: T.self)
        definitions[key] = definition
    }
    
    /// Resets the container to the initial state
    public func reset() {
        definitions = [:]
    }
    
    /// Resolves a type into the stored element
    public func resolve<T>(_ type: Any.Type = T.self) throws -> T {
        let key = DefinitionKey(type: type)
        guard let definition = definitions[key] as? Definition<T> else { throw PauContainer.Errors.NonStoredType }
        return try definition.resolveProperty()
    }
}
