//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Mac on 2021/11/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    let imageArray = ["night-soldier", "sea-moon", "tsunami"]
    var imageIndex = 0
    
    var timer: Timer!
    var timer_sec: Float = 0
    
    @IBAction func unwind(_segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let imageViewController:ImageViewController = segue.destination as! ImageViewController
        imageViewController.imageName = imageArray[imageIndex]
    }

    @IBAction func showNextImage(_ sender: Any) {
        showNextImageX()
    }
    
    func showNextImageX() {
        if imageIndex == imageArray.count-1 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        let image = UIImage(named:imageArray[imageIndex])
        imageView.image = image
    }
    
    @IBAction func showPrevImage(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = imageArray.count - 1
        } else {
            imageIndex -= 1
        }
        let image = UIImage(named:imageArray[imageIndex])
        imageView.image = image
    }
    
    @IBAction func doSlideShow(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateImage(_:)), userInfo: nil, repeats: true)
            nextButton.isEnabled = false
            prevButton.isEnabled = false
        } else {
            self.timer.invalidate()
            self.timer = nil
            nextButton.isEnabled = true
            prevButton.isEnabled = true
        }
    }
    
    @objc func updateImage(_ timer: Timer) {
        showNextImageX()
    }
        
//        @objc func updateTimer(_ timer: Timer) {
//            self.timer_sec += 0.1
//            self.timerLabel.text = String(format: "%.1f", self.timer_sec)
//        }
}

