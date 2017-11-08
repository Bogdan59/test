//
//  BookTableViewController.swift
//  G57L12
//
//  Created by Bogdan Dubiahin on 08.11.2017.
//  Copyright © 2017 RockSoft. All rights reserved.
//

import UIKit
import Parse

class BookTableViewController: UITableViewController {

    @IBOutlet var categoryTable: UITableView!
    var selectedCategory: PFObject?
    var categoryItems = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadCategorySub(selectedCategory: selectedCategory)
        loadCategorySongs(selectedCategory: selectedCategory)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return categoryItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookCell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)

        let bookItem = categoryItems[indexPath.row]
        let categoryUserTitle = bookItem.object(forKey: "BooksText") as? String

        let songItem = categoryItems[indexPath.row]
        _ = songItem.object(forKey: "SongsText") as? String
        
        bookCell.textLabel?.text = categoryUserTitle

        return bookCell
    }
    

    
    
    func loadCategorySub(selectedCategory: PFObject!) {

        let bookQuery = PFQuery(className: "Books")
        bookQuery.whereKey("BookCategory", equalTo: selectedCategory)
        bookQuery.includeKey("BookCategory")

        bookQuery.findObjectsInBackground { (result: [PFObject]?, error) in
            if let searchResults = result {
//                print("Found Category: \(searchResults.count)")

                self.categoryItems = searchResults
                self.categoryTable.reloadData()
            }
        }
        //
        //


    }
    
    func loadCategorySongs(selectedCategory: PFObject!) {
        
        let songsQuery = PFQuery(className: "Songs")
        songsQuery.whereKey("SongsCategory", equalTo: selectedCategory)
        songsQuery.includeKey("SongsCategory")
        
        songsQuery.findObjectsInBackground { (result: [PFObject]?, error) in
            if let searchResults = result {
//                print("Found Category: \(searchResults.count)")
                
                self.categoryItems = searchResults
                self.categoryTable.reloadData()
            }
        }
        
        
    }
  
    
}
