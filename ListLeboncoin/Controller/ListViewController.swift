//
//  ListViewController.swift
//  ListLeboncoin
//
//  Created by Sylla on 30/04/2022.
//

import UIKit

class ListViewController: UIViewController {

    private var ads: [Ads]?
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "List of annonce"
        view.backgroundColor = .systemBackground
        
        collectionView?.reloadData()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-4,
                                 height: (view.frame.size.width/2)-4)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(AdsCollectionViewCell.self, forCellWithReuseIdentifier: AdsCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        callAPi()
    }
    func callAPi(){
        CallApiDataService.shared.getAnnonce {[weak self] result in
            switch result{
            case .success(let annonce):
                
                self?.ads = annonce
                print("success: \(annonce?.count ?? 0)")
                
                DispatchQueue.main.async {
                    self?.collectionView?.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segueToDescription" else{
            return
        }
        guard let segue = segue.destination as? DescriptionViewController else{
            return
        }
        segue.ads = ads
    }
}



extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ads?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdsCollectionViewCell.identifier, for: indexPath) as! AdsCollectionViewCell
        
        
        
        let ads = ads?[indexPath.row]
        
       // let ids = id?[indexPath.row]
        
        cell.configure(label: "", label2: ads?.title ?? "",label3: ads?.price ?? 0, image: ads?.images_url.small ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ads = ads?[indexPath.row]
        performSegue(withIdentifier: "segueToDescription", sender: nil)
    }
    
    
}
