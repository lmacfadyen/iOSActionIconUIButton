//
//  AlignedImageButton.swift
//  iOSActionIconUIButton
//
//  Created by Lawrence F MacFadyen on 2017-08-09.
//  Copyright © 2017 Lawrence F MacFadyen. All rights reserved.
//

import UIKit

class AlignedImageButton: UIButton {

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure()
    {
        // Just in case they aren't set in the Storyboard
        self.contentHorizontalAlignment = .left
        self.imageView?.contentMode = .scaleAspectFit
        
        guard let image = self.image(for: UIControlState.normal) else
        {
            return
        }
        
        // Inset the image based on left edge
        self.imageEdgeInsets = UIEdgeInsetsMake(0, self.bounds.size.width-image.size.width*1.7, 0, 0);
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.darkGray.cgColor
        // Inset top and bottom by 10
        self.contentEdgeInsets = UIEdgeInsetsMake(10,0,10,0)
    }
    
    // Configure button when bounds change since image inset has dependency on bounds
    override public var bounds: CGRect{
        didSet{
            configure()
        }
    }
    
}
