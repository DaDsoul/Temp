//
//  Network.swift
//  TempApp
//
//  Created by Akezhan Mussa on 10/25/18.
//  Copyright © 2018 Akezhan Mussa. All rights reserved.
//

import Foundation
import Alamofire
import Firebase

struct Network{
    // Fectching the elements via the Firebase of the specific child
    static func fetchElement(type: Int, callback: @escaping ([Double],[Double]) -> ()){
        let ref = Database.database().reference()
        ref.child("data").child("4").observe(.value, with: { (snapshot) in
            let post = snapshot.value as? [[Int:Any]]
            print("THE POST IS \(post)")
            var result = [Double]()
            var time = [Double]()
            if let post = post{
                    for elem in post{
                        if type != 0{
                            print("I am called")
                            print(elem[0])
                            result.append(elem[0] as! Double)
                        } else {
                            time.append(elem[0] as! Double)
                        }
                    }
                }
            callback(result, time)
        })
    }
}
    

