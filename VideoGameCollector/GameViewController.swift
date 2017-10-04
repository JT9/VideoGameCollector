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
    
    //Create property imagePicker and set a new object to it
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Object pulls information from the delegate for it's need
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func addButton(_ sender: Any) {
        
        
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
    
}
