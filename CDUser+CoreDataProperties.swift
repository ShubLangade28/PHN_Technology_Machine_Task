//
//  CDUser+CoreDataProperties.swift
//  PHN Technology Machine Test
//
//  Created by Mac on 21/04/23.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?

}

extension CDUser : Identifiable {

}
