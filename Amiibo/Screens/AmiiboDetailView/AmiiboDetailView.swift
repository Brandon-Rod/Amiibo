//
//  AmiiboDetailView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 9/28/21.
//

import SwiftUI

struct AmiiboDetailView: View {
    
    let amiibo: Amiibo
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .center, spacing: 10) {
                
                AmiiboRemoteImage(urlString: amiibo.image)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                
                Divider()
                
                HStack {
                    
                    AmiiboInfoView(amiibo: amiibo)
                    
                    Spacer()
                    
                }
                
                HStack {
                    
                    AmiiboReleaseDate(amiibo: amiibo)
                    
                    Spacer()
                    
                }
                
            }
            .padding()
            
        }
        .navigationTitle(amiibo.name)
        
    }
    
}

struct AmiiboDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboDetailView(amiibo: MockData.sampleAmiibo)
    }
}

struct AmiiboTitleView: View {
    
    var text: String
    
    var body: some View {
        
        Text(text)
            .font(.title)
            .padding(10)
            .background(Color.brandPrimary)
            .cornerRadius(10)
        
    }
    
}

struct AmiiboInfoView: View {
    
    let amiibo: Amiibo
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            AmiiboTitleView(text: "Info")
            
            Text("Name: ") + Text(amiibo.name).foregroundColor(.brandPrimary)
            
            Text("Game Series: ") + Text(amiibo.gameSeries).foregroundColor(.brandPrimary)
            
            Text("Amiibo Series: ") + Text(amiibo.amiiboSeries).foregroundColor(.brandPrimary)
            
            Text("Type: ") + Text(amiibo.type).foregroundColor(.brandPrimary)
            
        }
        
    }
    
}

struct AmiiboReleaseDate: View {
    
    let amiibo: Amiibo
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            AmiiboTitleView(text: "Release Date")
            
            Text("Australia: ") + Text(amiibo.release.auText).foregroundColor(.brandPrimary)
            
            Text("Europe: ") + Text(amiibo.release.euText).foregroundColor(.brandPrimary)
            
            Text("Japan: ") + Text(amiibo.release.jpText).foregroundColor(.brandPrimary)
                        
            Text("North America: ") + Text(amiibo.release.naText).foregroundColor(.brandPrimary)
                        
        }
        
    }
    
}
