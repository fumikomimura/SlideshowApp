//
//  tappedViewController.swift
//  SlideshowApp
//
//  Created by 三村文子 on 2020/02/03.
//  Copyright © 2020 三村文子. All rights reserved.
//

import UIKit

class tappedViewController: UIViewController {
    
    //
    @IBOutlet weak var photo: UIImageView!
    
    //受け取る
    var UIImageView :UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        photo.image = UIImageView.image
        
        
        //let tappedViewController: TappedViewController = (segue.destination as? TappedViewController)!
       // tappedViewController.selectedImage = photo
        
    }
    
    
    // Do any additional setup after loading the view.
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


