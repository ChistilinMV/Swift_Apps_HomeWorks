//
//  GroupCoreModel+CoreDataProperties.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 11.12.2023.
//

import Foundation
import CoreData


extension GroupCoreModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupCoreModel> {
        return NSFetchRequest<GroupCoreModel>(entityName: "GroupCoreModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int32
    @NSManaged public var photo: String?
    @NSManaged public var screenName: String?

}

extension GroupCoreModel : Identifiable {

}
