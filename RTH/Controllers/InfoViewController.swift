//
//  InfoViewController.swift
//  RTH
//
//  Created by Lan Thien on 11/22/17.
//  Copyright © 2017 Lan Thien. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        avatarImgView.makeBorder(color: .clear, width: 0, radius: avatarImgView.frame.width/2)
        backgroundView.alpha = 0
        contentView.layer.setAffineTransform(CGAffineTransform(scaleX: 0.01, y: 0.01))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3) {[weak self] in
            self?.backgroundView.alpha = 0.7
        }
        UIView.animate(withDuration: 0.1, delay: 0.2, options: .curveEaseIn, animations: { [weak self] in
            self?.contentView.layer.setAffineTransform(CGAffineTransform(scaleX: 1, y: 1))
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeView(_ sender: Any) {
        UIView.animate(withDuration: 0.1) {[weak self] in
            let transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            self?.contentView.layer.setAffineTransform(transform)
        }
        UIView.animate(withDuration: 0.3, animations: {[weak self] in
            self?.backgroundView.alpha = 0
        }) { [weak self] (finished) in
            if finished {
                self?.dismiss(animated: false, completion: nil)
            }
        }        
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
