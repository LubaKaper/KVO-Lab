//
//  DynamicObjects.swift
//  KVO-Lab
//
//  Created by Liubov Kaper  on 4/7/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import Foundation


@objc class UserInfo: NSObject {
    static var shared = UserInfo()
    @objc dynamic var amount: Int
    @objc dynamic var name: String
    override private init() {
        amount = 0
        name = "John"
    }
}
