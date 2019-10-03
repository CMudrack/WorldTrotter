//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Cody Mudrack on 10/1/19.
//  Copyright © 2019 Mudrack, Cody M. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView?
    
    override func loadView() {
        let mapView = MKMapView(frame: CGRect.zero)
        
        self.view = mapView
        self.mapView = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl.selectedSegmentIndex = 0
        
        mapView.addSubview(segmentedControl)
        
        segmentedControl.topAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.topAnchor, constant: 8.0).isActive = true
        mapView.layoutMarginsGuide.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor).isActive = true
        mapView.layoutMarginsGuide.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor).isActive = true
        
        segmentedControl.addTarget(self, action: #selector(segmentControlDidChange(_:)), for: .valueChanged)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("Map viewDidLoad()")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Map viewDidAppear")
    }
    
    @objc
    func segmentControlDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView?.mapType = .standard
            break
        case 1:
            mapView?.mapType = .hybrid
            break
        case 2:
            mapView?.mapType = .satellite
            break
        default:
            break
        }
    }
    
}

