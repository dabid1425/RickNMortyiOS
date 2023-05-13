//
//  SearchView.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/12/23.
//

import Foundation
import UIKit
class SearchView : UIView{
    
    @IBOutlet var searchBar: UISearchBar!
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
extension SearchView :  UISearchBarDelegate, UISearchDisplayDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText",searchText)
    }
}
