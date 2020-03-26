//
//  DIAlertActionConfiguretionProtocol.swift
//  DIAlertViewController
//
//  Created by Alexandr Lobanov on 26.03.2020.
//  Copyright © 2020 Alexandr Lobanov. All rights reserved.
//

import UIKit

public protocol DIAlertActionConfiguretionProtocol {
    var font: UIFont { get }
    var textColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var borderColor: UIColor { get }
    var borderWidth: CGFloat { get }
    var corenrRadius: CGFloat { get }
}

