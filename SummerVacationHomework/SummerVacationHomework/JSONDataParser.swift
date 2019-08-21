//
//  JSONDataParser.swift
//  SummerVacationHomework
//
//  Created by KaitoKudou on 2019/08/16.
//  Copyright © 2019 KaitoKudou. All rights reserved.
//

import Foundation
import APIKit


class JSONDataParser: DataParser{
    
    var contentType: String?{
        return "application/json"
    }
    
    // デコードしないでそのまま返す
    func parse(data: Data) throws -> Any {
        return data
    }
}
