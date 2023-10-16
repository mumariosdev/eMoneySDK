//
//  CaptureIdentityInfoRouter.swift
//  e&money
//
//  Created by Shujaat Ali Khan on 15/04/2023.
//  
//

import Foundation
import UIKit

class CaptureIdentityInfoRouter {

    enum Route {
        case eidScanScreen
        case livenessCheck
    }
    
    // MARK: Properties

    weak var view: UIViewController?

    
    // MARK: Static methods

    static func setupModule() -> CaptureIdentityInfoViewController {
        let viewController = CaptureIdentityInfoViewController.instantiate(fromAppStoryboard: .CaptureIdentityInfo)
        let presenter = CaptureIdentityInfoPresenter()
        let router = CaptureIdentityInfoRouter()
        let interactor = CaptureIdentityInfoInteractor()
        
        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension CaptureIdentityInfoRouter: CaptureIdentityInfoRouterProtocol {
    // Implement Routing methods
    
    func go(to route: Route) {
        switch route {
        case .eidScanScreen:
            let viewController = EidScannerViewController.instantiate(fromAppStoryboard: .MDRModule)
            //viewController.popToViewController = self.popToViewController
            viewController.updateType = (view as? CaptureIdentityInfoViewController)?.updateType
            view?.navigationController?.pushViewController(viewController, animated: true)
            break
        case .livenessCheck:
            let vc = SelfiPreviewViewController.instantiate(fromAppStoryboard: .Liveness)
            vc.updateType = (view as? CaptureIdentityInfoViewController)?.updateType
            view?.navigationController?.pushViewController(vc, animated: true)
            break
        }
    }
}
