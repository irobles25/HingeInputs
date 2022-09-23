//
//  PronounListView.swift
//  HingeInputs
//
//  Created by Irvin Robles on 9/22/22.
//

import SwiftUI

struct PronounListView: View {
    @State var selectedPronouns: [Pronoun]
    @State var pronounList: [Pronoun]
    @State var switchIsOn: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(selectedPronouns) { pronoun in
                        Button(
                            action: {
                                if selectedPronouns.contains(pronoun) {
                                    selectedPronouns = selectedPronouns.filter { $0 != pronoun }
                                } else {
                                    selectedPronouns.append(pronoun)
                                }
                            },
                            label: {
                                HStack {
                                    Text(pronoun.title)
                                        .foregroundColor(.white)
                                    Image("closeIcon")
                                        .renderingMode(.template)
                                        .foregroundColor(.white)
                                }
                            }
                        )
                        .padding(10)
                        .background(Color.gray)
                        .clipShape(Capsule())
                    }
                }
                .padding(.horizontal)
                .frame(height: 50)
            }
            
            List(pronounList) { pronoun in
                Button(
                    action: {
                        if selectedPronouns.contains(pronoun) {
                            selectedPronouns = selectedPronouns.filter { $0 != pronoun }
                        } else {
                            selectedPronouns.append(pronoun)
                        }
                    }, label: {
                        HStack {
                            Text(pronoun.title)
                                .foregroundColor(.black)
                            Spacer()
                            Rectangle()
                                .frame(width: 15, height: 15)
                                .foregroundColor(selectedPronouns.contains(pronoun) ? .black : .gray)
                                .clipShape(Circle())
                        }
                    }
                )
                .clipShape(Rectangle())
            }
            .colorMultiply(.white)
            
            Toggle("", isOn: $switchIsOn)
                .labelsHidden()
                .padding(.horizontal)
        }
    }
}

struct PronounListView_Previews: PreviewProvider {
    static var previews: some View {
        PronounListView(
            selectedPronouns: [],
            pronounList: Pronoun.testGroup1
        )
    }
}
