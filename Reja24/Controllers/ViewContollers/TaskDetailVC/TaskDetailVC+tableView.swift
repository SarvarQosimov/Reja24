//
//  TaskDetailVC+tableView.swift
//  Reja24
//
//  Created by Sarvar Qosimov on 01/05/24.
//

import UIKit

extension TaskDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = taskDetails[indexPath.row]
        
        return cell
    }
}

