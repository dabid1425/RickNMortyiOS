//
//  CustomActivityIndicator.swift
//  RickNMorty
//
//  Created by Dan Abid on 6/9/23.
//

import UIKit

@IBDesignable
class CustomActivityIndicator: UIView {
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    private let imageView = UIImageView()

    @IBInspectable var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }

    var isAnimating: Bool {
        return activityIndicator.isAnimating
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(activityIndicator)
        addSubview(imageView)

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),

            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func startAnimating() {
        activityIndicator.startAnimating()
    }

    func stopAnimating() {
        activityIndicator.stopAnimating()
    }
}
