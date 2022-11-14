//
//  ViewController.swift
//  iOS-NIBM
//
//  Created by Chalaka Hasantha on 2022-11-13.
//

import UIKit

class ViewController: UIViewController {

    
    let logoImage : UIImageView = {
       let image = UIImageView(image: UIImage(named: "logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let titleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let descriptionLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.textColor = .blue
        return label
    }()
    
    let dateLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.textColor = .blue
        return label
    }()
    
    
    let viewHolder : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let viewHolderMain : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        titleLabel.text = "iOS Development"
        descriptionLabel.text = "Swift and SwiftUI"
        dateLabel.text = "22/10/2022"
        
        viewHolder.insertArrangedSubview(titleLabel, at: 0)
        viewHolder.insertArrangedSubview(descriptionLabel, at: 1)
        viewHolder.insertArrangedSubview(dateLabel, at: 2)
        viewHolderMain.insertArrangedSubview(logoImage, at: 0)
        viewHolderMain.insertArrangedSubview(viewHolder, at: 1)
        
        view.addSubview(viewHolderMain)
        
        setupConstraint()
        
    }
    
    func setupConstraint(){
//        view1.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        view1.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        view1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        view1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
//        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
//        logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        logoImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
//
//
//        titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        logoImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        viewHolderMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        viewHolderMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        viewHolderMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
    }
    
   


}



