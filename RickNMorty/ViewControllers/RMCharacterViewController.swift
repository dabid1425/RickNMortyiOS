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
    @IBOutlet weak var tabelView: UITableView!
    var changeViewStyle = ImageButtonModel(image: "tablecells.fill", isRounded: true, isSystemNamed: true, buttonType: .changeView)
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
        //        imageButton2.configure()
    }
    private func registerCells() {
        tabelView.dataSource = self
        tabelView.delegate = self
        tabelView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: CharacterTableViewCell.cellIdentifier)
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
    
    private func stopSpinner(){
        spinner.stopAnimating()
        spinner.alpha = 0
        characterViewModel.tableView ? tabelView.reloadData() : collectionView.reloadData()
    }
    private func displayDetailVC(indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "RMCharacterDetailVC", bundle:nil)
        if let charactersVC = storyBoard.instantiateViewController(withIdentifier: "RMCharacterDetailViewController") as? RMCharacterDetailViewController {
            
            navigationController?.pushViewController(charactersVC, animated: true)
        }
    }
}
extension RMCharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterViewModel.getCharacters().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tabelView.dequeueReusableCell(
            withIdentifier: CharacterTableViewCell.cellIdentifier,
            for: indexPath
        ) as? CharacterTableViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(rmCharacter: characterViewModel.getCharacters()[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        displayDetailVC(indexPath: indexPath)
    }
}
extension RMCharacterListViewController: RMCharacterListViewViewModelDelegate{
    func didLoadInitialCharacters() {
        stopSpinner()
    }
    
    func didLoadMoreCharacters() {
        stopSpinner()
        characterViewModel.tableView ? tabelView.reloadData() : collectionView.reloadData()
    }
}

extension RMCharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterViewModel.getCharacters().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? CharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(rmCharacter: characterViewModel.getCharacters()[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/2, height: collectionView.bounds.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        displayDetailVC(indexPath: indexPath)
    }
}

extension RMCharacterListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard characterViewModel.shouldShowLoadMoreIndicator,
              !characterViewModel.isLoadingMoreCharacters,
              !characterViewModel.getCharacters().isEmpty,
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
            characterViewModel.tableView = !characterViewModel.tableView
            viewModel.setImageView(image: characterViewModel.tableView ? "tablecells.fill" : "tablecells")
            imageButton1.configure(viewModel: viewModel)
            tabelView.isHidden = !characterViewModel.tableView
            collectionView.isHidden = characterViewModel.tableView
            characterViewModel.tableView ? tabelView.reloadData() : collectionView.reloadData()
        }
    }
    
    
}
