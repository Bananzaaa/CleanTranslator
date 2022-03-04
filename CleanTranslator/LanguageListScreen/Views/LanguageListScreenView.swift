//  LanguageListScreenView.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit
import SnapKit

protocol LanguageListScreenViewDelegate: AnyObject {
    func nextButtonTapped()
}

final class LanguageListScreenView: UIView {
    
    // MARK: - Constants

    private enum Constants {
        static let cornerRadius: CGFloat = 8
        static let buttonHeight: CGFloat = 54
        static let horizontalOffset: CGFloat = 16
    }
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.separatorStyle = .none
        return tableView
    }()
    
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
    
    // MARK: - Private properties
    
    private let tableManager: LanguageListManager

    // MARK: - Public Properties

    weak var delegate: LanguageListScreenViewDelegate?

    // MARK: - Init

    init(tableManager: LanguageListManager) {
        self.tableManager = tableManager
        
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public properties
    
    func setup(with viewModel: LanguageListScreenModels.Setup.ViewModel) {
        nextButton.setTitle(viewModel.buttonTitle, for: .normal)
        nextButton.isEnabled = viewModel.isEnabledNextButton
    }
    
    func setSections(with viewModel: LanguageListScreenModels.UpdateLanguageList.ViewModel) {
        tableManager.updateSections(viewModel.sections)
        updateTable()
    }
    
    func update(with viewModel: LanguageListScreenModels.UpdateScreen.ViewModel) {
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
        addSubview(tableView)
        addSubview(nextButton)
        addSubview(spinner)

        nextButton.snp.makeConstraints { make in
            make.height.equalTo(Constants.buttonHeight)
            make.leading.equalToSuperview().offset(Constants.horizontalOffset)
            make.trailing.equalToSuperview().inset(Constants.horizontalOffset)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(Constants.horizontalOffset)
            make.trailing.equalToSuperview().inset(Constants.horizontalOffset)
            make.bottom.equalTo(nextButton.snp.top)
        }
        
        spinner.snp.makeConstraints { make in
            make.center.equalTo(tableView)
        }
        
        tableView.register(LanguageTableViewCell.self)
        tableView.delegate = tableManager
        tableView.dataSource = tableManager
    }

    private func updateTable() {
        tableView.reloadData()
    }
    
    // MARK: - Actions
    
    @objc private func actionChooseLanguage() {
        delegate?.nextButtonTapped()
    }
}
