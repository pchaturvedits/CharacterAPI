//
//  DetailViewController.swift
//  JSONDownloadingSwift4
//
//  Created by Manish Chaturvedi on 7/18/19.
//  Copyright © 2019 Xiaodan Wang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    

    @IBOutlet weak var imgimage: UIImageView!
    
    
    @IBOutlet weak var lblName: UILabel!
    
    
    @IBOutlet weak var lblDesc: UILabel!
    
   var getName = String()
    var getImage = UIImage()
    var getDesc = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgimage.image = getImage
        lblName.text = getName
        lblDesc.text = getDesc
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
