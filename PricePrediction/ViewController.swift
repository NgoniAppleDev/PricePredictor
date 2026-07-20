//
//  ViewController.swift
//  PricePrediction
//
//  Created by Ngoni Katsidzira  on 20/7/2026.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var stackView: UIStackView!
    
    @IBOutlet var numberOfRoos: UISegmentedControl!
    @IBOutlet var numberOfBathrooms: UISegmentedControl!
    @IBOutlet var garageCapacity: UISegmentedControl!
    @IBOutlet var condition: UISegmentedControl!
    
    @IBOutlet var yearBuiltLabel: UILabel!
    @IBOutlet var yearBuiltSlider: UISlider!
    
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var sizeSlider: UISlider!
    
    @IBOutlet var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updatePrediction(_ sender: Any) {
        
    }
    
}
