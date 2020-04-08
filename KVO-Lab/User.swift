//
//  User.swift
//  KVO-Lab
//
//  Created by Liubov Kaper  on 4/7/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import Foundation

@objc class  Account: NSObject {
    static var shared = Account()
   @objc dynamic var users = [UserInfo]()
   
}
