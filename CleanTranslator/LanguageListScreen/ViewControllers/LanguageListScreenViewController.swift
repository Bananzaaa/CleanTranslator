//  LanguageListScreenViewController.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

protocol LanguageListScreenDisplayLogic: AnyObject {
    func setupScreen(_ viewModel: LanguageListScreenModels.Setup.ViewModel)
    func setSections(_ viewModel: LanguageListScreenModels.UpdateLanguageList.ViewModel)
    func updateScreen(_ viewModel: LanguageListScreenModels.UpdateScreen.ViewModel)
    func showLoading()
    func hideLoading()
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

        interactor.didLoad()
    }

    // MARK: - Public Methods
    
    func updateScreen(_ viewModel: LanguageListScreenModels.UpdateScreen.ViewModel) {
        title = viewModel.title
        mainView.update(with: viewModel)
    }
    
    func setupScreen(_ viewModel: LanguageListScreenModels.Setup.ViewModel) {
        title = viewModel.title
        mainView.setup(with: viewModel)
    }
    
    func setSections(_ viewModel: LanguageListScreenModels.UpdateLanguageList.ViewModel) {
        mainView.setSections(with: viewModel)
    }
    
    func showLoading() {
        mainView.showLoading()
    }
    
    func hideLoading() {
        mainView.hideLoading()
    }
}

extension LanguageListScreenViewController: LanguageListScreenViewDelegate {
    func nextButtonTapped() {
        interactor.didChooseLanguage()
    }
}

extension LanguageListScreenViewController: LanguageListManagerDelegate {
    func didSelectLanguage(_ languageCode: String) {
        interactor.didSelectLanguage(languageCode)
    }
}
