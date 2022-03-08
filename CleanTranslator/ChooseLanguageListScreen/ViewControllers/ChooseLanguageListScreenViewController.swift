//  ChooseLanguageListScreenViewController.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

import UIKit

protocol ChooseLanguageListScreenDisplayLogic: AnyObject {
    func setupScreen(_ viewModel: ChooseLanguageListScreenModels.Setup.ViewModel)
    func updateScreen(_ viewModel: ChooseLanguageListScreenModels.UpdateScreen.ViewModel)
    func showLoading()
    func hideLoading()
}

final class ChooseLanguageListScreenViewController: UIViewController, ChooseLanguageListScreenDisplayLogic {
    
    // MARK: - Private Properties

    private let interactor: ChooseLanguageListScreenBusinessLogic
    private let mainView: ChooseLanguageListScreenView
    private let contentViewController: UIViewController

    // MARK: - Init

    init(
        interactor: ChooseLanguageListScreenBusinessLogic,
        contentViewController: UIViewController) {
            
        self.interactor = interactor
        self.contentViewController = contentViewController
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
    
    func showLoading() {
        mainView.showLoading()
    }
    
    func hideLoading() {
        mainView.hideLoading()
    }

    // MARK: - Private Methods
}

extension ChooseLanguageListScreenViewController: ChooseLanguageListScreenViewDelegate {
    func nextButtonTapped() {
        interactor.didRequestChooseLanguage()
    }
}
