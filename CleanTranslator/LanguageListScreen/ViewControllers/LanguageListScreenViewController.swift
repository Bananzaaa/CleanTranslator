//  LanguageListScreenViewController.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

protocol LanguageListScreenDisplayLogic: AnyObject {
    func setSections(_ viewModel: LanguageListScreenModels.UpdateLanguageList.ViewModel)
}

final class LanguageListScreenViewController: UIViewController, LanguageListScreenDisplayLogic {

    // MARK: - Private Properties

    private let interactor: LanguageListScreenBusinessLogic
    private let tableManager: LanguageListManager
    private let mainView: LanguageListScreenView

    // MARK: - Init

    init(
        interactor: LanguageListScreenBusinessLogic,
        tableManager: LanguageListManager) {
            
        self.interactor = interactor
        self.tableManager = tableManager
        mainView = LanguageListScreenView(tableManager: tableManager)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder _: NSCoder) {
        return nil
    }
    
    // MARK: - Lifecycle

    override func loadView() {
        view = mainView
        mainView.delegate = self
        tableManager.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Public Methods

    func setSections(_ viewModel: LanguageListScreenModels.UpdateLanguageList.ViewModel) {
        mainView.setSections(with: viewModel)
    }    
}

extension LanguageListScreenViewController: LanguageListScreenViewDelegate {
    
}

extension LanguageListScreenViewController: LanguageListManagerDelegate {
    func didSelectLanguage(_ languageCode: String) {
        interactor.didRequestSelectLanguage(LanguageListScreenModels.UpdateLanguageList.Request(
            languageCode: languageCode))
    }
}
