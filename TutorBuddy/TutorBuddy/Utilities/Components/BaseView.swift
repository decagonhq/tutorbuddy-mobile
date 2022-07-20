//
//  BaseView.swift
//  TutorBuddy
//

import UIKit
import RxSwift

open class BaseView: UIView {
    
    let disposeBag = DisposeBag()
    var preference = PreferenceImpl()
    var viewMessage = PublishSubject<AlertMessage>()

    open func setup() {
        backgroundColor = .appBackground // .aSystemBackground
    }
    
    open func layout() {}
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
