//
//  ViewController.swift
//  SlideShowApp
//
//  Created by Eiji Takahashi on 2016/06/19.
//  Copyright © 2016年 devlpEiji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //画像
    let images =
            [
            UIImage(named:"image1.jpg") as! AnyObject,
            UIImage(named:"image2.jpg")as! AnyObject,
            UIImage(named:"image3.jpg")as! AnyObject,
            ]
    //スライドショーを表示するslideShowViewer
    @IBOutlet weak var slideShowViewer: UIImageView!
    //拡大するボタン
    @IBAction func enlargeImage(sender: AnyObject) {
        
    }
    //次の画像に行くボタン，ここでnextを呼ぶ
    @IBAction func nextButton(sender: AnyObject) {
    }
    //前の画像に戻るボタン，ここでbackを呼ぶ
    @IBAction func backButton(sender: AnyObject) {
    }
    //画像を次に進める関数
    func next(index:Int,image_count:Int) {
        let index = (index + 1) % image_count
        slideShowViewer.image = (images[index] as! UIImage)
        
    }
    //画像を前に戻す関数
    func back(index:Int,image_count:Int){
        let index = (index - 1)%image_count
        slideShowViewer.image = (images[index] as! UIImage)
    }
    
       override func viewDidLoad() {
        super.viewDidLoad()
        let image_number = images.count - 1
        let timer:NSTimer
        timer = NSTimer.scheduledTimerWithTimeInterval(
            2.0,
            target: self,
            selector:(Selector("next(0,image_count:\(image_number))")),
            userInfo: nil,
            repeats: true)
       timer.fire()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

