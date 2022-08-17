//
//  SimpleDoApp.swift
//  SimpleDo
//
//  Created by yury mid on 07.08.2022.
//

import SwiftUI

/*
 
 
 
 */

@main
struct SimpleDoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
