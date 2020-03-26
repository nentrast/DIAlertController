//
//  DIAlertConfigurationProtocol.swift
//  DIAlertViewController
//
//  Created by Alexandr Lobanov on 25.03.2020.
//  Copyright © 2020 Alexandr Lobanov. All rights reserved.
//

import UIKit

public protocol DIAlertConfigurationProtocol {
    var titleFont: UIFont { get }
    var messageFont: UIFont { get }
    var titleColor: UIColor { get }
    var messageColor: UIColor { get }
    var cornerRadius: CGFloat { get }
    var backgroungColor: UIColor { get }
    var substrateColor: UIColor { get }
    var bacgroundImage: UIImage? { get }
    var customBackgroundView: UIView? { get }
    var verticalButtonSpacing: CGFloat { get}
    var horozontalButtonSpacing: CGFloat { get}
    var buttonHeight: CGFloat { get }
    var desctructiveButtonStyle: DIAlertActionConfiguretionProtocol { get }
    var defaultButtonStyle: DIAlertActionConfiguretionProtocol { get }
    var cancelButtonStyle: DIAlertActionConfiguretionProtocol { get }
}
