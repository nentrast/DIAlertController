
//
//  DIAlertAction.swift
//  DIAlertViewController
//
//  Created by Alexandr Lobanov on 25.03.2020.
//  Copyright © 2020 Alexandr Lobanov. All rights reserved.
//

import UIKit

public class DIAlertAction {
    
    deinit {
        print("Deinit AlertAction")
    }

    public enum ActionType: Int  {
        case `default` = 0 
        case cancel
        case destructive
        
        var config: DIAlertActionConfiguretionDefault {
            switch self {
            case .default:
                return .default
            case .cancel:
                return .cancel
            case .destructive:
                return .destructive
            }
        }
    }
    
    public let title: String?
    public let type: ActionType
    public var isEnabled: Bool = true
    public var config: DIAlertActionConfiguretionProtocol? {
        didSet {
            self.button = configuredButton()
        }
    }
    
    weak var parrent: DIAlertViewControllerInput?
    
    let handler: ((DIAlertAction) -> Void)?
    
    var button: UIButton?
    
    public init(title: String?, type: ActionType, handler: ((DIAlertAction) -> Void)?) {
        self.title = title
        self.type = type
        self.handler = handler
    }
    
    private func configuredButton() -> UIButton {
        let button = UIButton()
        button.isEnabled = isEnabled
        button.backgroundColor = config?.backgroundColor
        button.titleLabel?.font = config?.font
        button.setTitle(title, for: .normal)
        button.layer.borderColor = config?.borderColor.cgColor
        button.layer.borderWidth = config?.borderWidth ?? 0
        button.layer.cornerRadius =  config?.corenrRadius ?? 0
        button.clipsToBounds = (config?.corenrRadius ?? 0) > 0
        button.setTitleColor(config?.textColor, for: .normal)
        button.setTitleColor(config?.textColor.withAlphaComponent(0.5), for: .highlighted)
        button.addTarget(self, action: #selector(DIAlertAction.action(_:)), for: .touchUpInside)
        return button
    }
    
    @objc private func action(_ sender: UIButton) {
        handler?(self)
        parrent?.dismiss()
    }
}
