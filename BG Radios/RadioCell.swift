//
//  RadioCellControllerTableViewCell.swift
//  BG Radios
//
//  Created by Emiliyan Gospodinov on 12/5/15.
//  Copyright © 2015 Emiliyan Gospodinov. All rights reserved.
//

import UIKit
import Foundation

class RadioCell: UITableViewCell {
   
    @IBOutlet var RadioDescription: UILabel!
    
    @IBOutlet var RadioName: UILabel!
    var cellData:RadioModel.Radio!;

    
    @IBOutlet var radioImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setSelected(false, animated: true)
        self.backgroundColor = UIColor(red: 237.0, green: 237.0, blue: 237.0, alpha: 1.0);
        self.setNeedsLayout();
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setCellData(model: RadioModel.Radio){
        cellData = model;
        
        let request = NSURLRequest(URL: model.stationImgUrl);
        
        NSURLSession.sharedSession().dataTaskWithRequest(request,completionHandler: {(data,response,error)->Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if let data = data {
                    self.radioImage.image = UIImage(data: data);
                    self.RadioName.text = model.name
                    self.RadioDescription.text = model.description
                    self.setNeedsLayout();
                }

            })
        }).resume();
        
    }
    
}
