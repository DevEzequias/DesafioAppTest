//
//  MainTabBarViewController.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 25/07/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    // MARK: - Properties
    private let tabBarIcons: [String] = ["paperplane.circle", "gearshape"]
    private let tabBarIconsFill: [String] = ["paperplane.circle.fill", "gearshape.fill"]

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupViewControllers()
        setupUITabBarAppearance()
    }

    // MARK: - Helpers
    private func setupViewControllers() {
        let cepViewController = makeCepViewController()
        let configurationViewController = makeConfigurationViewController()
        let viewControllers = [cepViewController, configurationViewController]
        setViewControllers(viewControllers, animated: true)
    }
    
    private func setupUITabBarAppearance() {
        tabBar.backgroundColor = .systemBlue
        tabBar.tintColor = .black
    }
    
    private func makeCepViewController() -> UINavigationController {
        let viewModel = CepViewModel()
        let cepViewController = CepViewController(viewModel: viewModel)
        cepViewController.title = "Cep"
        cepViewController.tabBarItem.image = UIImage(systemName: tabBarIconsFill.first ?? "")
        return UINavigationController(rootViewController: cepViewController)
    }
    
    private func makeConfigurationViewController() -> UINavigationController {
        let viewModel = SettingsViewModel()
        let configurationViewController = SettingsViewController(viewModel: viewModel)
        configurationViewController.title = "Configuração"
        configurationViewController.tabBarItem.image = UIImage(systemName: tabBarIcons.last ?? "")
        return UINavigationController(rootViewController: configurationViewController)
    }
}

// MARK: - MainTabBarViewControllerDelegate

extension MainTabBarViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        updateTabBarIcons()
    }

    private func updateTabBarIcons() {
        guard let tabBarItems = tabBar.items else { return }

        for (index, item) in tabBarItems.enumerated() {
            let isSelected = (selectedIndex == index)

            if isSelected && index < tabBarIcons.count {
                item.image = UIImage(systemName: tabBarIcons[index])
            } else if !isSelected && index < tabBarIconsFill.count {
                item.image = UIImage(systemName: tabBarIconsFill[index])
            }
        }
    }
}

