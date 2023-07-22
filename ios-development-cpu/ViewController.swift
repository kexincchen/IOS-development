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
    

    @IBOutlet weak var background: UIImageView?
    @IBOutlet weak var gallery_button: UIButton?
    @IBOutlet weak var button_like: UIButton?
    @IBOutlet weak var button_dislike: UIButton?
    
    private let storeManager: UserDefaultManager = UserDefaultManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button_like?.setImage(UIImage(named: icon_like), for: .normal)
        button_dislike?.setImage(UIImage(named: icon_dislike), for: .normal)
        gallery_button?.setImage(UIImage(named: gallery_icon), for: .normal)
        // Do any additional setup after loading the view.
        
//        background?.image = UIImage(named: "photo1")


    }
    

    @IBAction func openGallery(_ sender: Any) {
        print("open gallery")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LISTVC")
        
        let transition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.moveIn
            transition.subtype = CATransitionSubtype.fromTop
        self.navigationController?.view.layer.add(transition, forKey: nil)
        
        self.navigationController?.pushViewController(vc, animated: true)
//        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func pressedLike(_ sender: Any) {
        print("clicked like")
        button_like?.setImage(UIImage(named: icon_like), for: .normal)
        
        // add the image into userDefault
        storeManager.addPhoto(image: "Background")
    }
    
    @IBAction func pressingLike(_ sender: Any) {
        print("pressing like")
        button_like?.setImage(UIImage(named: icon_like_pressed), for: .normal)
    }
    @IBAction func pressingDislike(_ sender: Any) {
        button_dislike?.setImage(UIImage(named: icon_dislike_pressed), for: .normal)
    }
    @IBAction func pressedDislike(_ sender: Any) {
        button_dislike?.setImage(UIImage(named: icon_dislike), for: .normal)
        print("pressed dislike")
    }
    
    func loadPhotoFromURL(){
        let url = URL(string: "")
    }
    
}

extension Array {
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
