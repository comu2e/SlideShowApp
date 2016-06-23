//
//  EnlargedImageViewController.swift
//  SlideShowApp
//
//  Created by Eiji Takahashi on 2016/06/19.
//  Copyright © 2016年 devlpEiji. All rights reserved.
//

import UIKit

class EnlargedImageViewController: UIViewController {
    
    @IBOutlet weak var enlarge_viewer: UIImageView!
    
    var enlarged_image:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enlarge_viewer.image = enlarged_image
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
