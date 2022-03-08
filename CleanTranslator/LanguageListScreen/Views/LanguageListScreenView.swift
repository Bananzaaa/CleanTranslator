//  LanguageListScreenView.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit
import SnapKit

protocol LanguageListScreenViewDelegate: AnyObject {}

final class LanguageListScreenView: UIView {
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.separatorStyle = .none
        return tableView
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

    func setSections(with viewModel: LanguageListScreenModels.UpdateLanguageList.ViewModel) {
        tableManager.updateSections(viewModel.sections)
        updateTable()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.register(LanguageTableViewCell.self)
        tableView.delegate = tableManager
        tableView.dataSource = tableManager
    }

    private func updateTable() {
        tableView.reloadData()
    }
}
