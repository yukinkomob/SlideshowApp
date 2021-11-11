//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by Mac on 2021/11/11.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var fullImageView: UIImageView!
    
    var imageName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fullImageView.image = UIImage(named:imageName)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
