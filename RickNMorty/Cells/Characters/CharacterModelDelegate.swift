//
//  CharacterModelDelegate.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/15/23.
//

import Foundation
protocol RMCharacterItemSelectedDelegate: AnyObject {
    func didSelectItem(rmCharacter: RMCharacter)
}
