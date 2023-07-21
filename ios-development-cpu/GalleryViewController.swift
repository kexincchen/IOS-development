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
    
    func deletePhoto(index: Int){
        names_photo.remove(at: index)
    }
}

extension GalleryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names_photo.count
    }
    
    // 显示每个cell的时候调用，更换图片
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "REUSEABLECELL", for: indexPath) as! GalleryCell
        print("cell at index \(indexPath)")
//        cell.textLabel?.text = "Cell \(indexPath)"
        if let image1 = UIImage(named: names_photo[indexPath.row]) {
//            cell.imageView?.contentMode = .scaleAspectFill
            cell.imageView?.image = image1
        }
        return cell

    }
    
    //调整cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
    
    // 删除照片
    // TODO：跳出提示框
    @IBAction func trashPhoto(_ sender: Any) {
        print("trash is clicked")
    }
    
    // 自定义返回键
    @IBAction func backToMain(_ sender: Any) {
        navigationController?.popViewController(animated: true)
//        print("back is clicked")
    }
    
}

extension GalleryViewController: UITableViewDelegate {
    // 右滑点击删除图片
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "DELETE", handler: {_, _, completion in
            // 触发删除函数
            print("Delete clicked")
            self.names_photo.remove(at: indexPath.row)
            self.tableView?.reloadData()
            completion(true)
        })
        let config = UISwipeActionsConfiguration(actions: [action])
        return config
    }
}
