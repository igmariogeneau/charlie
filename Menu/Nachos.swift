//
//  Nachos.swift
//  Menu
//
//  Created by eleves on 17-07-20.
//  Copyright © 2017 eleves. All rights reserved.
//

import Foundation

class Nachos: Entree {
    let withCheese: Bool
    init(withCheese: Bool, image: String, price: Double, name: String) {
        self.withCheese = withCheese
        super.init(image: image, price: price, name: name)
    }
}
