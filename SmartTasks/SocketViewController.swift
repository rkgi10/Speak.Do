//
//  SocketViewController.swift
//  SmartTasks
//
//  Created by Rohit Gurnani on 18/07/15.
//  Copyright (c) 2015 Rohit Gurnani. All rights reserved.
//

import UIKit
//import Socket_IO_client_Swift

class SocketViewController: UIViewController {

    @IBOutlet weak var tlabel: UILabel!
    @IBOutlet weak var emitbtn: UIButton!
    
    let socket = SocketIOClient(socketURL: "http://hackindia-chat.mybluemix.net")
    var name:String?
    var resetAck:AckEmitter?
    let myName = ["name" : "rohit"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.socket.connect(timeoutAfter: 100){
            println("not connected")
        }
        println("working")
        self.addHandlers()
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addHandlers()
    {
//        socket.on("join"){
//            
//        }
        
        
        socket.onAny(){
            println("hey, connected , \($0.event) , \($0.items)")
        }
        
        socket.on("connect"){ data , ack in
            self.socket.emit("join", "am i connected?")
        }
        
        socket.on("response"){ data , ack in
            println("foo")
        }
        
        socket.on("ack"){ data , ack in
            println("hello")
            
        }
        
        
    }
    
    @IBAction func socketEmit(sender: AnyObject) {
        
        socket.emit("json", myName)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
