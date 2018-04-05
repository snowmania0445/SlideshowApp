//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 春原卓也 on 2018/04/04.
//  Copyright © 2018年 takuya.sunohara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideShowImage: UIImageView!
    
    @IBOutlet weak var nextImageButton: UIButton!
    @IBOutlet weak var prevImageButton: UIButton!
    
    @IBAction func enlargeImage(_ sender: Any) {
        //タッチで拡大画像に遷移
        performSegue(withIdentifier: "enlarge", sender: nil)
    }
    
    //表示している画像の番号
    var currentImageNo = 0
    
    //スライドショーのための準備
    var timer: Timer!
    
    @objc func updateTimer(timer: Timer) {
        currentImageNo += 1
        displayImage()
    }

    //画像を表示するための関数
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = ["img_01.JPG", "img_02.JPG", "img_03.JPG",]
        
        //画像をループさせるための処理
        let numberOfImages = imageNameArray.count - 1
        
        if currentImageNo < 0 {
            currentImageNo = numberOfImages
        }
        
        if currentImageNo > numberOfImages {
            currentImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[currentImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        slideShowImage.image = image
    }
    
    //戻るボタンの処理
    @IBAction func prevImage(_ sender: Any) {
        //戻るボタンを押すと表示している画像の番号を1減らして画像を表示
        currentImageNo -= 1
        displayImage()
    }
    
    //進むボタンの処理
    @IBAction func nextImage(_ sender: Any) {
        //進むボタンを押すと表示している画像の番号を1増やして画像を表示
        currentImageNo += 1
        displayImage()
    }
    
    //再生／停止ボタンの処理

    @IBOutlet weak var slideshowSwitchLabel: UIButton!
    
    @IBAction func slideshowSwitch(_ sender: Any) {
        //タイマーがない時だけタイマーを作成してスライドショースタート
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            self.slideshowSwitchLabel.setTitle("停止", for: .normal)
            nextImageButton.isEnabled = false
            prevImageButton.isEnabled = false
        }
        else {
            self.timer.invalidate() //タイマーを破棄
            self.timer = nil
            self.slideshowSwitchLabel.setTitle("再生", for: .normal)
            nextImageButton.isEnabled = true
            prevImageButton.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //再生／停止ボタンのテキストを再生に
        slideshowSwitchLabel.setTitle("再生", for: .normal)
        //Viewを読み込んだ際に最初の画像を読み込み。
        let image = UIImage(named: "img_01.JPG")
        slideShowImage.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        //segueから遷移先のSecondViewControllerを取得する
        secondViewController.largeImageNumber = currentImageNo
        //secondViewControllerで宣言しているinputNameにtextFieldの値を渡す
    }
    
    @IBAction func unwind(_ segue : UIStoryboardSegue){}


}

