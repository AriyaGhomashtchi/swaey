//
//  ContentView.swift
//  swæy
//
//  Created by Ariya Ghomashtchi on 21.06.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel : SwaeyViewModel
    var body: some View {
      TestView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SwaeyViewModel())
    }
}
