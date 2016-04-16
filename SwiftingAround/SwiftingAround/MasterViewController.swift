//
//  MasterViewController.swift
//  SwiftingAround
//
//  Created by Gertjan Smits on 16-04-16.
//  Copyright © 2016 Gertjan.com. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
	var viewControllers = [AnimatingProgressArc.self, SomethingBlue.self]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		
		// Do any additional setup after loading the view, typically from a nib.
		self.navigationItem.leftBarButtonItem = self.editButtonItem()
		
	}
	
	override func viewWillAppear(animated: Bool) {
		self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
		super.viewWillAppear(animated)
	}
	
	// MARK: - Segues
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "showDetail" {
			
		}
	}
	
	// MARK: - Table View
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		if let indexPath = self.tableView.indexPathForSelectedRow {
			if let viewControllerClass = viewControllers[indexPath.row] as? UIViewController.Type {
				if let viewController = viewControllerClass.init() as? UIViewController {
					if let split = self.splitViewController {
						let controllers = split.viewControllers
						if let navigationController = controllers[controllers.count-1] as? UINavigationController {
							navigationController.pushViewController(viewController, animated: true)
						}
					}
				}
			}
		}
	}
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewControllers.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
		cell.textLabel!.text = viewControllers[indexPath.row].description
		return cell
	}
	
	override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return true
	}
}