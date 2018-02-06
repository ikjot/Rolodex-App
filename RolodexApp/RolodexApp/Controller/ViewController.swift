//
//  ViewController.swift
//  RolodexApp
//
//  Created by Ikjot Kaur on 2/5/18.
//  Copyright © 2018 Ikjot Kaur. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    var persons : [Person] = []
    var personImages:[UIImage]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Rolodex"
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        Person.getPersonData { (person) in
            self.persons = person
            self.myCollectionView.reloadData()
            self.downloadPersonImage(persons: self.persons, completion: { (images) in
                self.personImages = images
                self.myCollectionView.reloadData()
            })
            
        }
    }

}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return persons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PersonCell {
            
            let person = persons[indexPath.row]
            cell.spinner.startAnimating()
            cell.configureCell(person: person, image: personImages?[indexPath.row])
            
            return cell
        } else {
            return PersonCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = persons[indexPath.row]
        performSegue(withIdentifier: "personDetails", sender: person)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination  as? PersonDetails {
            if let sender  = sender as? Person {
                destination.person = sender
            }
        }
    }
    
    
    func downloadPersonImage(persons:[Person],completion: @escaping ([UIImage])->()){
        var images:[UIImage] = [UIImage]()
        let downloadGroup = DispatchGroup()
        for person in persons{
            guard let personURL = URL(string: person.avatar) else {
                return}
            downloadGroup.enter()
            Alamofire.request(personURL).responseData(completionHandler: { (data) in
                if let data = data.data {
                    if let image = UIImage(data: data) {
                        images.append(image)
                        downloadGroup.leave()
                    }
                }
            })
        }
        downloadGroup.notify(queue: DispatchQueue.main) { // 2
        completion(images)
        }

        }
}

