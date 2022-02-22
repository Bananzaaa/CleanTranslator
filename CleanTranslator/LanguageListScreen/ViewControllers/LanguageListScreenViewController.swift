//  LanguageListScreenViewController.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

protocol LanguageListScreenDisplayLogic: AnyObject {}

final class LanguageListScreenViewController: UIViewController, LanguageListScreenDisplayLogic {
    
    // MARK: - Public Properties

    // MARK: - Private Properties

    private let interactor: LanguageListScreenBusinessLogic
    private let mainView: LanguageListScreenView

    // MARK: - Init

    init(interactor: LanguageListScreenBusinessLogic) {
        self.interactor = interactor
        mainView = LanguageListScreenView()
        
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

    }

    // MARK: - Public Methods

    // MARK: - Private Methods
}

extension LanguageListScreenViewController: LanguageListScreenViewDelegate {

}
