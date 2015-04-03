//
//  ViewController.swift
//  GuruGuru
//
//  Created by 徳弘佑衣 on 2015/04/03.
//  Copyright (c) 2015年 徳弘佑衣. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ピンチ
        let myPinchGesture = UIPinchGestureRecognizer(target: self, action: "pinchGesture:")
        // パン
        let myPan = UIPanGestureRecognizer(target: self, action: "panGesture:")
        // 回転
        let myRotate = UIRotationGestureRecognizer(target: self, action: "rotateGesture:")
        
        self.image.addGestureRecognizer(myPinchGesture)
        self.image.addGestureRecognizer(myPan)
        self.image.addGestureRecognizer(myRotate)

    }
    
    //ピンチイベント(拡大・縮小)
    func pinchGesture(sender: UIPinchGestureRecognizer){
        //imageviewのsetAffineTransformにscaleを渡す
        image.layer.setAffineTransform(CGAffineTransformMakeScale(sender.scale,sender.scale))
    }
    //パン(移動）
    func panGesture(sender: UIPanGestureRecognizer){
        //距離を取得
        let p = sender.translationInView(self.view)
        //移動した距離だけ、UIImageViewのcenterポジションを移動させる
        let movedPoint = CGPointMake(image.center.x + p.x, image.center.y + p.y)
        //imageに渡す
        image.center = movedPoint
        //[sender translationInView:]が返す距離は、ドラッグが始まってからの蓄積値となるため、
        // 今回のようなドラッグに合わせてImageを動かしたい場合には、蓄積値をゼロにする
        sender.setTranslation(CGPointZero, inView: self.view);
    }
    
    //ローテート（回転）
    func rotateGesture(sender: UIRotationGestureRecognizer){
        image.layer.setAffineTransform(CGAffineTransformMakeRotation(sender.rotation))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

