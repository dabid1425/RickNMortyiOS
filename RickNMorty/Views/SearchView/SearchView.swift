//
//  SearchView.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/12/23.
//

import Foundation
import UIKit
protocol SearchTextDelegate: AnyObject {
    func textChanged(searchText: String)
}
class SearchView : UIView{
    
    @IBOutlet var searchBar: UISearchBar!
    var delegate: SearchTextDelegate!
    var viewModel: SearchButtonModel? {
          didSet {
              bindViewModel()
          }
      }
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupView()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setupView()
       }
       
       private func setupView() {
           let bundle = Bundle(for: type(of: self))
           let nib = UINib(nibName: "SearchView", bundle: bundle)
           let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
           addSubview(view)
           view.frame = bounds
           view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
           searchBar.delegate = self
       }
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
        searchBar.placeholder = viewModel.placeHolderText
    }
}
extension SearchView :  UISearchBarDelegate, UISearchDisplayDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.textChanged(searchText: searchText)
    }
}
