 /*
  Copyright 2018-2023 NAVER Corp.
  
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
  http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  */

import UIKit
import NMapsMap

class MapClickEventViewController: MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.touchDelegate = self
    }

    // MARK: - IBAction
    
    @IBAction func respondToLongPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let coord = sender.location(in: mapView)
            let latlng = mapView.projection.latlng(from: coord)
            let alertController = UIAlertController(title: "지도 롱클릭", message: latlng.positionString(), preferredStyle: .alert)
            present(alertController, animated: true) {
                DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now() + 0.5), execute: {
                    alertController.dismiss(animated: true, completion: nil)
                })
            }
        }
    }
    
}

 // MARK:- MapView Touch Delegate
 
 extension MapClickEventViewController: NMFMapViewTouchDelegate {
     func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        let alertController = UIAlertController(title: "지도 클릭", message: latlng.positionString(), preferredStyle: .alert)
        present(alertController, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now() + 0.5), execute: {
                alertController.dismiss(animated: true, completion: nil)
            })
        }
    }
 }
