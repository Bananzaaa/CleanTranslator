//  TranslationScreenViewController.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

protocol TranslationScreenDisplayLogic: AnyObject {
    
}

final class TranslationScreenViewController: UIViewController, TranslationScreenDisplayLogic {
    
    // MARK: - Public Properties

    // MARK: - Private Properties

    private let interactor: TranslationScreenBusinessLogic
    private let mainView: TranslationScreenView

    // MARK: - Init

    init(interactor: TranslationScreenBusinessLogic) {
        self.interactor = interactor
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

    }

    // MARK: - Public Methods

    // MARK: - Private Methods
}

extension TranslationScreenViewController: TranslationScreenViewDelegate {
    func translate(text: String) {
        interactor.translate(text: text)
    }
}
