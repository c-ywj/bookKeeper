//
//  ViewController.swift
//  BookTracker
//
//  Created by Carson Yan on 2019-03-02.
//  Copyright © 2019 Carson Yan. All rights reserved.
//

import UIKit

// We've added the UITableViewDelegate and UITableViewDataSource prototypes
// This means our ViewController class needs to conform to these prototypes
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var bookTable: UITableView!
  
  // Dummy data
  let books = [
    Book(
      title: "The Reckoning: A Novel",
      isbn: "0385544154",
      author: "John Grisham",
      coverImgUrl: "https://images-na.ssl-images-amazon.com/images/I/514U1B0D-iL.jpg",
      rating: 3.5,
      notes: "Fictional Novel"
    ),
    Book(
      title: "Where the Crawdads Sing",
      isbn: "0735219095",
      author: "Delia Owens",
      coverImgUrl: "https://images-na.ssl-images-amazon.com/images/I/81WWiiLgEyL.jpg",
      rating: 5,
      notes: "Literature and Fiction"
    ),
    Book(
      title: "Long Road to Mercy (An Atlee Pine Thriller)",
      isbn: "1538761572",
      author: "David Baldacci",
      coverImgUrl: "https://images-na.ssl-images-amazon.com/images/I/51C78y1P0%2BL.jpg",
      rating: 4,
      notes: "Fictional Novel"
    )
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // We are telling the tableView that our ViewController will act as its delegate and dataSource
    bookTable.delegate = self
    bookTable.dataSource = self
  }
  
  // required method to conform to UITableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // We are setting the number of
    return books.count
  }
  
  // required method to conform to UITableViewDataSource
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // We are getting the cell from the queue of cells
    // We recycle cells for better performance
    let cell = bookTable.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
    
    let book = books[indexPath.row]
    
    if let url = URL(string: book.coverImgUrl),
      let data = try? Data(contentsOf: url) { //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
      cell.imageView?.image = UIImage(data: data)
    }
    
    // We set the cell's text label to be our recipe string for that index
    cell.textLabel?.text = books[indexPath.row].title
    
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let bookDetailViewController = segue.destination as? BookDetailViewController,
      let index = bookTable.indexPathForSelectedRow?.row {
      bookDetailViewController.book = books[index]
    }
  }
  
}

