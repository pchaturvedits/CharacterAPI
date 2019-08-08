//
//  Actor.swift
//  JSONDownloadingSwift4
//
//  Created by Xiaodan Wang on 9/20/17.
//  Copyright © 2017 Xiaodan Wang. All rights reserved.
//

import UIKit

struct Character: Codable {
    let RelatedTopics: [RelatedTopic]
}

struct RelatedTopic : Codable {
    let Text: String
    let Icon: IconObj
}

struct IconObj : Codable {
    let URL:String
}
