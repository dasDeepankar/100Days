//
//  ContentView.swift
//  BucketList
//
//  Created by Deepankar Das on 12/11/25.
//

import LocalAuthentication
import SwiftUI

struct auth {
    var name : String
    var icon : String
}
struct ContentView: View {
    @State private var isUnLocked = false
    
    private var authText : auth {
        if (isUnLocked){
           return auth(name: "Unlocked", icon: "lock.open.fill")
        }
        else {
            return auth(name: "Locked", icon: "lock.fill")
        }
    }
    
    var body: some View {
        VStack{
            Label(authText.name, systemImage: authText.icon)
                .animation(.bouncy, value: isUnLocked)
        }
    }
    
    func authenicate()  {
        let context = LAContext()
        var error: NSError?
        
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
             context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason ){ sucess, authenicatationError in
                 if sucess{
                     // authenticated successfully
                     isUnLocked = true
                 } else{
                     // there was a problem
                     isUnLocked = false
                 }
                
            }
        }
        else{
            isUnLocked = false
            // no biomatrics
        }
        
    }
}

#Preview {
    ContentView()
}
