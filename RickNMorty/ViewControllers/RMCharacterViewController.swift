//
//  RMCharacterViewController.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/10/23.
//

import Foundation
import UIKit
class RMCharacterListViewController: UIViewController{
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tabelView: UITableView!
    
    var characterViewModel: RMCharacterViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        registerCells()
       
    }
    private func registerCells() {
        tabelView.dataSource = self
        tabelView.delegate = self
        tabelView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.cellIdentifier)
    }
}
extension RMCharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tabelView.dequeueReusableCell(
            withIdentifier: CharacterTableViewCell.cellIdentifier,
            for: indexPath
        ) as? CharacterTableViewCell else {
            fatalError("Unsupported cell")
        }
        
        return cell
    }
    
    
}
