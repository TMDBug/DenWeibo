//
//  MainTabBarController.swift
//  DenWeibo
//
//  Created by DengXiangfei on 2018/1/23.
//  Copyright © 2018年 DengXiangfei. All rights reserved.
//

import UIKit

class DENMainTabBarController: DENTabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.bringSubview(toFront: composedBtn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addChild()
        setupComposedBtn()
        composedBtn.addTarget(self, action: #selector(composedBtnClick), for: .touchUpInside)
    }
    
    private func addChild() {
        tabBar.tintColor = UIColor.orange
        let rootNav = addChildViewController(vc: DENHomeViewController(), title: NSLocalizedString("home_root_title", comment: "首页"), imageName: "tabbar_home_selected")
        let msgNav = addChildViewController(vc: DENMessageViewController(), title: NSLocalizedString("message_root_title", comment: "消息"), imageName: "tabbar_message_center_selected")
        let add = UIViewController()
        let discoverNav = addChildViewController(vc: DENDiscoverViewController(), title:NSLocalizedString("discover_root_title", comment: "发现"), imageName: "tabbar_discover_selected")
        let meNav = addChildViewController(vc: DENMeViewController(), title: NSLocalizedString("me_root_title", comment: "我"), imageName: "tabbar_profile_selected")
        viewControllers = [rootNav, msgNav, add, discoverNav, meNav]
    }
    
    private func addChildViewController(vc: UIViewController, title: String, imageName: String) -> DENNavigationController {
        let nav = DENNavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(named: imageName)
        return nav
    }
    
    private func setupComposedBtn() {
        tabBar.addSubview(composedBtn)
        let w = tabBar.bounds.width / 5
        composedBtn.frame = CGRect(x:tabBar.bounds.width/2-w/2-0.5, y:0, width:w+1, height:tabBar.bounds.height)
    }
    
    private lazy var composedBtn: UIButton = UIButton(
        imageName: "tabbar_compose_icon_add",
        backImageName: "tabbar_compose_button"
    )
    
    @objc private func composedBtnClick() {
        print("click~")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
