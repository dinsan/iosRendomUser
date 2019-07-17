//
//  ViewController.swift
//  iOSstudent
//
//  Created by Loord dinsan on 24/04/2019.
//  Copyright © 2019 Loord dinsan. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var array = [String]()
    
    var arrayStudents = [Student]()
    var selectedStu: Student?
    var results: UserBase?
    var userArray: [RandomUser]?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUsers()
    }
    
    
    func fetchUsers(){
        var request = URLRequest(url: URL(string: "https://randomuser.me/api/?results=50")!)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(UserBase.self, from: data!)
                self.userArray = responseModel.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
              
            } catch let error {
                print("JSON Serialization ERROR: ", error)
            }
            }.resume()
    }
    
    func formatName(userName: UserName) -> String {
        return userName.title.capitalized + " " + userName.first.capitalized + " " + userName.last.uppercased()
    }
    func formatImage(userpitcher: UserPicture) -> String {
        return userpitcher.medium
    }
    func formatLargeImage(userpitcher: UserPicture) -> String {
        return userpitcher.thumbnail
    }

}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "textCell") as? StuTableViewCell else {
            return UITableViewCell()
        }
        
        if let user = userArray?[indexPath.row] {
            let fullName = formatName(userName: user.name)
            let imagepath = formatLargeImage(userpitcher: user.picture)
    
            cell.titleLabel.text = fullName
            cell.releaseYearLabel.text = user.email
    
            if let url = URL(string: imagepath){
                
                do {
                    let data = try Data(contentsOf: url)
                    cell.stuimg.image = UIImage(data: data)
                    
                }catch let err {
                    print(" Error : \(err.localizedDescription)")
                }
            }
        }
        
        return cell
    }
}




extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewCtrl = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        if let user = userArray?[indexPath.row] {
        
            detailViewCtrl.titl = user.name.title
            detailViewCtrl.Fname = user.name.first
            detailViewCtrl.Lname = user.name.last
             detailViewCtrl.Email = user.email
             detailViewCtrl.City = user.location.city
            detailViewCtrl.Steet = user.location.street
             detailViewCtrl.Phone = user.phone
             detailViewCtrl.Cell = user.cell
            detailViewCtrl.imagepath = formatLargeImage(userpitcher: user.picture)
        }

        self.navigationController?.pushViewController(detailViewCtrl, animated: true)
       

    }
}
