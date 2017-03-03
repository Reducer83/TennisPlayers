//
//  ViewController.swift
//  TennisPlayers
//
//  Created by Richard Thomson on 07/07/2015.
//  Copyright (c) 2015 Richard Thomson. All rights reserved.
//

import UIKit


class ViewController: UIViewController { //Open View controller O.1

    //Create Player Objects
    
    var NovakData = ["Novak Djokovic",28,1] as [Any]
    var AndyData = ["Andy Murray",28,3] as [Any]
    var RafaData = ["Rafa Nadal",28,10] as [Any]
    
    var PlayerOne = TennisPlayer()
    var PlayerTwo = TennisPlayer()
    var Match1 = Match()
    
    
    
    @IBOutlet weak var LabelOne: UILabel!
    @IBOutlet weak var LabelTwo: UILabel!
    @IBOutlet weak var LabelThree: UILabel!
    @IBOutlet weak var PlayerImage: UIImageView!
    @IBOutlet weak var PlayerOnePoint: UILabel!
    @IBOutlet weak var PlayerTwoPoint: UILabel!
    @IBOutlet weak var PlayerOneNameLabel: UILabel!
    @IBOutlet weak var PlayerTwoNameLabel: UILabel!
    @IBOutlet weak var Set1P1: UILabel!
    @IBOutlet weak var Set1P2: UILabel!
    @IBOutlet weak var Set2P1: UILabel!
    @IBOutlet weak var Set2P2: UILabel!
    @IBOutlet weak var Set3P1: UILabel!
    @IBOutlet weak var Set3P2: UILabel!
    @IBOutlet weak var Set4P1: UILabel!
    @IBOutlet weak var Set4P2: UILabel!
    @IBOutlet weak var Set5P1: UILabel!
    @IBOutlet weak var Set5P2: UILabel!

  
    
    override func viewDidLoad() { //Open ViewDidLoad O.2
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Randomly define who serves first and set their label to red
        
        var toServeInt: Int
        toServeInt = Int(arc4random_uniform(2))+1
  
        
        if toServeInt == 1
        {
            PlayerOne.server = true
            PlayerOneNameLabel.textColor = UIColor.red
            
        }
        
        else
        {
            PlayerTwo.server = true
            PlayerTwoNameLabel.textColor = UIColor.red
        }
        
           //Set Player Data
        
        var randomisedMatchUp: Int
        randomisedMatchUp = Int(arc4random_uniform(3))
        
        if randomisedMatchUp == 0
        {
            PlayerOne.name = String(_cocoaString: AndyData[0] as AnyObject)
            PlayerOne.age = 28
            PlayerOne.rank = 3
            PlayerOne.image = UIImage(named: "Andy")
            PlayerOne.servePower = 25
            
            PlayerTwo.name = String(_cocoaString: RafaData[0] as AnyObject)
            PlayerTwo.age = 29
            PlayerTwo.rank = 10
            PlayerTwo.image = UIImage(named: "Rafa")
            PlayerTwo.servePower = 20
        }
        
        if
        
            randomisedMatchUp == 2
        {
            PlayerOne.name = String(_cocoaString: AndyData[0] as AnyObject)
            PlayerOne.age = 28
            PlayerOne.rank = 3
            PlayerOne.image = UIImage(named: "Andy")
            PlayerOne.servePower = 25
            
            PlayerTwo.name = String(_cocoaString: NovakData[0] as AnyObject)
            PlayerTwo.age = 28
            PlayerTwo.rank = 1
            PlayerTwo.image = UIImage(named: "Novak-djokovic")
            PlayerTwo.servePower = 30
        }
        
        if
            
        randomisedMatchUp == 1
            {
                PlayerOne.name = String(_cocoaString: NovakData[0] as AnyObject)
                PlayerOne.age = 28
                PlayerOne.rank = 1
                PlayerOne.image = UIImage(named: "Novak-djokovic")
                PlayerOne.servePower = 30
            
                PlayerTwo.name = String(_cocoaString: RafaData[0] as AnyObject)
                PlayerTwo.age = 29
                PlayerTwo.rank = 10
                PlayerTwo.image = UIImage(named: "Rafa")
                PlayerTwo.servePower = 20
        }
        /*
        
        PlayerOne.name = "Andy Murray"
        PlayerOne.age = 28
        PlayerOne.rank = 3
     
        PlayerTwo.name = "Rafa Nadal"
        PlayerTwo.age = 29
        PlayerTwo.rank = 10
        
        //Set Player Name Labels
*/
    
        PlayerOneNameLabel.text = PlayerOne.name
        PlayerTwoNameLabel.text = PlayerTwo.name
        
        //Create First Set
        
        
        
        
    } // Close View Did Load C.2
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


var totalDeuces = 0
    
    
    @IBAction func playPoint(_ sender: AnyObject) { //Open Play Point O.3
    
       // Calculate a value for each player based on their rank and a randomly generated value
        
        //Player with lowest combined score of rank + random number wins the point
    
        
        
        var PlayerOneRankCalc: Int
        PlayerOneRankCalc = Int(arc4random_uniform(100))
        
        if PlayerOne.server == true && (PlayerOne.games + PlayerTwo.games < 12)
           
          {
            PlayerOneRankCalc = PlayerOneRankCalc - PlayerOne.rank + PlayerOne.servePower
            }
        
        else
            
        {
                      PlayerOneRankCalc = PlayerOneRankCalc - PlayerOne.rank
               }
        
        
        var PlayerTwoRankCalc: Int
        PlayerTwoRankCalc = Int(arc4random_uniform(100))
        
    if PlayerTwo.server == true && (PlayerTwo.games + PlayerOne.games < 12)
    
    {
        PlayerTwoRankCalc = PlayerTwoRankCalc - PlayerTwo.rank + PlayerTwo.servePower
    }
else

{
    
    PlayerOneRankCalc = PlayerOneRankCalc - PlayerOne.rank
}
       //NSLog("Play1 Calc is %i", PlayerOneRankCalc)
   // NSLog("Play2 Calc is %i", PlayerTwoRankCalc)
     
        
        

        if PlayerTwoRankCalc <= PlayerOneRankCalc
      
            //Scenario when PLAYERONE wins point
        
            
            
            
            //////////////////////
            
            
            
            
            
        { // Open IF P1 Wins O.4
            
            PlayerOne.points = PlayerOne.points + 1
            PlayerOne.totalPoints = PlayerOne.totalPoints + 1
            
            if PlayerOne.deuce == true && (PlayerOne.points - PlayerTwo.points == 2)
               {
                PlayerOne.winGame()
                Match1.setsArray[Match1.ActiveSet][0] = PlayerOne.games
                PlayerTwo.loseGame()
                PlayerOnePoint.text = String(PlayerOne.points)
                PlayerTwoPoint.text = String(PlayerTwo.points)
                totalDeuces = 0
                
                if PlayerOne.server == true
                {
                    PlayerOneNameLabel.textColor = UIColor.red
                    PlayerTwoNameLabel.textColor = UIColor.black
                }
                else
                {
                    
                    PlayerTwoNameLabel.textColor = UIColor.red
                    PlayerOneNameLabel.textColor = UIColor.black
                }
                
                
               }
                
            if PlayerOne.deuce == true && (PlayerOne.points - PlayerTwo.points == 1)
               {
                
                PlayerOne.points = 4
                PlayerOnePoint.text = "Ad"
                PlayerTwo.points = 3
                PlayerTwoPoint.text = " "
               }
                
            if PlayerOne.deuce == true && (PlayerOne.points - PlayerTwo.points == 0)
               {
                
                PlayerOne.points = 3
                PlayerOnePoint.text = "DC"
                PlayerTwoPoint.text = "DC"
                PlayerTwo.points = 3
                totalDeuces = totalDeuces + 1
               }
            

            
        if PlayerOne.deuce == false
                
            {// non deuce scenario
            
            if PlayerOne.points == 1
            { // If reaches 1 point
                if PlayerOne.games == 6 && PlayerTwo.games == 6
                {
                    PlayerOnePoint.text = "1"
                }
                else
                {
                    PlayerOnePoint.text = "15"
                }
            }
            
            if PlayerOne.points == 2
             // If reaches 2 points
            {
                
               if PlayerOne.games == 6 && PlayerTwo.games == 6
               {
                PlayerOnePoint.text = "2"
               }
              else
                {
                PlayerOnePoint.text = "30"
                }
            }
            
            if PlayerOne.points == 3
            { // If reaches 3 points
                
                if PlayerOne.games == 6 && PlayerTwo.games == 6
                {
                    PlayerOnePoint.text = "3"
                }
                else
                {
                    if PlayerTwo.points == 3
                    {
                    PlayerOnePoint.text = "40"
                    totalDeuces = totalDeuces + 1
                    }
                    else
                    {
                       PlayerOnePoint.text = "40"
                    }
                }
                
            }
            
            
            if PlayerOne.points == 4 && (PlayerOne.games < 6 || PlayerTwo.games < 6)
            
            {
    
                if PlayerTwo.points < 3
                {
                    
                    
                // If reaches 4 points not on tie break
                
                    
                PlayerOne.winGame()
                Match1.setsArray[Match1.ActiveSet][0] = PlayerOne.games
                PlayerTwo.loseGame()
                PlayerOnePoint.text = String(PlayerOne.points)
                PlayerTwoPoint.text = String(PlayerTwo.points)

                    
                if PlayerOne.server == true
                    {
                        PlayerOneNameLabel.textColor = UIColor.red
                        PlayerTwoNameLabel.textColor = UIColor.black
                    }
                else
                    {
                        
                        PlayerTwoNameLabel.textColor = UIColor.red
                        PlayerOneNameLabel.textColor = UIColor.black
                    }
                }
                
                if PlayerTwo.points == 3
                {
                    PlayerOne.deuce = true
                    PlayerTwo.deuce = true
                    PlayerOnePoint.text = "Ad"
                    PlayerTwoPoint.text = " "
                }
                
                
            }
            
            
            if PlayerOne.points == 4 && (PlayerOne.games == 6 && PlayerTwo.games == 6)
            { // If reaches 4 points
                PlayerOnePoint.text = "4"
            }
            
            
            if PlayerOne.points == 5
            { // If reaches 5 points
                PlayerOnePoint.text = "5"
            }
            
            
            if PlayerOne.points == 6
            { // If reaches 6 points
                PlayerOnePoint.text = "6"
            }
            
            
            if PlayerOne.points >= 7 && PlayerOne.points - PlayerTwo.points == 2
            {
                
                PlayerOne.winGame()
              Match1.setsArray[Match1.ActiveSet][0] = PlayerOne.games
                PlayerTwo.loseGame()
                PlayerOnePoint.text = String(PlayerOne.points)
                PlayerTwoPoint.text = String(PlayerTwo.points)
                
                
                if PlayerOne.server == true
                {
                    PlayerOneNameLabel.textColor = UIColor.red
                    PlayerTwoNameLabel.textColor = UIColor.black
                }
                else
                {
                    
                    PlayerTwoNameLabel.textColor = UIColor.red
                    PlayerOneNameLabel.textColor = UIColor.black
                }
            }
            else
                {
                    PlayerOnePoint.text = String(PlayerOne.points)
                }
            
            
            
           
                
            if PlayerOne.games == 6 && PlayerTwo.games < 5
                    {
                        PlayerOne.games = 0
                        PlayerTwo.games = 0
                        PlayerOne.sets = PlayerOne.sets + 1
                        Match1.ActiveSet = Match1.ActiveSet + 1
                     }
                
            if PlayerOne.games == 7
                   {
                   
                    PlayerOne.games = 0
                    PlayerTwo.games = 0
                    PlayerOne.sets = PlayerOne.sets + 1
                    Match1.ActiveSet = Match1.ActiveSet + 1
                   }
            } // Close non deuce scenario
            
            //Set picture and stats to the player who won previous point
            
            LabelOne.text = PlayerOne.name
            LabelTwo.text = String(PlayerOne.age)
            LabelThree.text = String(PlayerOne.rank)
            PlayerImage.image = PlayerOne.image
            
           

    

    }
        //Close if P1 wins C.4
    
         if PlayerOneRankCalc < PlayerTwoRankCalc
            
            
    
            ///////////////////////////////
            
            
            
            
            //Scenario where PLAYERTWO wins point
        
        { //O.5 P2 wins
           
            PlayerTwo.points = PlayerTwo.points + 1
            PlayerTwo.totalPoints = PlayerTwo.totalPoints + 1
            
            if PlayerTwo.deuce == true && (PlayerTwo.points - PlayerOne.points == 2)
            {
                PlayerTwo.winGame()
                Match1.setsArray[Match1.ActiveSet][1] = PlayerTwo.games
                PlayerOne.loseGame()
                PlayerTwoPoint.text = String(PlayerTwo.points)
                PlayerOnePoint.text = String(PlayerOne.points)
                totalDeuces = 0
                
                if PlayerOne.server == true
                {
                    PlayerOneNameLabel.textColor = UIColor.red
                    PlayerTwoNameLabel.textColor = UIColor.black
                }
                else
                {
                    
                    PlayerTwoNameLabel.textColor = UIColor.red
                    PlayerOneNameLabel.textColor = UIColor.black
                }
                
            }
            
            if PlayerTwo.deuce == true && (PlayerTwo.points - PlayerOne.points == 1)
            {
                
                PlayerTwo.points = 4
                PlayerTwoPoint.text = "Ad"
                PlayerOnePoint.text = " "
                PlayerOne.points = 3
            }
            
            if PlayerTwo.deuce == true && (PlayerOne.points - PlayerTwo.points == 0)
            {
                
                PlayerTwo.points = 3
                PlayerTwoPoint.text = "DC"
                PlayerOnePoint.text = "DC"
                PlayerOne.points = 3
                totalDeuces = totalDeuces + 1
            }
            
            
            
            if PlayerOne.deuce == false
                
            {// non deuce scenario
            
            
            if PlayerTwo.points == 1
            { // If reaches 1 point
                if PlayerOne.games == 6 && PlayerTwo.games == 6
                {
                    PlayerTwoPoint.text = "1"
                }
                else
                {
                    PlayerTwoPoint.text = "15"
                }
            }
            
            if PlayerTwo.points == 2
                // If reaches 2 points
            {
                
                if PlayerOne.games == 6 && PlayerTwo.games == 6
                {
                    PlayerTwoPoint.text = "2"
                }
                else
                {
                    PlayerTwoPoint.text = "30"
                }
            }
            
            if PlayerTwo.points == 3
            { // If reaches 3 points
                
                if PlayerOne.games == 6 && PlayerTwo.games == 6
                {
                    PlayerTwoPoint.text = "3"
                }
                else
                {
                    if PlayerOne.points == 3
                    {
                    totalDeuces = totalDeuces + 1
                    PlayerTwoPoint.text = "40"
                    }
                    else
                    {
                    PlayerTwoPoint.text = "40"
                    }
                }
                
            }
    
    
    
            if PlayerTwo.points == 4 && (PlayerOne.games < 6 || PlayerTwo.games < 6)
            
            { // If reaches 4 points not on tie break
                
                if PlayerOne.points < 3
                    
                {
                    
                PlayerTwo.winGame()
              Match1.setsArray[Match1.ActiveSet][1] = PlayerTwo.games
                PlayerOne.loseGame()
                PlayerOnePoint.text = String(PlayerOne.points)
                PlayerTwoPoint.text = String(PlayerTwo.points)
               
             
                    
                    if PlayerOne.server == true
                    {
                        PlayerOneNameLabel.textColor = UIColor.red
                        PlayerTwoNameLabel.textColor = UIColor.black
                    }
                    else
                    {
                        
                        PlayerTwoNameLabel.textColor = UIColor.red
                        PlayerOneNameLabel.textColor = UIColor.black
                    }
                
            }
                if PlayerOne.points == 3
                {
                    PlayerOne.deuce = true
                    PlayerTwo.deuce = true
                    PlayerTwo.points = 4
                    PlayerTwoPoint.text = "Ad"
                    PlayerOnePoint.text = " "
                    PlayerOne.points = 3
                }


            
            if PlayerTwo.points == 4 && (PlayerOne.games == 6 && PlayerTwo.games == 6)
            { // If reaches 4 points
                PlayerTwoPoint.text = "4"
            }
            
                }
                
            
            if PlayerTwo.points == 5
            { // If reaches 5 points
                PlayerTwoPoint.text = "5"
            }
            
            
            if PlayerTwo.points == 6
            { // If reaches 6 points
                PlayerTwoPoint.text = "6"
            }
            
            
            if PlayerTwo.points >= 7 && PlayerTwo.points - PlayerOne.points == 2
            {
                PlayerTwo.winGame()
                Match1.setsArray[Match1.ActiveSet][1] = PlayerTwo.games
                PlayerOne.loseGame()
                PlayerOnePoint.text = String(PlayerOne.points)
                PlayerTwoPoint.text = String(PlayerTwo.points)
                
                if PlayerOne.server == true
                {
                    PlayerOneNameLabel.textColor = UIColor.red
                    PlayerTwoNameLabel.textColor = UIColor.black
                }
                else
                {
                    
                    PlayerTwoNameLabel.textColor = UIColor.red
                    PlayerOneNameLabel.textColor = UIColor.black
                }
    }
    
    else
    {
    PlayerOnePoint.text = String(PlayerOne.points)
    }

    

            if PlayerTwo.games == 6 && PlayerOne.games < 5
            {
                PlayerOne.games = 0
                PlayerTwo.games = 0
                PlayerTwo.sets = PlayerTwo.sets + 1
                Match1.ActiveSet = Match1.ActiveSet + 1
            }
            
            if PlayerTwo.games == 7
            {
                
                PlayerOne.games = 0
                PlayerTwo.games = 0
                PlayerTwo.sets = PlayerTwo.sets + 1
                Match1.ActiveSet = Match1.ActiveSet + 1
            }
            
            
            //Set picture and stats to the player who won previous point
            
            LabelOne.text = PlayerTwo.name
            LabelTwo.text = String(PlayerTwo.age)
            LabelThree.text = String(PlayerTwo.rank)
            PlayerImage.image = PlayerTwo.image
            
            }
            
        } //C.5 Player 2 wins
        
        Set1P1.text = String(Match1.setsArray[0][0])
        Set1P2.text = String(Match1.setsArray[0][1])
        Set2P1.text = String(Match1.setsArray[1][0])
        Set2P2.text = String(Match1.setsArray[1][1])
        Set3P1.text = String(Match1.setsArray[2][0])
        Set3P2.text = String(Match1.setsArray[2][1])
        Set4P1.text = String(Match1.setsArray[3][0])
        Set4P2.text = String(Match1.setsArray[3][1])
        Set5P1.text = String(Match1.setsArray[4][0])
        Set5P2.text = String(Match1.setsArray[4][1])
        
        //testing
//var boolTest = Int(PlayerOne.deuce)
        
      // NSLog("Play1 Total is %i", PlayerOne.totalPoints)
        //NSLog("deuce P1 is %i", boolTest)
      // NSLog("Play2 Total is %i", PlayerTwo.totalPoints)
         //NSLog("Deuce %i", totalDeuces)
       print(PlayerOnePoint.text)
  //  NSLog("Play2 current is %i", PlayerTwo.points)
     
      
  NSLog("Active Set is %i", Match1.ActiveSet)
        NSLog("Set2P1 Array is %i", Match1.setsArray[Match1.ActiveSet][0])
        
    } //Close Play Point O.3
    

} // Close View controller 0.1

