//
//  ViewController.swift
//  JSONDownloadingSwift4
//
//  Created by Xiaodan Wang on 9/20/17.
//  Copyright © 2017 Xiaodan Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    final let url = URL(string:"https://api.duckduckgo.com/?q=simpsons+characters&format=json")
    private var characters = [RelatedTopic]()
    

    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
        tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 100.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
       
       
    }

   
    func downloadJson() {
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            print("downloaded data \(data)")
            do
            {
                let decoder = JSONDecoder()
                let downloadedcharacters = try? decoder.decode( Character.self, from: data)
                self.characters = (downloadedcharacters?.RelatedTopics)!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("something wrong after downloaded")
            }
            }.resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell") as? CharacterCell else { return UITableViewCell() }
        


        
        cell.DOBLbl.text = charcName(a: indexPath.row)
    
        cell.contentView.backgroundColor = UIColor.white
        cell.backgroundColor = UIColor.white
        
        if let imageURL = URL(string: characters[indexPath.row].Icon.URL) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)!
                    DispatchQueue.main.async {
                        cell.imgView.image = image
                    
                }
            }
        }
        }
 

        
    
    
        return cell
       
    }
    
    
  
    func charcName(a:Int) -> String {
    let charName =  characters[a].Text
   
    let firstA: String = charName.components(separatedBy: "-").first!
    return firstA
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController")as! DetailViewController
          vc.getName = charcName(a: indexPath.row)
          vc.getDesc = characters[indexPath.row].Text
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
