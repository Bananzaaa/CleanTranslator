//  ChooseLanguageListScreenViewController.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

import UIKit

//sourcery: AutoMockable
protocol ChooseLanguageListScreenDisplayLogic: AnyObject {
    func setupScreen(_ viewModel: ChooseLanguageListScreenModels.Setup.ViewModel)
    func updateScreen(_ viewModel: ChooseLanguageListScreenModels.UpdateScreen.ViewModel)
    func displayLoading()
    func hideLoading()
    func displayError(_ viewModel: ChooseLanguageListScreenModels.Error.ViewModel)
}

final class ChooseLanguageListScreenViewController: UIViewController, ChooseLanguageListScreenDisplayLogic {
    
    // MARK: - Private Properties

    private let interactor: ChooseLanguageListScreenBusinessLogic
    private let mainView: ChooseLanguageListScreenView
    private let contentViewController: UIViewController
    private let alertFactory: AlertFactory

    // MARK: - Init

    init(
        interactor: ChooseLanguageListScreenBusinessLogic,
        contentViewController: UIViewController,
        alertFactory: AlertFactory) {
            
        self.interactor = interactor
        self.contentViewController = contentViewController
        self.alertFactory = alertFactory
        mainView = ChooseLanguageListScreenView()
        
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

        addChildViewController(contentViewController, to: mainView.contentView)
        interactor.didLoad()
    }

    // MARK: - Public Methods
    
    func updateScreen(_ viewModel: ChooseLanguageListScreenModels.UpdateScreen.ViewModel) {
        title = viewModel.title
        mainView.update(with: viewModel)
    }
    
    func setupScreen(_ viewModel: ChooseLanguageListScreenModels.Setup.ViewModel) {
        title = viewModel.title
        mainView.setup(with: viewModel)
    }
    
    func displayLoading() {
        mainView.showLoading()
    }
    
    func hideLoading() {
        mainView.hideLoading()
    }
    
    func displayError(_ viewModel: ChooseLanguageListScreenModels.Error.ViewModel) {
        let alert = alertFactory.createErrorAlert(message: viewModel.message)
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Private Methods
}

extension ChooseLanguageListScreenViewController: ChooseLanguageListScreenViewDelegate {
    func nextButtonTapped() {
        interactor.didRequestChooseLanguage()
    }
}
