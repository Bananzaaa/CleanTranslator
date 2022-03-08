//  TranslationScreenViewController.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

protocol TranslationScreenDisplayLogic: AnyObject {
    func setup(with viewModel: TranslationScreenModels.Setup.ViewModel)
    func showTranslatedText(_ viewModel: TranslationScreenModels.Update.ViewModel)
    func showError(_ viewModel: TranslationScreenModels.Error.ViewModel)
}

final class TranslationScreenViewController: UIViewController, TranslationScreenDisplayLogic {

    // MARK: - Private Properties

    private let interactor: TranslationScreenBusinessLogic
    private let mainView: TranslationScreenView
    private let alertFactory: AlertFactory

    // MARK: - Init

    init(interactor: TranslationScreenBusinessLogic, alertFactory: AlertFactory) {
        self.interactor = interactor
        self.alertFactory = alertFactory
        mainView = TranslationScreenView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder _: NSCoder) {
        return nil
    }
    
    // MARK: - Lifecycle

    override func loadView() {
        view = mainView
        mainView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor.didLoad()
    }

    // MARK: - Public Methods
    
    func setup(with viewModel: TranslationScreenModels.Setup.ViewModel) {
        title = viewModel.title
        mainView.setup(viewModel)
    }
    
    func showTranslatedText(_ viewModel: TranslationScreenModels.Update.ViewModel) {
        mainView.showTranslation(viewModel)
    }
    
    func showError(_ viewModel: TranslationScreenModels.Error.ViewModel) {
        let alert = alertFactory.createErrorAlert(message: viewModel.message)
        present(alert, animated: true, completion: nil)
    }
}

extension TranslationScreenViewController: TranslationScreenViewDelegate {
    func translate(text: String) {
        interactor.didRequestTranslate(TranslationScreenModels.Update.Request(textToTranslate: text))
    }
}
