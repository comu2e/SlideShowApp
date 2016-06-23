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
            UIImage(named:"image3.jpg")as! AnyObject
            ]
    let length_image = 3
    var index = 0
    var judge_count = 1
 
    //スライドショーを表示するslideShowViewer
    @IBOutlet weak var slideShowViewer: UIImageView!
    
    @IBAction func judge_start_or_stop(sender: AnyObject) {
        judge_count *= -1
    }
    //拡大するボタン
    @IBAction func enlargeImage(sender: AnyObject) {
        
    }
    //次の画像に行くボタン，ここでnextを呼ぶ
    @IBAction func nextButton(sender: AnyObject) {
        next(index, length_image_count: length_image)
    }
    //前の画像に戻るボタン，ここでbackを呼ぶ
    @IBAction func backButton(sender: AnyObject) {
       back(index, length_image_count: length_image)
    }
    
    //次の画像を表示してそのインデックスを返す関数
    func next(index:Int,length_image_count:Int){
        self.index = (index+1) % length_image_count
        self.slideShowViewer.image = (images[index] as! UIImage)
    }
    

    //前の画像を表示してそのインデックスを返す関数
    func back(index:Int,length_image_count:Int) {
        //indexが0のときindex-1は-1になり配列[-1]はout of rangeとなるため条件分岐しておく
        if index == 0 {
            self.index = length_image_count
            self.index = (self.index - 1)
            self.slideShowViewer.image = (images[index] as! UIImage)
            
        }
        else{
            self.index = (index-1) % length_image_count
            self.slideShowViewer.image = (images[index] as! UIImage)
        }
    }
    
    
    //EnlargedViewerに送る写真を用意しておく
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let enlarged_view_controller:EnlargedImageViewController = segue.destinationViewController as! EnlargedImageViewController
        /*
         拡大画面にいま表示しているimages[index]を渡したいと思って次のように書いています
         */
        if index == 0{
    enlarged_view_controller.enlarged_image = images[0] as! UIImage
        }
        else{
            enlarged_view_controller.enlarged_image = images[index-1] as! UIImage

        }
    }
    
    /*タイマー機能（作りかけ）
    NSTimer.scheduledTimerWithTimeInterval内でusertInfoをつかって
    引数index,length_image_countを渡す方法がわからなかったのでcall_next()を作製
  
    */
    
    func call_next() {
        next(index, length_image_count: 3)

    }
    
    
       override func viewDidLoad() {
        super.viewDidLoad()
        //最初にindex = 0の画像をslideshowViewerに表示

        
        slideShowViewer.image = (images[index] as! UIImage)
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(2.0,
                                                           target: self,
                                                           selector: #selector(ViewController.call_next), userInfo: nil,
                                                           repeats: true)
        if self.judge_count == 1{
        timer.fire()
        }
        else{
        timer.invalidate()
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(segue:UIStoryboardSegue){
    }

}

