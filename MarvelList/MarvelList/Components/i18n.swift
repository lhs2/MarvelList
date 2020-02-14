//
//  i18n.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 14/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

protocol Localizable {
    var localized: String { get }
}

protocol XIBLocalizable {
    var localizedKey: String? { get set }
}
