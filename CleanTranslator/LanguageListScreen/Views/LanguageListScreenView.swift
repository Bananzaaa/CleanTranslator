//  LanguageListScreenView.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit
import SnapKit

protocol LanguageListScreenViewDelegate: AnyObject {
    
}

final class LanguageListScreenView: UIView {
    
    // MARK: - Constants

    fileprivate enum Constants {
        
    }

    // MARK: - Public Properties

    weak var delegate: LanguageListScreenViewDelegate?

    // MARK: - Private Properties

    // MARK: - Init

    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func setup() {
        
    }
}
