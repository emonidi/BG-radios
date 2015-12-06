//
//  RadioDetailViewController.swift
//  BG Radios
//
//  Created by Emiliyan Gospodinov on 12/5/15.
//  Copyright © 2015 Emiliyan Gospodinov. All rights reserved.
//

import UIKit
import AVFoundation

class RadioDetailViewController: UIViewController {
    
    var RadioData:RadioModel.Radio!;
    var Player:AVPlayer!
    
    @IBOutlet var PlayButtonOutlet: UIButton!
    @IBOutlet var PauseButton: UIButton!
    @IBOutlet var RadioImage: UIImageView!
    @IBOutlet var RadioTitle: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        RadioTitle.title = RadioData.name
        getImage(RadioData.stationImgUrl)
        self.navigationController?.navigationItem.backBarButtonItem?.setNilValueForKey("title")
        
        PauseButton.hidden = true;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getImage(url: NSURL){
        let request = NSURLRequest(URL: url)
        NSURLSession.sharedSession().dataTaskWithRequest(request,completionHandler: {(data,response,error)->Void in
            if(error == nil){
                dispatch_async(dispatch_get_main_queue(), {()->Void in
                    if let data = data as NSData?{
                        self.RadioImage.image = UIImage(data: data);
                        self.RadioImage.setNeedsLayout()
                        self.view.setNeedsLayout()
                        self.applyBlur(self.RadioImage.image!)
                    }
                })
            }
        }).resume();
    }
    
    func applyBlur(image:UIImage){
        //only apply the blur if the user hasn't disabled transparency effects
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            self.view.backgroundColor = UIColor(patternImage: image);
            
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            
            
            //if you have more UIViews, use an insertSubview API to place it where needed
            self.view.insertSubview(blurEffectView, atIndex: 0)
        }
    }
    
    @IBAction func playButton(sender: UIButton) {
//        Player = AVPlayer(URL: RadioData.url);
//        Player.play();
        PlayButtonOutlet.hidden = true;
        PauseButton.hidden = false;
        var playerItem = AVPlayerItem(URL: RadioData.url);
        Player = AVPlayer(playerItem: playerItem);
        Player.play();
    }

    @IBAction func pauseButtonClick(sender: AnyObject) {
        Player.pause();
        PauseButton.hidden = true;
        PlayButtonOutlet.hidden = false;
    }
    
}
