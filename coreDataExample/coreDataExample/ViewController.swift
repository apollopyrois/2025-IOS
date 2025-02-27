//
//  ViewController.swift
//  coreDataExample
//
//  Created by MacDonald,Liam on 2025-02-27.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        if let text = textField.text, !text.isEmpty {
                    saveData(content: text)
                    label.text = fetchData()
                }
    }
    
    func saveData(content: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Message", in: context)!
        let newMessage = NSManagedObject(entity: entity, insertInto: context)
        newMessage.setValue(content, forKey: "content")
        
        do {
            try context.save()
            print("Saved successfully!")
        } catch {
            print("Failed to save: \(error.localizedDescription)")
        }
    }
        
    func fetchData() -> String? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Message")
        
        do {
            let messages = try context.fetch(fetchRequest)
            return messages.last?.value(forKey: "content") as? String
        } catch {
            print("Failed to fetch: \(error.localizedDescription)")
            return nil
        }
    }
    }

