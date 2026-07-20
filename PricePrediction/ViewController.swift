//
//  ViewController.swift
//  PricePrediction
//
//  Created by Ngoni Katsidzira  on 20/7/2026.
//

import CoreML
import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets, Properties
    
    @IBOutlet var stackView: UIStackView!
    
    @IBOutlet var numberOfRooms: UISegmentedControl!
    @IBOutlet var numberOfBathrooms: UISegmentedControl!
    @IBOutlet var garageCapacity: UISegmentedControl!
    @IBOutlet var condition: UISegmentedControl!
    
    @IBOutlet var yearBuiltLabel: UILabel!
    @IBOutlet var yearBuiltSlider: UISlider!
    
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var sizeSlider: UISlider!
    
    @IBOutlet var result: UILabel!
    
    var model: HousePrices?
    
    required init?(coder: NSCoder) {
        do {
            model = try HousePrices(configuration: MLModelConfiguration())
        } catch {
            print(error.localizedDescription)
        }
        
        super.init(coder: coder)
    }
    
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spacing: CGFloat = 30
        
        stackView.setCustomSpacing(spacing, after: numberOfRooms)
        stackView.setCustomSpacing(spacing, after: numberOfBathrooms)
        stackView.setCustomSpacing(spacing, after: garageCapacity)
        stackView.setCustomSpacing(spacing, after: condition)
        stackView.setCustomSpacing(spacing, after: yearBuiltSlider)
        stackView.setCustomSpacing(spacing, after: sizeSlider)
        
        updatePrediction(self)
    }
    
    @IBAction func updatePrediction(_ sender: Any) {
        
        // 1
        yearBuiltLabel.text = "Year Built: \(Int(yearBuiltSlider.value))"
        sizeLabel.text = "Size: \(Int(sizeSlider.value))"
        
        do {
            // 2
            let input = HousePricesInput(
                bathrooms: Int64(numberOfBathrooms.selectedSegmentIndex + 1),
                cars: Int64(garageCapacity.selectedSegmentIndex),
                condition: Int64(condition.selectedSegmentIndex),
                rooms: Int64(numberOfRooms.selectedSegmentIndex + 1),
                size: Int64(sizeSlider.value),
                yearBuilt: Int64(yearBuiltSlider.value)
            )
            let prediction = try model?.prediction(input: input)
            
            // 3
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 0
            
            guard let prediction else { return }
            
            result.text = formatter.string(from: prediction.value as NSNumber) ?? ""
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
