//
//  Definition.swift
//  PauContainer
//
//  Created by Pau on 01/04/2020.
//

import Foundation

/// Dummy protocol to store definitions for different types in collection
internal protocol DefinitionType: class {
}

/// Definition holding
public final class Definition<T>: DefinitionType {
    let element: T
    
    /// Initialiser with the element to store
    public init(element anElement: T) {
        print(T.self)
        element = anElement
    }
    
    internal func resolveProperty<T>(of instance: Any.Type = T.self) throws -> T {
        guard instance == T.self else { throw PauContainer.Errors.IncorrectType }
        guard let typedElement = element as? T else {throw PauContainer.Errors.IncorrectType }
        return typedElement
    }
}
