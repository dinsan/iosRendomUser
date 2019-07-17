//
//  DetailViewController.swift
//  iOSstudent
//
//  Created by Loord dinsan on 15/05/2019.
//  Copyright © 2019 Loord dinsan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var UserLargeImage: UIImageView!
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var userFname: UILabel!
    @IBOutlet weak var userLastName: UILabel!
    @IBOutlet weak var userStreet: UILabel!
    @IBOutlet weak var userCity: UILabel!
   
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var userCell: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    var stu : UserBase?

    

    var titl = String()
    var Fname = String()
    var Lname = String()
    var Steet = String()
    var City = String()
    var Email = String()
    var Phone = String()
    var Cell = String()
    var imagepath = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        UserLargeImage.layer.masksToBounds = false
        UserLargeImage.layer.borderColor = UIColor.darkGray.cgColor
        UserLargeImage.layer.cornerRadius = 180
        UserLargeImage.clipsToBounds = true
    }
    
    func setupView(){
    
        
        if let url = URL(string: imagepath){
            
            do {
                let data = try Data(contentsOf: url)
                UserLargeImage.image = UIImage(data: data)
                
            }catch let err {
                print(" Error : \(err.localizedDescription)")
            }
        }
        
        userTitle.text = titl;
        userFname.text = Fname;
        userLastName.text = Lname;
        userCity.text = City;
        userStreet.text = Steet;
        userEmail.text = Email;
        userPhone.text = Phone;
        userCell.text = Cell;
    }
}
