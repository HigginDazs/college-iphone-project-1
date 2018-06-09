//
//  AllBandsTable.swift
//  Metal Band App
//
//  Created by Conor Thomas Higgins on 23/02/2017.
//  Copyright © 2017 Conor Thomas Higgins. All rights reserved.
//

import UIKit

class AllBandsCell: UITableViewCell {
    @IBOutlet weak var bandCellName: UILabel!
    @IBOutlet weak var bandCellImage: UIImageView!
    
}

class AllBandsTable: UITableViewController {
    
    // data for the table
    var bandsData : Bands!

    override func viewDidLoad() {
        super.viewDidLoad()

        // make data set title
        self.title = "Bands"
        bandsData = Bands(fromXML: "bands.xml")
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "images/background.jpg")
        backgroundImage.alpha = 0.65
        //self.view.insertSubview(backgroundImage, at: 0)
        self.tableView.backgroundView = backgroundImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bandsData.getCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! AllBandsCell

        // Configure the cell with the band data
        let band = bandsData.getBand(id: indexPath.row)
        cell.bandCellName?.text = band.name
        //cell.detailTextLabel?.text = band.country
        cell.bandCellImage?.image = UIImage(named: "icons/" + band.icon)
        cell.bandCellImage?.contentMode = UIViewContentMode.scaleAspectFill
        cell.backgroundColor = UIColor(white: 0, alpha: 0)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // get index path for cell
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        // Get the new view controller using segue.destinationViewController.
        let destination = segue.destination as! BandView
        // Pass the selected object to the new view controller.
        destination.bandData = bandsData.getBand(id: (indexPath?.row)!)
    }
    

}
