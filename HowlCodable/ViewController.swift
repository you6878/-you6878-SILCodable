//
//  ViewController.swift
//  HowlCodable
//
//  Created by 유명식 on 2018. 5. 23..
//  Copyright © 2018년 유명식. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var json = """
{
    "type":"fruit",
    "size":{
               "width":150,
               "height":150,
               "datas" : [{
                  "title" : "제목1",
                  "body": "메세지1"
               },{
                  "title" : "제목2",
                  "body": "메세지2"
               }]
           }
}
"""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let photoObject = try? JSONDecoder().decode(PhotoDTO.self, from: json.data(using: .utf8)!)
        print(photoObject)
        
        let photoJson = try? JSONEncoder().encode(photoObject)
        print(String(data: photoJson!, encoding: .utf8))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

