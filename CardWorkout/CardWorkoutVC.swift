//
//  CardWorkoutVC.swift
//  CardWorkout
//
//  Created by rojin on 30.03.2026.
//

import UIKit

class CardWorkoutVC: UIViewController {


    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var Buttons: [UIButton]!
    var cards:[UIImage] = Desk.allImages
    var timer:Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()

        for button in Buttons {
            button.layer.cornerRadius = 8
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }

    func startTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(showRandomImage), userInfo: nil, repeats: true)

    }
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")

    }
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
}
