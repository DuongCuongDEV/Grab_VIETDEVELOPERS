//
//  MapViewController.swift
//  Grab-VietDevlopersK16
//
//  Created by chuottp on 15/12/2022.
//

import UIKit
import FloatingPanel
class MapViewController: UIViewController, FloatingPanelControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fpc = FloatingPanelController()
        fpc.delegate = self
        
        guard let ContentVC = storyboard?.instantiateViewController(identifier: "fpc_content") as? TrafficViewController else {
            return
        }
        fpc.set(contentViewController: ContentVC)
        fpc.layout = MyFloatingPanelLayout()
        
        
        fpc.addPanel(toParent: self)
        //fpc_cotent
    }
   /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class MyFloatingPanelLayout: FloatingPanelLayout {
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .half
    let anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] = [
        .full: FloatingPanelLayoutAnchor(absoluteInset: 16.0, edge: .top, referenceGuide: .safeArea),
        .half: FloatingPanelLayoutAnchor(fractionalInset: 0.3, edge: .bottom, referenceGuide: .safeArea),
        .tip: FloatingPanelLayoutAnchor(absoluteInset: 70.0, edge: .bottom, referenceGuide: .safeArea),
    ]
}
