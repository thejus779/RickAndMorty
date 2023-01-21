//
//  RMTabController.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import UIKit

class RMTabController: UITabBarController {
    
    var engine: Engine!
    
    init(engine: Engine) {
        self.engine = engine
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This is not how it is supposed to work")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = UITabBarItemAppearance()
        item.normal.titleTextAttributes = [.foregroundColor: UIColor.darkGray]
        item.normal.iconColor = UIColor.darkGray
        item.selected.titleTextAttributes = [.foregroundColor: UIColor.blue]
        item.selected.iconColor = UIColor.blue
        
        let app = UITabBarAppearance()
        app.configureWithOpaqueBackground()
        app.backgroundColor = .white
        app.stackedLayoutAppearance = item
        app.inlineLayoutAppearance = item
        app.compactInlineLayoutAppearance = item
        
        tabBar.standardAppearance = app
        tabBar.scrollEdgeAppearance = app

    }
}
