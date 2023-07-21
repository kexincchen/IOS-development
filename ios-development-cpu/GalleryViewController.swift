//
//  GalleryViewController.swift
//  ios-development-cpu
//
//  Created by Clare C on 18/7/2023.
//

import Foundation
import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    var gallery_photos: [UIImage] = []
    var names_photo: [String] = ["photo1", "photo2", "photo3"]
    
    var num_photos: Int = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.register(UINib(nibName: "GalleryCell", bundle: nil), forCellReuseIdentifier: "REUSEABLECELL")
        tableView?.dataSource = self
        tableView?.delegate = self
        
        if let image1 = UIImage(named: "photo1"),
           let image2 = UIImage(named: "photo2"),
           let image3 = UIImage(named: "photo3") {
           gallery_photos = [image1, image2, image3]
            
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.red]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
            
       }

    }
}

extension GalleryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return num_photos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "REUSEABLECELL") ?? GalleryCell()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "REUSEABLECELL", for: indexPath) as! GalleryCell
        print("cell at index \(indexPath)")
//        cell.textLabel?.text = "Cell \(indexPath)"
        if let image1 = UIImage(named: names_photo[indexPath.row]) {
//            cell.updateImage(with: image1)
//            cell.imageView?.contentMode = .scaleAspectFill
            cell.imageView?.image = image1
        }
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
    
    @IBAction func trashPhoto(_ sender: Any) {
        print("trash is clicked")
    }
    @IBAction func backToMain(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
        print("back is clicked")
    }
    
}

extension GalleryViewController: UITableViewDelegate {
    
}
