//
//  HBViewController.swift
//  DeckOfCards-C
//
//  Created by Heli Bavishi on 12/1/20.
//

import UIKit

class HBViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    //MARK: - Properties
    var cardArray: [HBCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCard()
        // Do any additional setup after loading the view.
    }
    
    func fetchCard() {
        HBCardViewController.drawNewCard(1) { (cards) in
            if let cards = cards {
                self.cardArray = cards
                HBCardViewController.fetchImage(cards[0]) { (image) in
                    DispatchQueue.main.async {
                        self.cardLabel.text = ("\(self.cardArray[0].value) of \(self.cardArray[0].suit)")
                        self.cardImageView.image = image
                    }
                }
            }
        }
    }
    
    @IBAction func newCardTappedButton(_ sender: Any) {
        fetchCard()
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
