//
//  BackSpaceCompare.swift
//  GeekLearning
//
//  Created by 玉皇大亮 on 11/11/18.
//  Copyright © 2018 Lushu. All rights reserved.
//

import Foundation

class BackSpaceCompare {

    public func compare(S: String, T: String) -> Bool {
        let sRe = reStack(str: S)
        let tRe = reStack(str: T)
        return sRe == tRe;
    }

    public func reStack(str: String) -> String {
        var result = [Character]()
        for i in str {
            if (!result.isEmpty) {
                if i != "#" {
                    result.append(i)
                } else {
                    result.removeLast()
                }
            } else {
                if i != "#" {
                    result.append(i)
                }
            }
        }
        return String.init(result);
    }
}
