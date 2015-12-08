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
    var playerItem:AVPlayerItem!
    var hasObserver:Bool = false;
    
    @IBOutlet var PlayButtonOutlet: UIButton!
    @IBOutlet var PauseButton: UIButton!
    @IBOutlet var RadioImage: UIImageView!
    @IBOutlet var RadioTitle: UINavigationItem!
    @IBOutlet var SongTitle: UILabel!
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
        var asset = AVAsset(URL: RadioData.url)
        playerItem = AVPlayerItem(asset: asset);
        Player = AVPlayer(playerItem: playerItem);
        Player.play();
        
        if(!hasObserver){
            playerItem.addObserver(self, forKeyPath: "timedMetadata", options: NSKeyValueObservingOptions.New, context: nil)
            hasObserver = true;
        }
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath != "timedMetadata" { return }
        
        var data: AVPlayerItem = object as! AVPlayerItem
        var title = "";
        for item in data.timedMetadata! as [AVMetadataItem] {
            title = "\(item.value!)"
            print(title);
        }
        
        dispatch_async(dispatch_get_main_queue(), {()->Void in
            self.setTrackDetails(title);
        })
    
    }
    
    func setTrackDetails(details: String){
        self.SongTitle.text = details;
    }
    
    override func viewDidDisappear(animated: Bool) {
        removePlayerObserver()
    }
    
    
    @IBAction func pauseButtonClick(sender: AnyObject) {
        Player.pause();
        removePlayerObserver();
        setTrackDetails("");
        PauseButton.hidden = true;
        PlayButtonOutlet.hidden = false;
    }
    
    
    func removePlayerObserver(){
        if(hasObserver){
            playerItem.removeObserver(self, forKeyPath: "timedMetadata")
            hasObserver = false;
        }
    }
}
