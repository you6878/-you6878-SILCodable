//
//  PhotoDTO.swift
//  HowlCodable
//
//  Created by 유명식 on 2018. 5. 23..
//  Copyright © 2018년 유명식. All rights reserved.
//

import UIKit

struct PhotoDTO: Codable {
    var type : String?
    var size : Size?
    enum CodingKeys:String,CodingKey {
        case type,size
    }
    init(from decoder : Decoder)throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        size = try values.decodeIfPresent(Size.self, forKey: .size)
    }
    struct Size : Codable {
        var height : Double?
        var width : Double?
        var datas : [Data]?
        enum CodingKeys:String,CodingKey {
            case height,width,datas
        }
        init(from decoder : Decoder)throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            height = try values.decodeIfPresent(Double.self, forKey: .height)
            width = try values.decodeIfPresent(Double.self, forKey: .width)
            datas = try values.decodeIfPresent([Data].self, forKey: .datas)
        }
        struct Data:Codable {
            var title : String?
            var body : String?
            enum CodingKeys:String,CodingKey {
                case title,body
            }
            init(from decoder : Decoder)throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                title = try values.decodeIfPresent(String.self, forKey: .title)
                body = try values.decodeIfPresent(String.self, forKey: .body)
            }
        }
    }
}
