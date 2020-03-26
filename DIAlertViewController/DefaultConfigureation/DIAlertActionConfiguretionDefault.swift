//
//  DIAlertActionConfiguretionDefault.swift
//  DIAlertViewController
//
//  Created by Alexandr Lobanov on 25.03.2020.
//  Copyright © 2020 Alexandr Lobanov. All rights reserved.
//

import UIKit

public enum DIAlertActionConfiguretionDefault: DIAlertActionConfiguretionProtocol {
    case destructive
    case `default`
    case cancel
    
    public var height: CGFloat {
        return 40
    }
    
    public var font: UIFont {
        return UIFont.systemFont(ofSize: 15)
    }
    
    public var borderColor: UIColor {
        return .clear
    }
    
    public var borderWidth: CGFloat {
        return 0
    }
    
    public var corenrRadius: CGFloat {
        return 0
    }
    
    public var textColor: UIColor {
        switch self {
        case .destructive:
            return .red
        case .default,  .cancel:
            return .blue
        }
    }
    
    public var backgroundColor: UIColor {
        return .clear
    }
}
