//
//  EntityCreationViewController.swift
//  FBSnapshotTestCase
//
//  Created by caroline on 06/01/2018.
//

import UIKit
import CoreData

class EntityCreationViewController: UIViewController {

    var entity: NSEntityDescription?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let attributes = entity?.attributesByName else {
            putEmptyErrorLabel()
            return
        }
        attributes.forEach({ attribute in
            createField(attribute: attribute)
        })
    }
    
    private func createField(attribute: (key: String, value: NSAttributeDescription)) {
        var field: UIView?
        
        switch attribute.value.attributeType {
        case NSAttributeType.stringAttributeType:
            field = UITextField()
            // TODO
        case NSAttributeType.booleanAttributeType:
            field = UISwitch()
            // TODO
        case NSAttributeType.decimalAttributeType, NSAttributeType.doubleAttributeType:
            field = UITextField()
            // TODO
        default:
            return
        }
        
        if field != nil {
            self.view.addSubview(field!)
        } else {
            print("Cannot solve \(attribute.key) as a field.")
        }
    }

    private func putEmptyErrorLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "No entity provided."
        self.view.addSubview(label)
    }
}
