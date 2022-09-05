//
//  CourseImageView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 04/09/2022.
//

import UIKit

final class CourseImageView: BaseView {

    let imageView = UIImageView(image: R.image.python_banner(), contentMode: .scaleAspectFill, tintColor: .white)
    
    override func setup() {
        super.setup()
        setBackgroundColor(.black)
        with(imageView) {
            addSubview($0)
            $0.fillSuperview()
        }
    }
    
    convenience init(placeholderImage: UIImage? = R.image.python_banner(), imageURL: String? = nil) {
        self.init(frame: .zero)
        setup()
        imageView.image = placeholderImage
        if let imageURL = imageURL {
            imageView.setImageFromURL(url: imageURL, placeholderImage: placeholderImage)
        }
    }
}
