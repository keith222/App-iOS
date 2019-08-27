//
//  TabViewController.swift
//  Mopcon
//
//  Created by WU CHIH WEI on 2019/7/17.
//  Copyright © 2019 EthanLin. All rights reserved.
//

import UIKit

private enum TabCategory: String {
    
    case lobby = "Lobby"
    case agenda = "Agenda"
    case missions = "Missions"
    case news = "News"
    case more = "More"
    
    func storyboard() -> UIStoryboard {
        
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
    
    func instantiateInitialViewController() -> UIViewController {
        
        guard let vc = storyboard().instantiateInitialViewController() else {
            
            return UIViewController()
        }
        
        //等到所有 tab 都完成，這邊就可以改成 return vc，不需要 switch case

        switch self {
            
        case .lobby, .agenda, .news, .more:
        
            return vc
            
        default: return UIViewController()
            
        }

    }
    
    func image() -> UIImage? {
        
        switch self {
        
        case .lobby: return UIImage.asset(.lobby)
            
        case .agenda: return UIImage.asset(.agenda)
            
        case .missions: return UIImage.asset(.mission)
            
        case .news: return UIImage.asset(.news)
            
        case .more: return UIImage.asset(.more)
            
        }
    }
    
    func seletedImage() -> UIImage? {
        
        switch self {
            
        case .lobby: return UIImage.asset(.lobbySelected)
            
        case .agenda: return UIImage.asset(.agendaSelected)
            
        case .missions: return UIImage.asset(.mission)
            
        case .news: return UIImage.asset(.newsSelected)
            
        case .more: return UIImage.asset(.moreSelected)
            
        }
    }
    
    func title() -> String {
        
        switch self {
            
        case .lobby: return "首頁"
            
        case .agenda: return "議程"
            
        case .missions: return "任務"
            
        case .news: return "最新"
            
        case .more: return "更多"
            
        }
    }
}

class TabBarViewController: UITabBarController {
    
    private let tabs: [TabCategory] = [.lobby, .agenda, .missions, .news, .more]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = tabs.map{ tab in
            
            let vc = tab.instantiateInitialViewController()
            
            let tabBarItem = UITabBarItem(title: tab.title(), image: tab.image(), selectedImage: tab.seletedImage())
        
            vc.tabBarItem = tabBarItem
            
            return vc
        }
        
        tabBar.unselectedItemTintColor = .white
        
        tabBar.tintColor = UIColor.azure
        
        tabBar.barTintColor = UIColor.dark

        tabBar.isTranslucent = false
        
        moreNavigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        moreNavigationController.navigationBar.shadowImage = UIImage.imageWithColor(color: (UIColor.azure?.withAlphaComponent(0.2))!)
        
        moreNavigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        moreNavigationController.navigationBar.isTranslucent = true
        
        moreNavigationController.topViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        if let moreTableView = moreNavigationController.topViewController?.view as? UITableView {
            
            moreTableView.backgroundColor = UIColor.dark
            
            moreTableView.tintColor = .white
            
            moreTableView.separatorStyle = .none
            
            for cell in moreTableView.visibleCells {
            
                cell.selectionStyle = .none
                
                cell.textLabel?.textColor = .white
                
                cell.backgroundColor = .clear
            }
        }
        
        customizableViewControllers = []
    }
}