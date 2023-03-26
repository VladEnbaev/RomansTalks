//
//  AdditionalInfoViewController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 26.03.2023.
//

import UIKit

protocol AdditionalInfoViewProtocol : AnyObject{
    var presenter : RegistrationPresenterProtocol! { get set }
}


class AdditionalInfoViewController: BaseViewController {
    
    var presenter : AdditionalInfoPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension AdditionalInfoViewController : AdditionalInfoViewProtocol {
    
}
