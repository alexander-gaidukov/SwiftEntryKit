//
//  ExitBehaviorSelectionTableViewCell.swift
//  SwiftEntryKit_Example
//
//  Created by Daniel Huri on 4/25/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

class PopBehaviorSelectionTableViewCell: SelectionTableViewCell {
    override func configure(attributesWrapper: EntryAttributeWrapper) {
        super.configure(attributesWrapper: attributesWrapper)
        titleValue = "Entry Pop Behavior"
        descriptionValue = "Specifies how the entry pops out as the next entry is pushed in"
        insertSegments(by: ["Overriden", "Animated"])
        selectSegment()
    }
    
    private func selectSegment() {
        switch attributesWrapper.attributes.options.popBehavior {
        case .overriden:
            segmentedControl.selectedSegmentIndex = 0
        case .animated(animation: _):
            segmentedControl.selectedSegmentIndex = 1
        }
    }
    
    @objc override func segmentChanged() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            attributesWrapper.attributes.options.popBehavior = .overriden
        case 1:
            attributesWrapper.attributes.options.popBehavior = .animated(animation: .init(duration: 0.6, types: [.scale]))
        default:
            break
        }
    }
}
