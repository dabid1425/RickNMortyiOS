//
//  RMLocationViewCellModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/12/23.
//

import Foundation
class RMLocationViewCellModel {
    private let location: RMLocation

    init(location: RMLocation) {
        self.location = location
    }
    
    public var name: String {
        return location.name
    }
    public var type: String {
        return location.type
    }
    public var dimension: String {
        return location.dimension
    }
    public var residents: [String]{
        return location.residents
    }
    public var created: String{
        return location.created
    }
    public func getLocation() -> RMLocation {
        return location
    }
}
