//
//  ViewController.swift
//  sqliteExample
//
//  Created by MacDonald,Liam on 2025-02-27.
//


//I can't figure out why it won't connect, I have a premade file I'm trying to connect to I've uploaded with this.
import UIKit
import SQLite

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    var database: Connection!
    let table1 = Table("table1")
    let textColumn = Expression<String>("text")

    let dbFile: String = "assignment4"
    let dbExt: String = "db"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        copyDatabaseIfNeeded()
        connectDatabase()
        fetchData()
    }
    
    func copyDatabaseIfNeeded() {
            let fileManager = FileManager.default
            let documentsURL = try! fileManager.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            )
            let destinationURL = documentsURL.appendingPathComponent("assignment4.db")

            if !fileManager.fileExists(atPath: destinationURL.path) {
                if let bundleURL = Bundle.main.url(forResource: "assignment4", withExtension: "db") {
                    do {
                        try fileManager.copyItem(at: bundleURL, to: destinationURL)
                        print("Database copied to Documents directory.")
                    } catch {
                        print("Error copying database: \(error)")
                    }
                } else {
                    print("Database file not found in bundle.")
                }
            }
        }


    func connectDatabase() {
            do {
                let documentsURL = try FileManager.default.url(
                    for: .documentDirectory,
                    in: .userDomainMask,
                    appropriateFor: nil,
                    create: false
                )
                let fileURL = documentsURL.appendingPathComponent("assignment4.db")
                database = try Connection(fileURL.path)
                print("Database connected successfully.")
            } catch {
                print("Database connection error: \(error)  ")
            }
        }


    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let inputText = textField.text, !inputText.isEmpty else {
                label.text = "Enter some text!"
                return
            }

            do {
                let insert = table1.insert(textColumn <- inputText)
                try database.run(insert)
                fetchData()
            } catch {
                print("Insert Error: \(error)")
            }
    }
    
    func fetchData() {
        do {
            if let row = try database.pluck(table1) {
                label.text = "Saved: \(row[textColumn])"
            } else {
                label.text = "No data found"
            }
        } catch {
            print("Fetch Error: \(error)")
        }
    }
}

