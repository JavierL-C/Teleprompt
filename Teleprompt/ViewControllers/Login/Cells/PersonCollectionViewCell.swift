//
//  PersonCollectionViewCell.swift
//  Teleprompt
//
//  Created by Javier Lumbi on 27/7/23.
//

import UIKit

final class PersonCollectionViewCell: UICollectionViewCell {
    
    private let peopleGroupStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.isUserInteractionEnabled = false
        peopleGroupStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(peopleGroupStackView)
        NSLayoutConstraint.activate([
            peopleGroupStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            peopleGroupStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            peopleGroupStackView.topAnchor.constraint(equalTo: topAnchor),
            peopleGroupStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func getPersonImage(with imageName: String) -> UIImageView {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
    
    public func configure(with group: PeopleGroup) {
        guard peopleGroupStackView.arrangedSubviews.isEmpty else { return }
        group.getPeopleGroup().forEach {
            let personImage = getPersonImage(with: $0.imageName)
            peopleGroupStackView.addArrangedSubview(personImage)
        }
    }
    
    public func configure(with group: PeopleGroup, customView getCustomView:(() -> UIView)) {
        guard peopleGroupStackView.arrangedSubviews.isEmpty else { return }
        peopleGroupStackView.distribution = .fill
    
        var peopleGroup = group.getPeopleGroup()
        peopleGroup.removeLast()
        let inTheMiddle = peopleGroup.count / 2

        peopleGroup.enumerated().forEach { numberOfPeople, person in
            if inTheMiddle == numberOfPeople {
                let continerView = UIView()
                let customView = getCustomView()
                continerView.translatesAutoresizingMaskIntoConstraints = false
                customView.translatesAutoresizingMaskIntoConstraints = false
                
                continerView.addSubview(customView)
                peopleGroupStackView.addArrangedSubview(continerView)
                
                NSLayoutConstraint.activate([
                    customView.centerYAnchor.constraint(equalTo: continerView.centerYAnchor),
                    customView.centerXAnchor.constraint(equalTo: continerView.centerXAnchor),
                    customView.heightAnchor.constraint(equalTo: self.peopleGroupStackView.heightAnchor, multiplier: 0.4),
                    customView.widthAnchor.constraint(equalTo: self.peopleGroupStackView.widthAnchor, multiplier: 0.4),
                ])
            } else {
                let personImage = getPersonImage(with: person.imageName)
                personImage.translatesAutoresizingMaskIntoConstraints = false
                peopleGroupStackView.addArrangedSubview(personImage)
                personImage.widthAnchor.constraint(equalTo: self.peopleGroupStackView.widthAnchor, multiplier: 0.25).isActive = true
            }
        }
    }
}

