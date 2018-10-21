//
//  DetailViewController.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 18/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailView {

    @IBOutlet weak var contentLabel: UILabel!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Detail"
        
        let paramNotNull = post?.body ?? "--no content from parent--"
        
        contentLabel.text = "Content from Main: \(paramNotNull)"
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
