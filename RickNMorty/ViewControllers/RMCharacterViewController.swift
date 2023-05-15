//
//  RMCharacterViewController.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/10/23.
//

import Foundation
import UIKit
class RMCharacterListViewController: UIViewController {
    
    
    @IBOutlet var imageButton3: ImageButtonView!
    @IBOutlet var imageButton1: ImageButtonView!
    @IBOutlet var imageButton2: ImageButtonView!
    @IBOutlet var searchView: SearchView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var changeViewStyle = ImageButtonModel(image: "tablecells.fill", isRounded: true, isSystemNamed: true, buttonType: .changeView)
    var changeSortStyle = ImageButtonModel(image: "filter", isRounded: true, isSystemNamed: false, buttonType: .sort)
    private var characterViewModel = RMCharacterViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        registerCells()
        characterViewModel.fetchCharacters()
        spinner.startAnimating()
        characterViewModel.delegate = self
        imageButton1.delegate = self
        imageButton2.delegate = self
        setImageButtons()
    }
    
    private func setImageButtons(){
        imageButton1.configure(viewModel: changeViewStyle)
        imageButton2.configure(viewModel: changeSortStyle)
    }
    
    private func registerCells() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: CharacterTableViewCell.cellIdentifier)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 10
        flowLayout.itemSize = CGSize(width: collectionView.bounds.width/2, height: collectionView.bounds.width/2)
        collectionView.collectionViewLayout = flowLayout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CharacterCollectionViewCell.cellIdentifier)
        
    }
    
    private func startSpinner(){
        spinner.startAnimating()
        spinner.alpha = 1
    }
    
    private func changeSortIcon(sortType: SortingOption) {
        self.characterViewModel.sortType = sortType
        changeSortStyle.setImageView(image: sortType.imageString)
        characterViewModel.sortData()
        characterViewModel.tableView ? tableView.reloadData() : collectionView.reloadData()
        imageButton2.configure(viewModel: changeSortStyle)
        
    }
    
    private func changeDisplayView(viewModel: ImageButtonModel, viewOption: ViewOption){
        characterViewModel.tableView = viewOption == .tableView
        viewModel.setImageView(image: characterViewModel.tableView ? "tablecells.fill" : "tablecells")
        imageButton1.configure(viewModel: viewModel)
        tableView.isHidden = !characterViewModel.tableView
        collectionView.isHidden = characterViewModel.tableView
        characterViewModel.tableView ? tableView.reloadData() : collectionView.reloadData()
    }
    
    private func displayViewOption(viewModel: ImageButtonModel){
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // Create your actions - take a look at different style attributes
        let tableView = UIAlertAction(title: "TableView", style: .default) { (action) in
            self.changeDisplayView(viewModel: viewModel, viewOption: .tableView)
        }
        
        let collectionView = UIAlertAction(title: "CollectionView", style: .default) { (action) in
            self.changeDisplayView(viewModel: viewModel, viewOption: .collectionView)
        }
        
        
        // Add the actions to your actionSheet
        actionSheet.addAction(tableView)
        actionSheet.addAction(collectionView)
        // Present the controller
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    private func displaySortingAlertSheet(){
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // Create your actions - take a look at different style attributes
        let ascending = UIAlertAction(title: "Ascending", style: .default) { (action) in
            self.changeSortIcon(sortType: .ascending() )
        }
        
        let descending = UIAlertAction(title: "Descending", style: .default) { (action) in
            self.changeSortIcon(sortType: .descending())
        }
        
        let alive = UIAlertAction(title: "Alive", style: .default) { (action) in
            self.changeSortIcon(sortType: .alive())
        }
        let dead = UIAlertAction(title: "Dead", style: .default) { (action) in
            self.changeSortIcon(sortType: .dead())
        }
        let unknown = UIAlertAction(title: "Unknown", style: .default) { (action) in
            self.changeSortIcon(sortType: .unknown())
        }
        
        
        // Add the actions to your actionSheet
        actionSheet.addAction(ascending)
        actionSheet.addAction(descending)
        actionSheet.addAction(alive)
        actionSheet.addAction(dead)
        actionSheet.addAction(unknown)
        // Present the controller
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    private func stopSpinner(){
        spinner.stopAnimating()
        spinner.alpha = 0
        characterViewModel.tableView ? tableView.reloadData() : collectionView.reloadData()
    }
    private func displayDetailVC(indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "RMCharacterDetailVC", bundle:nil)
        if let charactersVC = storyBoard.instantiateViewController(withIdentifier: "RMCharacterDetailViewController") as? RMCharacterDetailViewController {
            let rmCharacterDetailViewModel = RMCharacterDetailViewModel(characterModel: RMCharacterDetailModel(character: characterViewModel.getCharacters()[indexPath.row]))
            charactersVC.configure(rmCharacterDetailViewModel: rmCharacterDetailViewModel)
            navigationController?.pushViewController(charactersVC, animated: true)
        }
    }
}
extension RMCharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterViewModel.getCharactersCellViewModel().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterTableViewCell.cellIdentifier,
            for: indexPath
        ) as? CharacterTableViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(rmCharacter: characterViewModel.getCharactersCellViewModel()[indexPath.row])
        return cell
    }
}
extension RMCharacterListViewController: RMCharacterListViewViewModelDelegate{
    func didLoadInitialCharacters() {
        stopSpinner()
    }
    
    func didLoadMoreCharacters() {
        stopSpinner()
        characterViewModel.tableView ? tableView.reloadData() : collectionView.reloadData()
    }
}

extension RMCharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterViewModel.getCharactersCellViewModel().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? CharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(rmCharacter: characterViewModel.getCharactersCellViewModel()[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/2, height: collectionView.bounds.width/2)
    }

}

extension RMCharacterListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard characterViewModel.shouldShowLoadMoreIndicator,
              !characterViewModel.isLoadingMoreCharacters,
              !characterViewModel.getCharactersCellViewModel().isEmpty,
              let nextUrlString = characterViewModel.apiInfo?.next,
              let url = URL(string: nextUrlString) else {
            return
        }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [weak self] t in
            let offset = scrollView.contentOffset.y
            let totalContentHeight = scrollView.contentSize.height
            let totalScrollViewFixedHeight = scrollView.frame.size.height
            
            if offset >= (totalContentHeight - totalScrollViewFixedHeight - 120) {
                self?.spinner.alpha = 1
                self?.spinner.startAnimating()
                self?.characterViewModel.fetchAdditionalCharacters(url: url)
            }
            t.invalidate()
        }
    }
}

extension RMCharacterListViewController: ImageButtonViewClicked{
    func buttonClicked(viewModel: ImageButtonModel) {
        if viewModel.buttonTypeEnum == .changeView {
            displayViewOption(viewModel: viewModel)
        } else {
            displaySortingAlertSheet()
        }
    }
}
