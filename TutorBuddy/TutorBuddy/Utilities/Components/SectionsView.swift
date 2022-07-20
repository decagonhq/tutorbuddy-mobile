//
//  SectionsView.swift
//  TutorBuddy
//

import UIKit

final class SectionsView: BaseView {

    fileprivate var sections = [String]()
    var sectionViews = [UnderlineSectionView]()
    var selectionHandler: StringParamHandler?
    
    convenience init(sections: [String]) {
        self.init(frame: .zero)
        self.sections = sections
        setup()
    }
    
    override func setup() {
        super.setup()
        setBackgroundColor(UIColor("#FBF6EB"))
        
        sectionViews = sections.enumerated().map { section in
            UnderlineSectionView(title: section.element, state: section.offset == 0 ? .active : .inactive).apply {
                $0.animateViewOnTapGesture { [weak self] in
                    self?.handleSectionSelected(for: section.element)
                }
            }
        }
        
        let contentStackView = HorizontalStackView(arrangedSubviews: sectionViews, spacing: 15, distribution: .fillProportionally)
        
        with(contentStackView) {
            addSubview($0)
            $0.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: ._init(top: 15, left: 20, right: 20))
        }
    }
    
    fileprivate func handleSectionSelected(for section: String) {
        setActiveSection(to: section)
        selectionHandler?(section)
    }
    
    func setActiveSection(to section: String) {
        sectionViews.first { $0.title == section }?.updateView(state: .active)
        sectionViews.filter { $0.title != section }.forEach { $0.updateView(state: .inactive) }
    }

}
