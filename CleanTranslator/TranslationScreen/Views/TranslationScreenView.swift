//  TranslationScreenView.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

protocol TranslationScreenViewDelegate: AnyObject {
    func translate(text: String)
}

final class TranslationScreenView: UIView {
    
    // MARK: - Constants

    fileprivate enum Constants {
        static let buttonHeight: CGFloat = 54
        static let textViewHeight: CGFloat = 200
    }
    
    // MARK: - UI
    
    private lazy var originalTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderColor = UIColor.red.cgColor
        textView.layer.borderWidth = 1
        return textView
    }()
    
    private lazy var translatedLabel: UILabel = {
        let label = UILabel()
        label.layer.borderColor = UIColor.blue.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    private lazy var translateButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionTranslate), for: .touchUpInside)
        button.setTitle("Translate, please", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [originalTextView, translatedLabel, UIView(), translateButton])
        stackView.axis = .vertical
        return stackView
    }()

    // MARK: - Public Properties

    weak var delegate: TranslationScreenViewDelegate?

    // MARK: - Private Properties

    // MARK: - Init

    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func setup() {
        addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { make in
            make.edges.equalTo(snp_margins)
        }
        
        translateButton.snp.makeConstraints { make in
            make.height.equalTo(Constants.buttonHeight)
        }
        
        originalTextView.snp.makeConstraints { make in
            make.height.equalTo(Constants.textViewHeight)
        }
        
        translatedLabel.snp.makeConstraints { make in
            make.height.equalTo(Constants.textViewHeight)
        }
    }
    
    // MARK: - Actions
    
    @objc private func actionTranslate() {
        guard let text = originalTextView.text, !text.isEmpty else { return }
        
        delegate?.translate(text: text)
    }
}
