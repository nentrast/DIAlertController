//
//  DIConfiguration.swift
//  DIAlertViewController
//
//  Created by Alexandr Lobanov on 24.03.2020.
//  Copyright © 2020 Alexandr Lobanov. All rights reserved.
//

import UIKit

public enum DIAlertConfigurationDefault: DIAlertConfigurationProtocol {
    case rounded
    case squared
    
    public var buttonHeight: CGFloat {
        return 30
    }
    
    public var verticalButtonSpacing: CGFloat {
        return 10
    }
    
    public var horozontalButtonSpacing: CGFloat {
        return 10
    }
    
    public var titleFont: UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    public var messageFont: UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
    
    public var titleColor: UIColor {
        return .black
    }
    
    public var messageColor: UIColor {
        return .red
    }
    
    public var backgroungColor: UIColor {
        return .white
    }
    
    public var substrateColor: UIColor {
        return UIColor.black.withAlphaComponent(0.3)
    }
    
    public var bacgroundImage: UIImage? {
        return nil
    }
    
    public var customBackgroundView: UIView? {
        return nil
    }
    
    public var desctructiveButtonStyle: DIAlertActionConfiguretionProtocol {
        return DIAlertActionConfiguretionDefault.destructive
    }
    
    public var defaultButtonStyle: DIAlertActionConfiguretionProtocol {
        return DIAlertActionConfiguretionDefault.default
    }
    
    public var cancelButtonStyle: DIAlertActionConfiguretionProtocol {
        return DIAlertActionConfiguretionDefault.cancel
    }

    public var cornerRadius: CGFloat {
        switch self {
        case .rounded:
            return 6
        case .squared:
            return 0
        }
    }    
}
