//
//  GameViewController.swift
//  VideoGameCollector
//
//  Created by C T on 10/3/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

//Added UIImagePickerControllerDelegate and UINavigationControllerDelegate
class GameViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    @IBOutlet weak var gameImageView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var addUpdateButton: UIButton!
    
    
    @IBOutlet weak var deleteButton: UIButton!
    
    
    //Create property imagePicker and set a new object to it
    var imagePicker = UIImagePickerController()
    
    //If game is equal to nil means brand new game otherwise pass the existing game into this property
    var game : Game? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Object pulls information from the delegate for it's need
        imagePicker.delegate = self
        
        if game != nil {
            
            print("We have a game")
            
            gameImageView.image = UIImage(data: game!.image as! Data)
            titleTextField.text = game!.title
            
            addUpdateButton.setTitle("Update", for: .normal)
            
        } else {
            deleteButton.isHidden = true
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func addButton(_ sender: Any) {
        
        
        //If game is not nil then just set the title and the image
        if game != nil {
        
            game!.title = titleTextField.text
            
            //NSDate needs to do either PNG or JPG
            game!.image = UIImagePNGRepresentation(gameImageView.image!) as! NSData
        
        //New game
        } else {
            //Used for Core Date
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let game = Game(context: context)
            
            game.title = titleTextField.text
            
            //NSDate needs to do either PNG or JPG
            game.image = UIImagePNGRepresentation(gameImageView.image!) as! NSData
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //Go back after user clicks Add button
        navigationController!.popViewController(animated: true)
        
        
    }
    @IBAction func photosButton(_ sender: Any) {
        
        //Source from Photo Library
        imagePicker.sourceType = .photoLibrary
        
        //Place another ViewController on the screen
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    //Function used when a user selects an image from their own personal photo collection
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let imageSelected = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //Outlet changes based on selected image
        gameImageView.image = imageSelected
        
        //Removes the view after selecting an image
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cameraButton(_ sender: Any) {
        
        
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        
        //Used for Core Date
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(game!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //Go back after user clicks Add button
        navigationController!.popViewController(animated: true)
        
    }
    
}
