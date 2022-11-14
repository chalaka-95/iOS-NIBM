//
//  TableDemoViewController.swift
//  iOS-NIBM
//
//  Created by Chalaka Hasantha on 2022-11-14.
//

import UIKit
import Kingfisher

class TableDemoViewController: UIViewController {

    
    let data = ["Apple", "Google", "Facebook" , "HP", "Dell" , "Amazon" , "Ebay"]
    
    var movies : [Result] = [Result]()
    
    let tableView : UITableView  = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyCellView.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        setupContraint()
        
        downloadMovies()
        
    }
    
    func setupContraint(){
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    
    func downloadMovies(){
        let url = URL(string: "https://api.themoviedb.org/4/list/3?page=1&api_key=f9923821f549f034afb399cd27e37afd")!
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, res, error in
            
            if let movieData = data{
                let json = try? JSONDecoder().decode(MoviesModel.self, from: movieData)
                
                if let movies = json?.results {
                   
                    
                    self.movies = movies
                }
                
                DispatchQueue.main.async {
                        self.tableView.reloadData()
                }
               
            }
        }
        
        dataTask.resume()
    }

}

extension TableDemoViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let cell : MyCellView = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCellView
      //  cell.textLabel?.text = "Cell ID"
//        cell.myImage.image = UIImage(systemName: "highlighter")
//        cell.titleLabel.text = data[indexPath.row]
//        cell.descriptionLabel.text = "Description Label"
     
            cell.titleLabel.text = movies[indexPath.row].originalTitle
        
        
        
        let imageURL = "https://image.tmdb.org/t/p/w185" + movies[indexPath.row].posterPath
        if let url = URL(string: imageURL){
            cell.myImage.kf.setImage(with: url)
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieDetailsViewController()
        vc.selectedMovie = movies[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
//https://api.themoviedb.org/4/list/3?page=1&api_key=f9923821f549f034afb399cd27e37afd

//API Key f9923821f549f034afb399cd27e37afd

class MyCellView : UITableViewCell{
     
    let myImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    let baseView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        
        return view
    }()
    
    let labelHolder : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    let contentHolder : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layComponent()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layComponent(){
        labelHolder.addArrangedSubview(titleLabel)
        labelHolder.addArrangedSubview(descriptionLabel)
        contentHolder.addArrangedSubview(myImage)
        contentHolder.addArrangedSubview(labelHolder)
        baseView.addSubview(contentHolder)
        contentView.addSubview(baseView)
    }
    
   private func setupConstraint(){
       baseView.snp.makeConstraints { make in
           make.leading.top.equalToSuperview().offset(20)
           make.trailing.bottom.equalToSuperview().offset(-20)
       }
       
       myImage.snp.makeConstraints { make in
           make.height.equalTo(80)
           make.width.equalTo(80)
       }
    }
    
    
}
