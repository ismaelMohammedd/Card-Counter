//
//  IntroViewController.swift
//  Card Counter
//
//  Created by Ismaël Mohammed on 2023-04-10.
//  Copyright © 2023 Ismael Mohammed. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func playButtonClicked(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "play_vc") as? ViewController else {
                return
        }

        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve

        present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
