//
//  DefinitionKey.swift
//  PauContainer
//
//  Created by Pau on 01/04/2020.
//

/// Internal struct used to key the stored elements
internal struct DefinitionKey: Hashable {
    public let type: Any.Type
    
    init(type: Any.Type) {
        self.type = type
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine("\(type)")
    }
    
    public static func ==(lhs: DefinitionKey, rhs: DefinitionKey) -> Bool {
        return
            lhs.type == rhs.type
    }
}
