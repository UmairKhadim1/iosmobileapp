//
//  MessageModel.swift
//  Heartzy
//
//  Created by waseeem on 11/11/22.
//

import Foundation


struct message: Codable{

    var senderid : String
    var message : String
    var datetime : String

    init(senderid: String?,message : String?,datetime : String?) {

        self.senderid = senderid!
        self.message = message!
        self.datetime = datetime!

    }

}


struct userData{

    var id : String
    var contacts : String
    var password : String
    var name : String
    var image: String

    init(id: String?,contacts : String?,password : String?,name : String?,image : String?) {

        self.id = id ?? ""
        self.contacts = contacts ?? ""
        self.password = password ?? ""
        self.name = name ?? ""
        self.image = image ?? ""
    }

}



//class message{
//
//    var senderid : String = ""
//    var message : String = ""
//    var datetime : String = ""
//
//
//}
