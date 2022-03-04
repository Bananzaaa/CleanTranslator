//
//  LanguageListManager.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 27.02.2022.
//

import UIKit

protocol LanguageListManager: UITableViewDataSource, UITableViewDelegate {
    var delegate: LanguageListManagerDelegate? { get set }
    func updateSections(_ sections: [LanguageSectionModel])
}

protocol LanguageListManagerDelegate: AnyObject {
    func didSelectLanguage(_ languageCode: String)
}

final class MainLanguageListManager: NSObject, LanguageListManager {
    
    // MARK: - Public properties
    
    private(set) var sections: [LanguageSectionModel] = []
    weak var delegate: LanguageListManagerDelegate?
    
    // MARK: - Public methods
    
    func updateSections(_ sections: [LanguageSectionModel]) {
        self.sections = sections
    }
}

// MARK: - UITableViewDataSource

extension MainLanguageListManager: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let languageCell = tableView.dequeueReusableCell(LanguageTableViewCell.self)
        let viewModel = sections[indexPath.section].content[indexPath.row]
        languageCell.configure(with: viewModel)
        
        return languageCell
    }
}

// MARK: - UITableViewDelegate

extension MainLanguageListManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let languageCode = sections[indexPath.section].content[indexPath.row].languageCode
        delegate?.didSelectLanguage(languageCode)
    }
}
