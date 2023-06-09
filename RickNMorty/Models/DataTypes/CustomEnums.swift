//
//  ButtonType.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/13/23.
//

import Foundation
import UIKit
enum StackViewDistribution {
    case equally
    case fill
}
enum ButtonType {
    case changeView
    case sort
}
enum ViewOption {
    case tableView
    case collectionView
}
enum SortingOption {
    case ascending(imageString: String = "alphaAscending", image: UIImage = UIImage(named: "alphaAscending")!, text: String = "Alphabetical (A-Z)")
    case descending(imageString: String = "alphaDescending", image: UIImage = UIImage(named: "alphaDescending")!, text: String = "Alphabetical (Z-A)")
    case alive(imageString: String = "alive", image: UIImage = UIImage(named: "alive")!, text: String = "Alive")
    case dead(imageString: String = "dead", image: UIImage = UIImage(named: "dead")!, text: String = "Dead")
    case unknown(imageString: String = "unknown", image: UIImage = UIImage(named: "unknown")!, text: String = "Unknown")
    
    var image: UIImage {
        switch self {
        case .ascending(_,let image, _):
            return image
        case .descending(_,let image, _):
            return image
        case .alive(_,let image, _):
            return image
        case .dead(_,let image, _):
            return image
        case .unknown(_,let image, _):
            return image
        }
    }
    var imageString: String {
        switch self {
        case .ascending(let imageString, _, _):
            return imageString
        case .descending(let imageString, _, _):
            return imageString
        case .alive(let imageString, _, _):
            return imageString
        case .dead(let imageString, _, _):
            return imageString
        case .unknown(let imageString, _, _):
            return imageString
        }
    }
    
    var text: String {
        switch self {
        case .ascending(_, _, let text):
            return text
        case .descending(_,_,let text):
            return text
        case .alive(_,_, let text):
            return text
        case .dead(_, _,let text):
            return text
        case .unknown(_,_, let text):
            return text
        }
    }
}
