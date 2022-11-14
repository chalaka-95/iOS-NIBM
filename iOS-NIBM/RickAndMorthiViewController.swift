//
//  RickAndMorthiViewController.swift
//  iOS-NIBM
//
//  Created by Chalaka Hasantha on 2022-11-14.
//

import UIKit
import SnapKit
import Kingfisher

class RickAndMorthiViewController: UIViewController {
    
    var characterData : [SingleItem] = []
    
    var collection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RickAndMorthiCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        downloadData()
        setupUI()
    }
    
    func downloadData(){
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data{
                let rickandmoviedata = try? JSONDecoder().decode(RickAndMothiData.self, from: data)
                if let results = rickandmoviedata?.results{
                    self.characterData = results
                    
                    DispatchQueue.main.async {
                        self.collection.reloadData()
                    }
                    
                }
            }
        }
        task.resume()
    }
    
    func setupUI(){
        
        collection.dataSource = self
        collection.delegate = self
        self.view.addSubview(collection)
        
        collection.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
        }
    }
    
}

extension RickAndMorthiViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : RickAndMorthiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RickAndMorthiCell
        cell.rickImageView.kf.setImage(with: URL(string: characterData[indexPath.row].image))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterData.count
    }
}

class RickAndMorthiCell : UICollectionViewCell {
    
    let rickImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(rickImageView)
        
        rickImageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
