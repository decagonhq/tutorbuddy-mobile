//
//  BaseViewModel.swift
//  TutorBuddy
//
import Foundation
import RxSwift

class BaseViewModel: IBaseViewModel {
    
    let disposeBag = DisposeBag()
    
    let isLoading: PublishSubject<LoaderConfig> = PublishSubject()
    
    let alertMessage: PublishSubject<AlertMessage> = PublishSubject()
    
    let isLoadingOnBottomSheet: PublishSubject<LoaderConfig> = PublishSubject()
    
    let alertMessageOnBottomSheet: PublishSubject<AlertMessage> = PublishSubject()
    
    let isLoadingOnDialog: PublishSubject<LoaderConfig> = PublishSubject()
    
    let alertMessageOnDialog: PublishSubject<AlertMessage> = PublishSubject()
    
    func didLoad() {}
    
    func willAppear() {}
    
    func didAppear() {}
    
    func willDisappear() {}
    
    func didDisappear() {}
    
    func showLoading(_ shouldShow: Bool = true, viewControllerType: ViewControllerType = .normal, loaderType: LoaderType = .fullScreen) {
        switch viewControllerType {
        case .normal:
            isLoading.onNext(LoaderConfig(show: shouldShow, type: loaderType))
        case .bottomSheet:
            isLoadingOnBottomSheet.onNext(LoaderConfig(show: shouldShow, type: loaderType))
        case .dialog:
            isLoadingOnDialog.onNext(LoaderConfig(show: shouldShow, type: loaderType))
        }
    }
    
    func showMessage(_ message: String, type: ToastType = .success, viewControllerType: ViewControllerType = .normal) {
        switch viewControllerType {
        case .normal:
            alertMessage.onNext(AlertMessage(message: message, type: type))
        case .bottomSheet:
            alertMessageOnBottomSheet.onNext(AlertMessage(message: message, type: type))
        case .dialog:
            alertMessageOnDialog.onNext(AlertMessage(message: message, type: type))
        }
    }
    
    func subscribe<T>(_ observable: Observable<T>, showLoadingAnimation: Bool = true, viewControllerType: ViewControllerType = .normal, loaderType: LoaderType = .horizontalLine, showMessageAlerts: Bool = true, errorMessage: String? = nil, success: ((T) -> Void)? = nil, noDataHandler: NoParamHandler? = nil, error: ((Error) -> Void)? = nil) {
        showLoading(showLoadingAnimation, viewControllerType: viewControllerType, loaderType: loaderType)
        observable.subscribe(onNext: { [weak self] response in
            self?.showLoading(false, viewControllerType: viewControllerType, loaderType: loaderType)
            if let error = response as? TBError, let _error = response as? _TBError {
                if showMessageAlerts {
                    let isSuccessful = error.success ?? false
                    let resMessage = error.message.orEmpty
                    let message = error.message.isNil ? _error.title : /*"\(isSuccessful)" + ". " + */resMessage
                    if /*!isSuccessful && error?.data == nil*/ message?.isEmpty == false {
                        self?.showMessage((message ?? errorMessage) ?? "An error occurred, please try again.", type: .error, viewControllerType: viewControllerType)
                    }
                }
            } else {
                success?(response)
            }
            noDataHandler?()
            
        }, onError: { [weak self] err in
            self?.showLoading(false, viewControllerType: viewControllerType, loaderType: loaderType)
            if showMessageAlerts {
                let error = err as? TBError
                let _error = err as? _TBError
                let isSuccessful = error?.success ?? false
                let resMessage = error?.message.orEmpty
                let message = error.isNil ? _error?.title : /*"\(isSuccessful)" + ". " + */((resMessage ?? errorMessage) ?? err.localizedDescription)
                if /*!isSuccessful && error?.data == nil*/ message?.isEmpty == false {
                    self?.showMessage(message ?? err.localizedDescription, type: .error, viewControllerType: viewControllerType)
                }
            }

            error?(err)
            
        }).disposed(by: disposeBag)
    }
    
}
