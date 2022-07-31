//
//  HomeView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 27/07/2022.
//

import UIKit

class HomeView: BaseScrollView {
    
    fileprivate let whatWouldYouLikeToLearnTodayLabel = UILabel(text: .WHAT_WOULD_YOU_LIKE_TO_LEARN_TODAY, font: .interExtraBold(size: 25), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let searchBar = UISearchBar(placeholder: .SEARCH, showsCancelButton: false).apply {
        $0.updateAppearance(height: 45, radius: 5, backgroundColor: .clear, borderWidth: 1, borderColor: .primaryTextColor.withAlphaComponent(0.7))
    }
    
    
    
    
    
    override func setup() {
        super.setup()
        setBackgroundColor(.clear)
        whatWouldYouLikeToLearnTodayLabel.do {
            _addSubview($0)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(leftRight: 20))
        }
        
        searchBar.do {
            _addSubview($0)
            $0.anchor(top: whatWouldYouLikeToLearnTodayLabel.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 20, left: 20, right: 20))
        }
        
    }
    
}
