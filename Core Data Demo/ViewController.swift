//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Pranav Bhandari on 4/3/17.
//  Copyright © 2017 Pranav Bhandari. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDel : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context : NSManagedObjectContext = appDel.persistentContainer.viewContext
       /*
        var newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)

        newUser.setValue("demo3", forKey: "username")
        newUser.setValue("demo123", forKey: "password")
        
        do{
            try context.save()
        } catch{
            print("Something went wrong")
        }
        
 */
        
        //let request = NSFetchRequest(entityName: "Users")
        let request: NSFetchRequest<NSFetchRequestResult> = Users.fetchRequest()
        request.predicate = NSPredicate(format: "username = %@", "demo3")
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    print(result.value(forKey: "password") as! String)
                }
            }
           // print(results)
        } catch{
            print("something wrong")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

