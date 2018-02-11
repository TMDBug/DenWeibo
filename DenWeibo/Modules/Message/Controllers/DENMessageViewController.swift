//
//  MessageViewController.swift
//  DenWeibo
//
//  Created by DengXiangfei on 2018/1/24.
//  Copyright © 2018年 DengXiangfei. All rights reserved.
//

import UIKit

class DENMessageViewController: DENVisitorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = NSLocalizedString("message_root_title", comment: "消息")
        
        visitorView?.setupInfo(imageName: nil, title: NSLocalizedString("visitor_message_tip", comment: "消息页访客提示") as NSString)
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
