//
//  NewsObject.swift
//  Mopcon
//
//  Created by WU CHIH WEI on 2019/9/29.
//  Copyright © 2019 EthanLin. All rights reserved.
//

import Foundation

struct News: Codable {
    
    let id, date: Int
    
    let title, description, link: String
}
