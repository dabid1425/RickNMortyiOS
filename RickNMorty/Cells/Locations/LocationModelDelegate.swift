//
//  LocationModelDelegate.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/15/23.
//

import Foundation
protocol LocationModelDelegate: AnyObject {
    func didSelectItem(rmLocation: RMLocation)
}
