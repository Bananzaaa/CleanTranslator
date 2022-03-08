//  ChooseLanguageListScreenView.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

import UIKit

protocol ChooseLanguageListScreenViewDelegate: AnyObject {
    func nextButtonTapped()
}

final class ChooseLanguageListScreenView: UIView {
    
    // MARK: - Constants

    private enum Constants {
        static let buttonHeight: CGFloat = 54
        static let cornerRadius: CGFloat = 8
        static let horizontalOffset: CGFloat = 16
        static let verticalOffset: CGFloat = 8
    }
    
    // MARK: - UI
    
    private(set) lazy var contentView = UIView()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionChooseLanguage), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = Constants.cornerRadius
        return button
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        return spinner
    }()

    // MARK: - Public Properties

    weak var delegate: ChooseLanguageListScreenViewDelegate?

    // MARK: - Init

    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods
    
    func setup(with viewModel: ChooseLanguageListScreenModels.Setup.ViewModel) {
        nextButton.setTitle(viewModel.buttonTitle, for: .normal)
        nextButton.isEnabled = viewModel.isEnabledNextButton
    }
    
    func update(with viewModel: ChooseLanguageListScreenModels.UpdateScreen.ViewModel) {
        nextButton.isEnabled = viewModel.isEnabledNextButton
    }
    
    func showLoading() {
        spinner.startAnimating()
    }
    
    func hideLoading() {
        spinner.stopAnimating()
    }

    // MARK: - Private Methods

    private func setup() {
        addSubview(contentView)
        addSubview(nextButton)
        addSubview(spinner)
        
        nextButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.horizontalOffset)
            make.trailing.equalToSuperview().inset(Constants.horizontalOffset)
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(Constants.buttonHeight)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(Constants.horizontalOffset)
            make.trailing.equalToSuperview().inset(Constants.horizontalOffset)
            make.bottom.equalTo(nextButton.snp.top).inset(-Constants.verticalOffset)
        }
        
        spinner.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
    }
    
    // MARK: - Actions
    
    @objc private func actionChooseLanguage() {
        delegate?.nextButtonTapped()
    }
}
