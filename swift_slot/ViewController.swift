//
//  ViewController.swift
//  swift_slot
//
//  Created by ADMIN on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {

    let INTERVAL = 0.2
    
    @IBOutlet weak var image_view: UIImageView!
    
    @IBOutlet weak var start_button: UIButton!
    
    @IBOutlet weak var stop_button: UIButton!
    
    var timer = Timer()
    
    var count = 0
    
    var arrImage = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stop_button.isEnabled = false
        
        for i in 0..<5 {
//            print(i)
            let image = UIImage(named: "\(i)")
            arrImage.append(image!)
        }
        
        image_view.image = UIImage(named: "0")
    }


    @IBAction func start_button(_ sender: Any) {
        start_button.isEnabled = false
        stop_button.isEnabled = true
        
        startTimer()
    }
    
    @IBAction func stop_button(_ sender: Any) {
        start_button.isEnabled = true
        stop_button.isEnabled = false
        
        timer.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: INTERVAL, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    // 0.2秒毎に呼ぶ
    @objc func timerUpdate(){
        count += 1
        count = count > 4 ? 0 : count
        
        image_view.image = arrImage[count]
    }
}

