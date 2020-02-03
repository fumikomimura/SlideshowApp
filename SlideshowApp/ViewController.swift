//
//参考サイトhttp://seeku.hateblo.jp/entry/2016/07/02/221842
//https://secondflush2.blog.fc2.com/blog-entry-96.html
//https://teratail.com/questions/165660
//

//  ViewController.swift
//  SlideshowApp
//
//  Created by 三村文子 on 2020/01/26.
//  Copyright © 2020 三村文子. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var backbutton: UIButton!
    
    @IBOutlet weak var playbutton: UIButton!
    
    @IBOutlet weak var susumubutton: UIButton!
    
    //imageViewを関連づけ
    
    @IBOutlet weak var UIImageView: UIImageView!
    
    
    var answerNumber = 0
    
    var timer: Timer!
    
    
    //image画像の配列
    let images = [UIImage(named: "rainbow"), UIImage(named: "rainbow2"), UIImage(named: "rainbow3"), UIImage(named:"rainbow4"), UIImage(named:"rainbow5"), UIImage(named:"rainbow6"), UIImage(named:"rainbow7")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view, typically from a nib.
        
        
        let imageView = images[0]
        
        
        //自分が接続の時につけた名前.image　＝　上で定義した名前
        UIImageView.image = imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Didpose of any resources that can vi recreated.
    }
    
    
    //進むボタン
    @IBAction func nextImage(_ sender: Any) {
        if answerNumber == 4 {
            answerNumber = 0
        } else {
            answerNumber += 1
            
            UIImageView.image = images[answerNumber]
            
        }
    }
    
    @IBAction func modorubutton(_ sender: Any) {
        if answerNumber == 0 {
            answerNumber = 4
        } else {
            answerNumber -= 1
        }
        UIImageView.image = images[answerNumber]
    }
    
    //再生ストップボタン
    @IBAction func startStop(_ sender: Any) {
        
        //ここから写経
        if self.timer == nil {
            //タイマーを設定
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.onTimer(_:)), userInfo: nil, repeats: true)
            
            
            //戻るボタンタップ不可
            backbutton.isEnabled = false
            
            //進むボタンタップ不可
            susumubutton.isEnabled = false
            
            
            playbutton.setTitle("停止", for: .normal)
            
        } else if self.timer != nil {
            
            
            //タイマーを停止
            self.timer.invalidate()
            //nilに対して再び再生（nilの時にタイマー生成）
            self.timer = nil
            
            //戻るボタンタップ不可
            backbutton.isEnabled = true
            
            //進むボタンタップ不可
            susumubutton.isEnabled = true
            
            //ボタンの名前を再生とする
            playbutton.setTitle("再生", for: .normal)
            
            
            //⭐️ Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.onTimer(_:)), userInfo: nil, repeats: true)
            
            
            
        }
    }
    
    //funcの中に書かないように注意が必要
    //再生で2秒毎に進むから進むボタンと同じコード
    @objc func onTimer(_ timer: Timer) {
        
        if answerNumber == 4 {
            answerNumber = 0
        } else {
            answerNumber += 1
            
            UIImageView.image = images[answerNumber]
            
        }
 
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        //前の画面からsegueを使って戻ってきた時に呼ばれる
    }
    //画面遷移させる時に必ず設定する！
    //segueからが遷移先のtaped
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let tappedViewController: tappedViewController = segue.destination as! tappedViewController
        tappedViewController.UIImageView = self.UIImageView
        
        
}
}
