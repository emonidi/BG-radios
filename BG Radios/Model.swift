//
//  Model.swift
//  BG Radios
//
//  Created by Emiliyan Gospodinov on 12/5/15.
//  Copyright © 2015 Emiliyan Gospodinov. All rights reserved.
//

import Foundation

class RadioModel{
    
    
    let radios = [
        [
            Radio(name:"БНР програма Хоризонт",
                description:"Българско национално радио",
                url:NSURL(string: "http://stream.bnr.bg:8002/horizont.m3u")!,
                stationImgUrl:NSURL(string: "http://static.bnr.bg/gallery/00/00a28d9fc77e98be96dfe530acff67e7.jpg")!
            ),
            Radio(name: "БНР програма Христо Ботев",
                description: "Българско национално радио",
                url: NSURL(string: "http://stream.bnr.bg:8003/botev.mp3.m3u")!,
                stationImgUrl:NSURL(string: "http://static.bnr.bg/gallery/00/00a28d9fc77e98be96dfe530acff67e7.jpg")!
                
            ),
            Radio(name: "Дарик Радио",
                description: "Частно национално радио",
                url: NSURL(string: "http://darikradio.by.host.bg:8000/S2-128.m3u")!,
                stationImgUrl:NSURL(string: "http://www.radiosbg.com/sites/default/files/styles/logo_image/public/radio_dariknews_bg.png?itok=vtIqN3cI")!
                
            )
        ],
        
        [
            Radio(name: "Радио 1",
                description: "Kласическите хитове!",
                url: NSURL(string: "http://149.13.0.81/radio1128.m3u")!,
                stationImgUrl:NSURL(string: "http://www.predavatel.com/bg/radio/radio1.png")!
            ),
            Radio(name: "Радио 1 Рок ",
                description: "Едно рок радио!",
                url: NSURL(string: "http://149.13.0.81/radio1rock128.m3u")!,
                stationImgUrl:NSURL(string: "http://www.predavatel.com/bg/radio/radio1rock.png")!
                
            ),
            Radio(name: "БГ Радио",
                description: "Само българска музика!",
                url: NSURL(string: "http://149.13.0.80/bgradio128.m3u")!,
                stationImgUrl:NSURL(string: "http://www.predavatel.com/bg/radio/bgradio.png")!
                
            ),
            
            Radio(name: "bTV Радио",
                description: "101.1 причини да слушаш",
                url: NSURL(string: "http://live.btvradio.bg/btv-radio.mp3.m3u")!,
                stationImgUrl:NSURL(string: "http://www.predavatel.com/bg/tv/btv_images/btvradio.gif")!
                
            ),
            
            Radio(name: "Радио Вероника",
                description: "Ритъмът на сърцето!",
                url: NSURL(string: "http://149.13.0.81/veronika64.m3u")!,
                stationImgUrl:NSURL(string: "http://www.predavatel.com/bg/radio/veronika.gif")!
                
            ),
            
            
            Radio(name: "Радио Energy",
                description: "Hit Music Only!",
                url: NSURL(string: "http://149.13.0.80/nrj128.m3u")!,
                stationImgUrl:NSURL(string: "http://www.predavatel.com/bg/1/sofia_snimki/energy.png")!
                
            ),
            
            Radio(name: "Z-Rock",
                description: "Рок радиото на България",
                url: NSURL(string: "http://live.btvradio.bg/z-rock.mp3.m3u")!,
                stationImgUrl:NSURL(string: "http://www.predavatel.com/bg/1/zrock/zrock1.gif")!
                
            ),
            
            Radio(name: "Радио N-Joy",
                description: "Enjoy the music!",
                url: NSURL(string: "http://live.btvradio.bg/njoy.mp3.m3u")!,
                stationImgUrl:NSURL(string: "http://www.predavatel.com/bg/radio/njoy.png")!
                
            ),

            
        ]
    
    ]
    
    
    var sections = [
        "Радиопрограми с национално покритие",
        "Радиомрежи"
    ]
    
    
    
    
    struct Radio{
        var name:String
        var description:String
        var url: NSURL
        var stationImgUrl:NSURL
    }
}
