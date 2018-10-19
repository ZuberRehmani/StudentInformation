//
//  Student+CoreDataProperties.swift
//  StudentInformation
//
//  Created by mac on 19/10/18.
//  Copyright © 2018 mac. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var course: String?
    @NSManaged public var name: String?

}
