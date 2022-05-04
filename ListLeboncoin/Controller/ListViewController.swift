//
//  ListViewController.swift
//  ListLeboncoin
//
//  Created by Sylla on 30/04/2022.
//

import UIKit

class ListViewController: UIViewController {

    private var ads: [Ads]?
    var ids: [ID]?
    var idList : ID?
    var adsList : Ads?
    var changeLink: String?
    var categorie: String?
    private let searchController = UISearchController()
    private var collectionView: UICollectionView?
    
    func initSearchController(){
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["all","Véhicule","Mode","Bricolage","Maison","Loisir","Immobillier","Livre/CD/DVD","Multimedia","Services","Animaux","Enfants"]
        searchController.searchBar.delegate = self
    }
    
    
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
        callAPiID()
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
    func callAPiID(){
        CallApiDataService.shared.getID {[weak self] result in
            DispatchQueue.main.async {
                switch result{
                case .success(let id):
                    
                    self?.ids = id
                    print("success: \(id?.count ?? 0)")
                    
                    DispatchQueue.main.async {
                        self?.collectionView?.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
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
        segue.ads = adsList
        segue.ids = idList
    }
}



extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ads?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdsCollectionViewCell.identifier, for: indexPath) as! AdsCollectionViewCell
        
        
        
        let ads = ads?[indexPath.row]
        //let id2 = ids?[indexPath.row]
        
        guard let name = ads?.category_id else{
            return UICollectionViewCell()
        }
        
        switch name {
        case 1:
            categorie = "Véhicule"
        case 2:
            categorie = "Mode"
        case 3:
            categorie = "bricolage"
        case 4:
            categorie = "Maison"
        case 5:
            categorie = "Loisirs"
        case 6:
            categorie = "Immobilier"
        case 7:
            categorie = "Livres/CD/DVD"
        case 8:
            categorie = "Multimedia"
        case 9:
            categorie = "Service"
        case 10:
            categorie = "Animaux"
        case 11:
            categorie = "Enfants"
        default:
            categorie = ""
            
            
        }
        
        cell.configure(label: categorie ?? "", label2: ads?.title ?? "",label3: ads?.price ?? 0, image: ads?.images_url.small ?? "")
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ads = ads?[indexPath.row]
        let id = ids?[indexPath.row]
        self.adsList = ads
        self.idList = id
        
        performSegue(withIdentifier: "segueToDescription", sender: nil)
    }
    
    
}

extension ListViewController: UISearchBarDelegate,UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        <#code#>
    }
    
    
}
