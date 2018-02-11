//
//  DENVisitorView.swift
//  DenWeibo
//
//  Created by DengXiangfei on 2018/2/8.
//  Copyright © 2018年 DengXiangfei. All rights reserved.
//

import UIKit

class DENVisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    func setupInfo(imageName: NSString?, title: NSString) {
        msgLabel.text = title as String
        guard let imgName = imageName else {
            startAnim()
            return
        }
        iconView.image = UIImage(named: imgName as String)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUI()
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var iconView: UIImageView = UIImageView(
        image:UIImage(named:"visitordiscover_feed_image_smallicon")
    )
    
    private lazy var homeIconView: UIImageView = UIImageView(
        image:UIImage(named:"visitordiscover_feed_image_house")
    )
    
    private lazy var msgLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Follow some people,come back here have surprise", comment: "关注一些人，回这里看看有什么惊喜")
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    private lazy var regBtn: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("sign_up", comment: "注册"), for: UIControlState.normal)
        button.setTitleColor(UIColor.orange, for: UIControlState.normal)
        let image = UIImage(named:"common_button_white_disable")
        button.setBackgroundImage(image, for: UIControlState.normal)
        return button
    }()
    
    private lazy var loginBtn: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("sign_in", comment: "登录"), for: UIControlState.normal)
        button.setTitleColor(UIColor.orange, for: UIControlState.normal)
        button.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: UIControlState.normal)
        return button
    }()
    
    private lazy var maskIconView: UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_mask_smallicon"))
    
    private func startAnim(){
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2 * Double.pi
        anim.repeatCount = MAXFLOAT
        anim.duration = 20
        anim.isRemovedOnCompletion = false
        iconView.layer.add(anim, forKey: nil)
    }
}

extension DENVisitorView{
    
    private func setUI(){
        
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(homeIconView)
        addSubview(msgLabel)
        addSubview(regBtn)
        addSubview(loginBtn)
        
        backgroundColor = UIColor(white:237.0/255.0, alpha:1.0)
        
        for view in subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        // icon
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
        // 小房子
        addConstraint(NSLayoutConstraint(item: homeIconView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: homeIconView, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: 0))
        //msgLabl
        addConstraint(NSLayoutConstraint(item: msgLabel, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: msgLabel, attribute: .top, relatedBy: .equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: msgLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 246))
        addConstraint(NSLayoutConstraint(item: msgLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        //regBtn
        addConstraint(NSLayoutConstraint(item: regBtn, attribute: .left, relatedBy: .equal, toItem: msgLabel, attribute: .left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: regBtn, attribute: .top, relatedBy: .equal, toItem: msgLabel, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: regBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: regBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        // loginBtn
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .right, relatedBy: .equal, toItem: msgLabel, attribute: .right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .top, relatedBy: .equal, toItem: msgLabel, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        //maskiconview
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[mask]-0-|", options: [], metrics: nil, views: ["mask":maskIconView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[mask]-(btnHeight)-[regBtn]", options: [], metrics: ["btnHeight":-36], views: ["mask":maskIconView,"regBtn":regBtn]))
        
        
    }
}
