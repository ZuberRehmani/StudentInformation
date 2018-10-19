//
//  SecondViewController.swift
//  StudentInformation
//
//  Created by mac on 18/10/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {
    @IBOutlet weak var txtStudentName: UITextField!
    @IBOutlet weak var txtCourseName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func DoneButtonPressed(_ sender: UIButton) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let studentObject = Student(context: context)
        studentObject.name = txtStudentName.text
        studentObject.course = txtCourseName.text
        
        do{
        try context.save()
        }
        catch let error {
        print(error.localizedDescription)
        }

        navigationController?.popViewController(animated: true)
    }
    
}
