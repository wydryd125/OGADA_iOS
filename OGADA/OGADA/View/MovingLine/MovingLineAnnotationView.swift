//
//  MovingLineAnnotationView.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/13.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit
import MapKit


class MovingLineAnnotationView: MKMarkerAnnotationView {

    static let identifier = "MovingLineAnnotationView"

    private let imageView = UIImageView()

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        setUI()
        setConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setConstraint() {
        imageView.bottomAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func configure(index: Int, visit: Bool, title: String, address: String) {
        let number = index < 10 ? "0\(index)": "\(index)"
        let image = UIImage(systemName: "\(number).circle.fill")
        imageView.image = image
        imageView.tintColor = visit ? UIColor.positive: UIColor.negative
        largeContentTitle = title
        largeContentImage = UIImage(systemName: "plus")
        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print(#function)
    }

}


class AnnotationSubView: UIView {
    
}
