//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 春原卓也 on 2018/04/04.
//  Copyright © 2018年 takuya.sunohara. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageViewLarge: UIImageView!
    
    var largeImageNumber = 0
    
    // 画像の名前の配列（まとめられる？）
    let imageNameArray = ["img_01.JPG", "img_02.JPG", "img_03.JPG",]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //このあたりもまとめられる？
        //ViewCotroller.swiftから受け取った表示中の画像の名前を取り出し
            let name = imageNameArray[largeImageNumber]
        //画像を読み込み
            let image = UIImage(named: name)
        // Image Viewに読み込んだ画像をセット
            imageViewLarge.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //画像を表示するための関数（ViewController.swiftとまとめられる？）
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
