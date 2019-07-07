//
//  ViewController.swift
//  AnimalToHumanAges
//
//  Created by Walker Vonder Haar on 6/27/19.
//  Copyright © 2019 Walker Vonder Haar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var UnitsLabel: UIButton!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var formulaPicker: UIPickerView!
    @IBOutlet weak var decimalSegment: UISegmentedControl!
    @IBOutlet weak var animalLabel: UIButton!

    var formulaArray = ["dog to human",
                        "human to dog",
                        "cat to human",
                        "human to cat",
                        "greenland shark to human",
                        "human to greenland shark",
                        "car to human",
                        "human to car",
                        "laptop to human",
                        "human to laptop",
                        "horse to human",
                        "human to horse",
                        "pig to human",
                        "human to pig",
                        "python to human",
                        "human to python",
                        "hamster to human",
                        "human to hamster"]

    var fromUnits = ""
    var toUnits = ""
    var conversionString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        formulaPicker.delegate = self
        formulaPicker.dataSource = self
        conversionString = formulaArray[formulaPicker.selectedRow(inComponent: 0)]
        userInput.becomeFirstResponder()
        UnitsLabel.setTitle("years", for: .normal)
        animalLabel.setTitle("dog", for: .normal)
    }

    func calculateConversion() {
        guard let inputValue = Double(userInput.text!) else {
            if userInput.text != "" {
                showAlert(title: "Cannot Convert Value", message: "\"\(userInput.text!)\" is not a valid number.")
            }
            return
        }
        var outputValue = 0.0
        switch conversionString {
        case "dog to human":
            outputValue = inputValue * 0.14557
        case "human to dog":
            outputValue = inputValue / 0.14557
        case "cat to human":
            outputValue = inputValue * 0.16456
        case "human to cat":
            outputValue = inputValue / 0.16456
        case "greenland shark to human":
            outputValue = inputValue * 3.4
        case "human to greenland shark":
            outputValue = inputValue / 3.4
        case "car to human":
            outputValue = inputValue / 7.9
        case "human to car":
            outputValue = inputValue * 7.9
        case "laptop to human":
            outputValue = inputValue * 0.0443
        case "human to laptop":
            outputValue = inputValue / 0.0443
        case "horse to human":
            outputValue = inputValue * 0.3481
        case "human to horse":
            outputValue = inputValue / 0.3481
        case "pig to human":
            outputValue = inputValue * 0.22152
        case "human to pig":
            outputValue = inputValue / 0.22152
        case "python to human":
            outputValue = inputValue * 0.31646
        case "human to python":
            outputValue = inputValue / 0.31646
        case "hamster to human":
            outputValue = inputValue / 0.037975
        case "human to hamster":
            outputValue = inputValue / 0.037975
        default: showAlert(title: "Unexpected Error", message: "Contact the developer and share that \"\(conversionString)\" could not be identified.")
        }
        let formatString = (decimalSegment.selectedSegmentIndex < decimalSegment.numberOfSegments-1 ? "%.\(decimalSegment.selectedSegmentIndex + 1)f" : "%f")
        let outputString = String(format: formatString, outputValue)
        if userInput.text != "1" {
            resultsLabel.text = "\(inputValue) \(animalLabel.title(for: .normal)!) \(UnitsLabel.title(for: .normal)!) is the equivalent of \(outputString) \(toUnits) \(UnitsLabel.title(for: .normal)!)"
        } else if UnitsLabel.title(for: .normal) == "years" {
            resultsLabel.text = "\(inputValue) \(animalLabel.title(for: .normal)!) year is the equivalent of \(outputString) \(toUnits) year"
        } else if UnitsLabel.title(for: .normal) == "months" {
            resultsLabel.text = "\(inputValue) \(animalLabel.title(for: .normal)!) month is the equivalent of \(outputString) \(toUnits) month"
        } else if UnitsLabel.title(for: .normal) == "weeks" {
            resultsLabel.text = "\(inputValue) \(animalLabel.title(for: .normal)!) week is the equivalent of \(outputString) \(toUnits) week"
        } else if UnitsLabel.title(for: .normal) == "days" {
            resultsLabel.text = "\(inputValue) \(animalLabel.title(for: .normal)!) day is the equivalent of \(outputString) \(toUnits) day"
        } else if UnitsLabel.title(for: .normal) == "hours" {
            resultsLabel.text = "\(inputValue) \(animalLabel.title(for: .normal)!) hour is the equivalent of \(outputString) \(toUnits) hour"
        } else if UnitsLabel.title(for: .normal) == "minutes" {
            resultsLabel.text = "\(inputValue) \(animalLabel.title(for: .normal)!) minute is the equivalent of \(outputString) \(toUnits) minute"
        } else if UnitsLabel.title(for: .normal) == "seconds" {
            resultsLabel.text = "\(inputValue) \(animalLabel.title(for: .normal)!) second is the equivalent of \(outputString) \(toUnits) second"
        }
    }

    func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)

    }

    @IBAction func userInputChanged(_ sender: UITextField) {
        resultsLabel.text = ""
    }

    @IBAction func decimalSelected(_ sender: UISegmentedControl) {
        calculateConversion()
    }

    @IBAction func convertButtonPressed(_ sender: UIButton) {
        calculateConversion()
    }
    @IBAction func unitsLabelPressed(_ sender: Any) {
        if UnitsLabel.title(for: .normal) == "years" {
            UnitsLabel.setTitle("months", for: .normal)
        } else if UnitsLabel.title(for: .normal) == "months" {
            UnitsLabel.setTitle("weeks", for: .normal)
        } else if UnitsLabel.title(for: .normal) == "weeks" {
            UnitsLabel.setTitle("days", for: .normal)
        } else if UnitsLabel.title(for: .normal) == "days" {
            UnitsLabel.setTitle("hours", for: .normal)
        }else if UnitsLabel.title(for: .normal) == "hours" {
            UnitsLabel.setTitle("minutes", for: .normal)
        } else if UnitsLabel.title(for: .normal) == "minutes" {
            UnitsLabel.setTitle("seconds", for: .normal)
        } else if UnitsLabel.title(for: .normal) == "seconds" {
            UnitsLabel.setTitle("years", for: .normal)
        }
    }
}
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return formulaArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return formulaArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        conversionString = formulaArray[row]
        let unitsArray = formulaArray[row].components(separatedBy: " to ")
        fromUnits = unitsArray[0]
        toUnits = unitsArray[1]
        animalLabel.setTitle(fromUnits, for: .normal)
        calculateConversion()
    }


}

