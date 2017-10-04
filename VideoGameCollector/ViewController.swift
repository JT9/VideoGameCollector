//
//  ViewController.swift
//  VideoGameCollector
//
//  Created by C T on 10/3/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

//Added Delegate and DataSource for TableView
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var games : [Game] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Used for Core Date
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            
            games = try context.fetch(Game.fetchRequest())
            //Reload tableView data
            tableView.reloadData()
            print(games)
        } catch {
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let game = games[indexPath.row]
        
        //Update textLabel with game name
        cell.textLabel?.text = game.title
        
        //Update cell logo
        cell.imageView?.image = UIImage(data: game.image as! Data)
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


    
}

