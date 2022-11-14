//
//  MovieDetailsViewController.swift
//  iOS-NIBM
//
//  Created by Chalaka Hasantha on 2022-11-14.
//

import UIKit
import SnapKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    var selectedMovie : Result?
    
    let poster : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let overviewLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    let releaseDateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .blue
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupConstraint()
        loadContent()
    }
    
    func setupConstraint(){
        self.view.addSubview(poster)
        poster.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(400)
            make.leading.trailing.equalToSuperview()
        }
        
        let holder = UIStackView(arrangedSubviews: [titleLabel, releaseDateLabel, overviewLabel])
        holder.spacing = 10
        holder.axis  = .vertical
        self.view.addSubview(holder)
        
        holder.snp.makeConstraints { make in
            make.top.equalTo(poster.snp_bottomMargin).offset(40)
            make.leading.equalTo(view.snp_leadingMargin).offset(20)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-20)
        }
        
        
    }
    
    func loadContent(){
        if let movie = selectedMovie {
            let imageLink = "https://image.tmdb.org/t/p/w185" + movie.backdropPath
            if let imageURL = URL(string: imageLink){
                poster.kf.setImage(with: imageURL)
            }
            
            
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.releaseDate
            overviewLabel.text = movie.overview
            
        }
    }
    
}
