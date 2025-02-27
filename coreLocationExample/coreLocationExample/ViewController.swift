//
//  ViewController.swift
//  coreLocationExample
//
//  Created by MacDonald,Liam on 2025-02-27.
//

//I'm pretty sure this would work if I could change the location settings on the mac but I
//can't even with the makemeadmin self service thing
import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var latitudeLabel: UILabel!
    
    @IBOutlet weak var longitudeLabel: UILabel!
    
    @IBOutlet weak var precisionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    @IBAction func getLocationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            latitudeLabel.text = "Latitude: \(location.coordinate.latitude)"
            longitudeLabel.text = "Longitude: \(location.coordinate.longitude)"
            precisionLabel.text = "Accuracy: \(location.horizontalAccuracy) meters"
        }
    }
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
    
}

