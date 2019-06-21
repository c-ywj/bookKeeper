//
//  BookDetailViewController.swift
//  BookTracker
//
//  Created by Carson Yan on 2019-03-02.
//  Copyright © 2019 Carson Yan. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

  var book : Book?
  
  @IBOutlet weak var coverImgView: UIImageView!
  
  @IBOutlet weak var titleInfoField: UILabel!
  @IBOutlet weak var isbnInfoField: UILabel!
  @IBOutlet weak var authorInfoField: UILabel!
  @IBOutlet weak var ratingInfoField: UILabel!
  @IBOutlet weak var notesInfoField: UILabel!
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
    self.title = book?.title
    
    if let val = book {
      
      if let url = URL(string: val.coverImgUrl),
        let data = try? Data(contentsOf: url) {
          coverImgView.image = UIImage(data: data)
        }
      
      titleInfoField.text = val.title
      isbnInfoField.text = val.isbn
      authorInfoField.text = val.author
      ratingInfoField.text = String(format: "%.1f", val.rating)
      
      if let notes = val.notes {
        notesInfoField.text = notes
      } else {
        notesInfoField.text = "N/A"
      }
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

}
