//
//  ListViewController.swift
//  ListLeboncoin
//
//  Created by Sylla on 30/04/2022.
//

import UIKit

class ListViewController: UIViewController,UISearchBarDelegate,UISearchResultsUpdating {

    private var ads: [Ads]?
    var ids: [ID]?
    var idList : ID?
    var adsList : Ads?
    var cate :String?
    private let searchController = UISearchController()
    private var collectionView: UICollectionView?
    var filterSearch = [Ads]()
    
    
    
    func initSearchController(){
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["All","Véhicule","Mode","Bricolage","Maison","Loisir","Immobillier","Livre/CD/DVD","Multimedia","Services","Animaux","Enfants"]
        //["1","2","3","4","5","6","7","8","9","10","11","12"]
        searchController.searchBar.delegate = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        title = "List of annonce"
        view.backgroundColor = .systemBackground
         */
        initSearchController()
        
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
        collectionView.backgroundColor = .orange
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
    }
}



extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (searchController.isActive){
            return filterSearch.count
        }
        return ads?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdsCollectionViewCell.identifier, for: indexPath) as! AdsCollectionViewCell
        
        let thisAds: Ads?
        
        if(searchController.isActive){
            thisAds = filterSearch[indexPath.row]
        }else{
            thisAds = ads?[indexPath.row]
        }
        
        
        guard let name = thisAds?.category_id else{
            return UICollectionViewCell()
        }
        
        
        switch name {
        case 1:
            cell.myLabel.text = ids?.first?.name
            
        case 2:
            cell.myLabel.text = ids?[1].name
        case 3:
            cell.myLabel.text = ids?[2].name
        case 4:
            cell.myLabel.text = ids?[3].name
        case 5:
            cell.myLabel.text = ids?[4].name
        case 6:
            cell.myLabel.text = ids?[5].name
        case 7:
            cell.myLabel.text = ids?[6].name
        case 8:
            cell.myLabel.text = ids?[7].name
        case 9:
            cell.myLabel.text = ids?[8].name
        case 10:
            cell.myLabel.text = ids?[9].name
        case 11:
            cell.myLabel.text = ids?[10].name
        default:
            cell.myLabel.text = ""
            
            
        }
        
    
        if thisAds?.is_urgent == true {
            cell.urgentImage.isHidden = false
        }
        
        
        cell.configure(label: cell.myLabel.text ?? "", label2: thisAds?.title ?? "",label3: thisAds?.price ?? 0, image: thisAds?.images_url.small ?? "")
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderColor = UIColor.blue.cgColor
            cell?.layer.borderWidth = 14
            //cell?.isSelected = true
        
        let thisAds: Ads?
        
        if(searchController.isActive){
            thisAds = filterSearch[indexPath.row]
        }else{
            thisAds = ads?[indexPath.row]
        }
        
        self.adsList = thisAds
        
        performSegue(withIdentifier: "segueToDescription", sender: nil)
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }
    func filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "All"){
        guard let ads = ads else{
            return
        }
        filterSearch = ads.filter{
            ads in
            guard let categorie = ids?.first?.name else{
                return false
            }
            
            let scopeMatch = (scopeButton == "All" || String(categorie).lowercased().contains(scopeButton.lowercased()))
            if(searchController.searchBar.text != ""){
                let searchTextMatch = String(ads.category_id).lowercased().contains(searchText.lowercased())
                return scopeMatch && searchTextMatch
            }
            else{
                return scopeMatch
            }
            
        }
        collectionView?.reloadData()
    }
    
}


