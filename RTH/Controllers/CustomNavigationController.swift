//
//  CustomNavigationController.swift
//  RTH
//
//  Created by Lan Thien on 11/22/17.
//  Copyright © 2017 Lan Thien. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.shadowImage = makeShadowImage()
        // Do any additional setup after loading the view.
    }
    
    private func makeShadowImage() -> UIImage? {
        let line = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 1))
        line.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        return line.captureImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
