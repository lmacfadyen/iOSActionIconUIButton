//
//  ViewController.swift
//  iOSActionIconUIButton
//
//  Created by Lawrence F MacFadyen on 2017-08-06.
//  Copyright © 2017 Lawrence F MacFadyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewShare: UIImageView!
    @IBOutlet weak var buttonActionLarge: AlignedImageButton!
    @IBOutlet weak var buttonActionSmall: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shareLarge(_ sender: Any) {
        share(button: buttonActionLarge)
    }
    
    @IBAction func shareSmall(_ sender: Any) {
        share(button: buttonActionSmall)
    }
    
    func share(button:UIButton)
    {
        guard let imageToShare = imageViewShare.image else
        {
            return
        }
        
        let items = [ imageToShare ]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        // Handle iPad and anchor the activity controller to the button
        activityViewController.popoverPresentationController?.sourceView = button
        activityViewController.popoverPresentationController?.sourceRect = button.bounds
        
        // Optional: Exclude some activity types just to illustrate how
        activityViewController.excludedActivityTypes = [ UIActivityType.postToVimeo, UIActivityType.postToFlickr]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
}

