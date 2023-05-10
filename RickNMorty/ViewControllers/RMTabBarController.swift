//
//  RMTabBarController.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/10/23.
//

import UIKit
final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.setUpTabs()
        }
       
    }

    private func setUpTabs() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "RMCharacterVC", bundle:nil)
        if let charactersVC = storyBoard.instantiateViewController(withIdentifier: "RMCharacterListViewController") as? RMCharacterListViewController {
            let locationsVC = RMLocationListViewController()
            let episodesVC = RMEpisodeListViewController()

            charactersVC.navigationItem.largeTitleDisplayMode = .automatic
            locationsVC.navigationItem.largeTitleDisplayMode = .automatic
            episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        
            let nav1 = UINavigationController(rootViewController: charactersVC)
            let nav2 = UINavigationController(rootViewController: locationsVC)
            let nav3 = UINavigationController(rootViewController: episodesVC)

            nav1.tabBarItem = UITabBarItem(title: "Characters",
                                           image: UIImage(systemName: "person"),
                                           tag: 1)
            nav2.tabBarItem = UITabBarItem(title: "Locations",
                                           image: UIImage(systemName: "globe"),
                                           tag: 2)
            nav3.tabBarItem = UITabBarItem(title: "Episodes",
                                           image: UIImage(systemName: "tv"),
                                           tag: 3)
        

            for nav in [nav1, nav2, nav3] {
                nav.navigationBar.prefersLargeTitles = true
            }

            setViewControllers(
                [nav1, nav2, nav3],
                animated: true
            )
        }
        }
       
}

