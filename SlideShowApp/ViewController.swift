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
    var timer:NSTimer! = nil //初期値は入っていない letじゃなくてvar nilいれておく
    //self　引数がおなじ
    
    //スライドショーを表示するslideShowViewer
    @IBOutlet weak var slideShowViewer: UIImageView!
    
   
    
    @IBOutlet weak var stop_or_start_label: UILabel!
    
    //拡大するボタン（）
    
    //次の画像に行くボタン，ここでnextを呼ぶ
    @IBAction func nextButton(sender: AnyObject) {
        next()
    }
    //前の画像に戻るボタン，ここでbackを呼ぶ
    @IBAction func backButton(sender: AnyObject) {
       back()
    }
    
    //次の画像を表示する関数
    func next(){
        //引数index,length_image_countはなぜ？
        //viewcontrollerが持っている->引数はいらない
        //引数は基本的に必要か？
        //インスタンス変数
        
        self.index = (self.index+1) % self.length_image
        self.slideShowViewer.image = (images[self.index] as! UIImage)
        
    }
    
    //前の画像を表示する関数
    func back() {
        //indexはクラスの変数
        //
        //indexが0のときindex-1は-1になり配列[-1]はout of rangeとなるため条件分岐しておく
        
        //ここをしっかり考える
        self.index = (self.index - 1 + self.length_image) % self.length_image
        self.slideShowViewer.image = (images[self.index] as! UIImage)
        
    }

    
    @IBOutlet weak var start_stop: UIButton!
    
    @IBAction func judge_count_start(sender: AnyObject) {
        
        if timer != nil {
//            timerがnilじゃないか先に調べる
//            timer動かすときはイチから作るー＞timer=nil timerが動いている時
            
           timer.invalidate()
            timer = nil
            self.start_stop.setTitle("Resume", forState: UIControlState.Normal)
            
        }
        else{
          timer = NSTimer.scheduledTimerWithTimeInterval(2.0,
                                                        target: self,
                                                        selector: #selector(ViewController.next), userInfo: nil,
                                                        repeats: true)
            self.start_stop.setTitle("Playing", forState: UIControlState.Normal)
        }
        
        
    }
    
    

    //EnlargedViewerに送る写真を用意しておく
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let enlarged_view_controller:EnlargedImageViewController = segue.destinationViewController as! EnlargedImageViewController
    
    //次の画面には遷移前の正しい画像がおくられないことがある
        //imagesのindexの値域 index　−１になってたから
    enlarged_view_controller.enlarged_image = images[self.index] as! UIImage
        
        
    }
    
  
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //最初にindex = 0の画像をslideshowViewerに表示

        
        slideShowViewer.image = (images[index] as! UIImage)
    
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(segue:UIStoryboardSegue){
    }

}

