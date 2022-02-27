//
//  LanguageTableViewCell.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 27.02.2022.
//

import UIKit

final class LanguageTableViewCell: UITableViewCell {
    
    // MARK: - Constants

    private enum Constants {
        static let font: UIFont = .boldSystemFont(ofSize: 16)
    }
    
    // MARK: - UI
    
    private lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.font
        return label
    }()
        
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Publc methods
    
    func configure(with viewModel: LanguageCellViewModel) {
        languageLabel.text = viewModel.name
    }
    
    // MARK: - Private methods
    
    private func setup() {
        addSubview(languageLabel)
        
        languageLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
