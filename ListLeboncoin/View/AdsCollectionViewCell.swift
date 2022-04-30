//
//  AdsCollectionViewCell.swift
//  ListLeboncoin
//
//  Created by Sylla on 30/04/2022.
//

import UIKit

class AdsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AnnonceCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imageView =  UIImageView()
        imageView.backgroundColor = .yellow
        imageView.image = UIImage(systemName: "house")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.textAlignment = .center
        label.text = "Custom"
        return label
    }()
    
    private let myLabel2: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.textAlignment = .center
        label.text = "Custom2"
        return label
    }()
    
    private let myLabel3: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cyan
        label.textAlignment = .center
        label.text = "Custom3"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel2)
        contentView.addSubview(myLabel3)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myLabel.frame = CGRect(x: 5, y: contentView.frame.size.height-60, width: contentView.frame.size.width-10, height: 20)
        myLabel2.frame = CGRect(x: 5, y: contentView.frame.size.height-40, width: contentView.frame.size.width-10, height: 20)
        myLabel3.frame = CGRect(x: 5, y: contentView.frame.size.height-20, width: contentView.frame.size.width-10, height: 20)
        
        myImageView.frame = CGRect(x: 5, y: contentView.frame.size.height-70, width: contentView.frame.size.width-10, height: -100)
        
        
        
    }
    
    public func configure(label: String, label2: String, label3: Float, image: String) {
        
        guard let url = URL(string: image) else {return}
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else{return}
            DispatchQueue.main.async {
                self.myImageView.image = UIImage(data: data)
            }
        }
        myLabel.text = label
        myLabel2.text = label2
        myLabel3.text = String(label3)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
    }
}
