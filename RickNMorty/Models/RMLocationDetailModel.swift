//
//  RMLocationDetailModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 6/15/23.
//

import Foundation
class RMLocationDetailModel {
    private let location: RMLocation
    init(location: RMLocation) {
        self.location = location
    }
    func getLocation() -> RMLocation {
        return location
    }
    public var name: String {
        return location.name
    }
    public var type: String {
        return location.type
    }
    public var dimension: String {
        return location.type
    }
    public var residents: [String] {
        return location.residents
    }
    public var url: String {
        return location.url
    }
    public var created: String {
        return location.created
    }
}
