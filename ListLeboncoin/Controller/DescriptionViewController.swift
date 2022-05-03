//
//  DescriptionViewController.swift
//  ListLeboncoin
//
//  Created by Sylla on 30/04/2022.
//

import UIKit

class DescriptionViewController: UIViewController {

    var ads: [Ads]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let safeArea = view.layoutMarginsGuide
    
        view.addSubview(leboncoinImage)
        view.addSubview(idLabel)
        view.addSubview(idLabel2)
        view.addSubview(categoryLabel)
        view.addSubview(categoryLabel2)
        view.addSubview(titleLabel)
        view.addSubview(titleLabel2)
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionLabel2)
        view.addSubview(urgenLabel)
        view.addSubview(urgenLabel2)
        view.addSubview(priceLabel)
        view.addSubview(priceLabel2)
        // this enables autolayout for our imageView
        setupLayout()
        
        // Do any additional setup after loading the view.
    }
    
    private let idLabel: UILabel =  {
        let label = UILabel()
        label.text = "ID"
        label.backgroundColor = .cyan
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let idLabel2: UILabel =  {
        let label = UILabel()
        label.text = "String(ads?.first?.id)"
        label.backgroundColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.backgroundColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let categoryLabel2: UILabel = {
        let label = UILabel()
        label.text = "ads?.first?.title"
        label.backgroundColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.backgroundColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    private let titleLabel2: UILabel = {
        let label = UILabel()
        label.text = "Title2"
        label.backgroundColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.backgroundColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let descriptionLabel2: UITextView = {
        let label = UITextView()
        label.text = "Description"
        label.backgroundColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.backgroundColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let priceLabel2: UILabel = {
        let label = UILabel()
        label.text = "price2"
        label.backgroundColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let urgenLabel: UILabel = {
        let label = UILabel()
        label.text = "urgent"
        label.backgroundColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let urgenLabel2: UILabel = {
        let label = UILabel()
        label.text = "urgent"
        label.backgroundColor = .yellow
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let leboncoinImage: UIImageView = {
        let image = UIImage(named: "Leboncoin")
        let imageView = UIImageView(image: image!)
        
        return imageView
    }()
    
    func setupLayout(){
        //image
        leboncoinImage.translatesAutoresizingMaskIntoConstraints = false
        leboncoinImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        leboncoinImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        //imageView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        leboncoinImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        leboncoinImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // id
        
        //idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        idLabel.centerYAnchor.constraint(equalTo: leboncoinImage.bottomAnchor, constant: 50).isActive = true
        //idLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100).isActive = true
        idLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        //idLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 100).isActive = true
        idLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        idLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ///2
        idLabel2.leftAnchor.constraint(equalTo: idLabel.rightAnchor, constant: 20).isActive = true
        idLabel2.centerYAnchor.constraint(equalTo: leboncoinImage.bottomAnchor, constant: 50).isActive = true
        idLabel2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        idLabel2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        idLabel2.text = ads?.first?.title
        
        // category
        
        //idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 10).isActive = true
        //idLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        //idLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 100).isActive = true
        categoryLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ///2
        categoryLabel2.leftAnchor.constraint(equalTo: categoryLabel.rightAnchor, constant: 20).isActive = true
        categoryLabel2.centerYAnchor.constraint(equalTo: idLabel2.bottomAnchor, constant: 10).isActive = true
        categoryLabel2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        categoryLabel2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Title
        
        //idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 10).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
    
        titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //2
        titleLabel2.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 20).isActive = true
        titleLabel2.centerYAnchor.constraint(equalTo: categoryLabel2.bottomAnchor, constant: 10).isActive = true
        titleLabel2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Price
        
        //idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //2
        priceLabel2.leftAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: 20).isActive = true
        priceLabel2.centerYAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 10).isActive = true
        priceLabel2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        priceLabel2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Price
        
        //idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        urgenLabel.centerYAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        urgenLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        urgenLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        urgenLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //2
        urgenLabel2.leftAnchor.constraint(equalTo: urgenLabel.rightAnchor, constant: 20).isActive = true
        urgenLabel2.centerYAnchor.constraint(equalTo: priceLabel2.bottomAnchor, constant: 10).isActive = true
        urgenLabel2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        urgenLabel2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Description
        
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: urgenLabel.bottomAnchor, constant: 70).isActive = true
        //descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //2
        //descriptionLabel2.leftAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 20).isActive = true
        descriptionLabel2.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50).isActive = true
        //descriptionLabel2.centerYAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        //descriptionLabel2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        //descriptionLabel2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        descriptionLabel2.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionLabel2.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionLabel2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
    }
    
    
    

    

    

}
