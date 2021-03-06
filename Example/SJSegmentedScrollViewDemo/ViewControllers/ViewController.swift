//
//  ViewController.swift
//  SJSegmentedScrollView
//
//  Created by Subins Jose on 06/10/2016.
//  Copyright © 2016 Subins Jose. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class ViewController: SJSegmentedViewController {

	var selectedSegment: SJSegmentTab?

	override func viewDidLoad() {
		if let storyboard = self.storyboard {

			let headerController = storyboard
				.instantiateViewController(withIdentifier: "HeaderViewController1")

			let firstViewController = storyboard
				.instantiateViewController(withIdentifier: "FirstTableViewController")
			firstViewController.title = "First"

			let secondViewController = storyboard
				.instantiateViewController(withIdentifier: "SecondViewController")
			secondViewController.title = "Second"

			let thirdViewController = storyboard
				.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController
			thirdViewController?.title = "Third"
			thirdViewController?.loadViewController = { (index) in
				self.setSelectedSegmentAt(index, animated: true)
			}
            
            let thirdViewController1 = storyboard
                .instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController
            thirdViewController?.title = "AAAAAAAAAAAAAAAAAAAA"
            thirdViewController?.loadViewController = { (index) in
                self.setSelectedSegmentAt(index, animated: true)
            }

	

			headerViewController = headerController
			segmentControllers = [firstViewController,
			                           secondViewController,
			                           thirdViewController!,thirdViewController1!
			                           ]
            
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(self.temp), for: .valueChanged)
            self.segmentedScrollView.addSubview(refreshControl)
            isBounces = true
//            verticalTop = -100
			headerViewHeight = 200
			selectedSegmentViewHeight = 5.0
//            headerViewOffsetHeight = -10.0
			segmentTitleColor = .gray
			selectedSegmentViewColor = .red
			segmentShadow = SJShadow.light()
			showsHorizontalScrollIndicator = false
			showsVerticalScrollIndicator = false
			segmentBounces = false
//            delegate = self
            isFixedWidthTabSegment = true
		}

		title = "Segment"
		super.viewDidLoad()
	}

    @objc func temp() {
        
    }
    
	func getSegmentTabWithImage(_ imageName: String) -> UIView {

		let view = UIImageView()
		view.frame.size.width = 100
		view.image = UIImage(named: imageName)
		view.contentMode = .scaleAspectFit
		view.backgroundColor = .white
		return view
	}
}

//extension ViewController: SJSegmentedViewControllerDelegate {
//
//    func didMoveToPage(_ controller: UIViewController, segment: SJSegmentTab?, index: Int) {
//
//        if selectedSegment != nil {
//            selectedSegment?.titleColor(.lightGray)
//        }
//
//        if segments.count > 0 {
//
//            selectedSegment = segments[index]
//            selectedSegment?.titleColor(.red)
//        }
//    }
//}

