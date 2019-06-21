//
//  Book.swift
//  BookTracker
//
//  Created by Carson Yan on 2019-03-02.
//  Copyright © 2019 Carson Yan. All rights reserved.
//

import Foundation

class Book {
  var title : String
  var isbn : String
  var author : String
  var coverImgUrl : String
  var rating : Double
  var notes : String?
  
  init(title: String, isbn: String, author: String, coverImgUrl: String, rating: Double, notes: String?) {
    self.title = title
    self.isbn = isbn
    self.author = author
    self.coverImgUrl = coverImgUrl
    self.rating = rating
    self.notes = notes
  }
  
}
