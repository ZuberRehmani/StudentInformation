//
//  ViewController.swift
//  StudentInformation
//
//  Created by mac on 18/10/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController , UITableViewDelegate {
    
    var studentArray = [Student]()

    @IBOutlet weak var studentTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        studentTable.delegate = self
        studentTable.dataSource = self
        getAllStudent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllStudent()
        studentTable.reloadData()
    }

    @IBAction func AddStudentButtonPressed(_ sender: UIButton) {
    
        let secondVc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
       navigationController?.pushViewController(secondVc, animated: true)
       getAllStudent()
    }
    
    
    
    func getAllStudent(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<Student> = Student.fetchRequest()
        
        do {
          try studentArray = context.fetch(fetchRequest)
        }catch let error {
            print(error.localizedDescription)
        }
        
       
    }
    


}


extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let student = studentArray[indexPath.row]
        cell.lblStudentName.text = student.name
        cell.lblCourse.text = student.course
        
        return cell
    }
}

