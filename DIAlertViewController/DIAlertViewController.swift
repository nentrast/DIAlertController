//
//  DIAlertViewController.swift
//  DIAlertViewController
//
//  Created by Alexandr Lobanov on 24.03.2020.
//  Copyright © 2020 Alexandr Lobanov. All rights reserved.
//

import UIKit

protocol DIAlertViewControllerInput: class  {
    func dismiss()
}

public class DIAlertViewController: UIViewController, DIAlertViewControllerInput {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    
    private var actions: [DIAlertAction] = []
    private var alertTitle: String?
    private var message: String?
    
    private var configs: DIAlertConfigurationProtocol = DIAlertConfigurationDefault.rounded
    
    deinit {
        print("Deinit Alert")
    }
    
    public init(title: String?, message: String?, configuration: DIAlertConfigurationProtocol = DIAlertConfigurationDefault.rounded) {
        self.configs = configuration
        self.alertTitle = title
        self.message = message
        super.init(nibName: "DIAlertViewController", bundle: Bundle(for: DIAlertViewController.self))
        setup()
    }
        
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    final public override func viewDidLoad() {
        super.viewDidLoad()
        createButtons()
        applyConfigs()
    }
 
    private func applyConfigs() {
        titleLabel.text = alertTitle
        messageLabel.text = message
        titleLabel.isHidden = alertTitle == nil
        messageLabel.isHidden = message == nil
        titleLabel.font = configs.titleFont
        titleLabel.textColor = configs.titleColor
        messageLabel.textColor = configs.messageColor
        messageLabel.textColor = configs.messageColor
        contentView.layer.cornerRadius = configs.cornerRadius
        
        // MARK: - add custom view as background if needed
        if let view = configs.customBackgroundView {
            addSubview(view)
        }
        
        // MARK: - add image if neeeded
        if let image = configs.bacgroundImage {
            let imageView = UIImageView()
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            addSubview(imageView)
        }
    }
    
    public func addAction(_ action: DIAlertAction) {
        actions.append(action)
    }
    
    // MARK: Presentong self
    /// This method you can use to present alert on top view controller from any place in your code
    /// alert will  be over tabBarController or over navigationController
    public func show(animated: Bool, completion: (() -> Void)? ) {
        let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
        let rootVC = keyWindow?.rootViewController
        
        DispatchQueue.main.async { [weak rootVC] in
            rootVC?.present(self, animated: animated, completion: completion)
        }
    }
    
    // MARK: - DIAlertViewControllerInput
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private

    private func anyActionPressed(_ action: DIAlertAction) {
        dismiss(animated: true, completion: nil)
    }
    
    private func createButtons() {
        actions.sorted(by: { $0.type.rawValue > $1.type.rawValue })
                    .compactMap { [weak self] (action) -> UIButton? in
                        // TODO: refactor switch 
                        switch action.type {
                        case .cancel:
                            action.config = self?.configs.cancelButtonStyle
                        case .destructive:
                            action.config = self?.configs.desctructiveButtonStyle
                        case .default:
                            action.config = self?.configs.defaultButtonStyle
                        }
                        action.parrent = self
                        let button = action.button
                        
                        return button }
                            .forEach({ buttonsStackView.addArrangedSubview($0)
                                $0.heightAnchor.constraint(equalToConstant: configs.buttonHeight ).isActive = true
                            })
        
        let distribution: NSLayoutConstraint.Axis = actions.count > 2 ? .vertical : .horizontal
        switch distribution {
        case .horizontal:
            buttonsStackView.spacing = configs.horozontalButtonSpacing
        case .vertical:
            buttonsStackView.spacing = configs.verticalButtonSpacing
        @unknown default:
            buttonsStackView.spacing = 0
        }
        buttonsStackView.axis = distribution
    }
    
    private func addSubview(_ view: UIView) {
        contentView.insertSubview(view, belowSubview: buttonsStackView)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
