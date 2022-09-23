//
//  AppDelegate.swift
//  HingeInputs
//

import SwiftUI

@main
struct Menu: App {
    var body: some Scene {
        WindowGroup {
            PronounListView(
                selectedPronouns: [],
                pronounList: Pronoun.testGroup1
            )
        }
    }
}

