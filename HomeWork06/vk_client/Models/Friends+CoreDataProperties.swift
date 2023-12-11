//
//  Friends+CoreDataProperties.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 11.12.2023.
//

import Foundation
import CoreData


extension FriendCoreModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendCoreModel> {
        return NSFetchRequest<FriendCoreModel>(entityName: "FriendCoreModel")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var photo: String?
    @NSManaged public var online: Int32
    @NSManaged public var id: Int32

}

extension FriendCoreModel : Identifiable {

}
