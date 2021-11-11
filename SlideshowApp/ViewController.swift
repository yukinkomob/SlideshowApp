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
    @IBOutlet weak var slideShowButton: UIButton!
    @IBOutlet weak var slideShowProgress: UIProgressView!
    
    let imageArray = ["night-soldier", "sea-moon", "tsunami"]
    var imageIndex = 0
    
    var timer: Timer!
    
    var progress_timer: Timer!
    var progress_value: Float = 0
    var progress_divisions: Double = 50.0
    
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
            slideShowButton.setTitle("停止", for: .normal)
            slideShowProgress.isHidden = false
            if self.progress_timer == nil {
                self.progress_value = 0.0
                self.progress_timer = Timer.scheduledTimer(timeInterval: 2.0 / progress_divisions, target: self, selector: #selector(updateProgress(_:)), userInfo: nil, repeats: true)
            }
        } else {
            self.timer.invalidate()
            self.timer = nil
            nextButton.isEnabled = true
            prevButton.isEnabled = true
            slideShowButton.setTitle("再生", for: .normal)
            slideShowProgress.isHidden = true
            slideShowProgress.progress = 0.0
            if self.progress_timer != nil {
                self.progress_timer.invalidate()
                self.progress_timer = nil
            }
        }
    }
    
    @objc func updateImage(_ timer: Timer) {
        showNextImageX()
        progress_value = 0
    }
    
    @objc func updateProgress(_ timer: Timer) {
        progress_value += Float(1 / progress_divisions)
        slideShowProgress.progress = progress_value
    }
}

