//
//  ViewController.swift
//  ios-development-cpu
//
//  Created by Clare C on 10/7/2023.
//

import UIKit

class ViewController: UIViewController {
    // names for icon images
    let icon_like: String = "Icon_Like"
    let icon_like_pressed: String = "Icon_Like_pressed"
    let icon_dislike: String = "Icon_Dislike"
    let icon_dislike_pressed: String = "Icon_Dislike_pressed"
    let gallery_icon: String = "Icon_Gallery"

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var gallery_button: UIButton?
    @IBOutlet weak var button_like: UIButton?
    @IBOutlet weak var button_dislike: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button_like?.setImage(UIImage(named: icon_like), for: .normal)
        button_dislike?.setImage(UIImage(named: icon_dislike), for: .normal)
        gallery_button?.setImage(UIImage(named: gallery_icon), for: .normal)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func openGallery(_ sender: Any) {
        print("open gallery")
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        print("clicked")
        button_like?.setImage(UIImage(named: icon_like), for: .normal)
    }
    
    @IBAction func buttonPressing(_ sender: Any) {
        button_like?.setImage(UIImage(named: icon_like_pressed), for: .normal)
    }
    @IBAction func pressingDislike(_ sender: Any) {
        button_dislike?.setImage(UIImage(named: icon_dislike_pressed), for: .normal)
    }
    @IBAction func pressedDislike(_ sender: Any) {
        button_dislike?.setImage(UIImage(named: icon_dislike), for: .normal)
        print("pressed dislike")
    }
    
}

