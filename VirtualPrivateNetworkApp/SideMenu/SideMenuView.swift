//
//  SideMenuView.swift
//  VirtualPrivateNetworkApp
//
//  Created by Иван Свирский on 15.08.24.
//

import SwiftUI

enum SideMenuRowType: Int, CaseIterable{
    case term = 0
    case privacy
    case faq
    case share
    
    var title: String{
        switch self {
        case .term:
            return "Terms and condition"
        case .privacy:
            return "Privacy Policy"
        case .faq:
            return "FAQ"
        case .share:
            return "Share this app"
        }
    }
    
    var iconName: String{
        switch self {
        case .term:
            return "document"
        case .privacy:
            return "lock"
        case .faq:
            return "help"
        case .share:
            return "share"
        }
    }
}

struct SideMenuView: View {
    
    @Binding var presentSideMenu: Bool
    @State private var selectedMenuItem: SideMenuRowType? = nil
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 270)
                        .shadow(color: .purple.opacity(0.1), radius: 5, x: 0, y: 3)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(SideMenuRowType.allCases, id: \.self) { row in
                            if row.rawValue == 3 {
                                VStack(alignment: .leading) {
                                    Divider().background(Color.greyDivider).padding()
                                    RowView(imageName: row.iconName, title: row.title) {
                                        selectedMenuItem = row
                                        presentSideMenu.toggle()
                                    }
                                }
                            } else {
                                NavigationLink(
                                    destination: InfoScreen(title: getInfoTitle(rowType: row), bodyText: getInfoContent(rowType: row)),
                                    isActive: .constant(selectedMenuItem == row),
                                    label: {
                                        
                                    
                                        RowView(imageName: row.iconName, title: row.title) {
                                            selectedMenuItem = row
                                            presentSideMenu.toggle()
                                        }
                                    }
                                )
                                .padding(.bottom, 12)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 100)
                    .frame(width: 270)
                    .background(Color.white)
                }
                
                Spacer()
            }
            .background(.clear)
        }
    }
    
    func getInfoContent(rowType:SideMenuRowType)->String {
        switch rowType{
            
        case .term:
            return InfoTextResources.termAndCondition
        case .privacy:
            return InfoTextResources.privacyPolicyBody
        case .faq:
            return InfoTextResources.faq
        case .share:
            return ""
        }
    }
    
    
    func getInfoTitle(rowType:SideMenuRowType)->String {
        switch rowType{
            
        case .term:
            return InfoTextResources.termAndConditionTitle
        case .privacy:
            return InfoTextResources.privacyPolicyTitle
        case .faq:
            return InfoTextResources.faqTitle
        case .share:
            return ""
        }
    }
    
    
    func RowView(imageName: String, title: String, hideDivider: Bool = false, action: @escaping () -> ()) -> some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                HStack(spacing: 20) {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 5)
                    
                    ZStack {
                        Image(imageName)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.gray)
                            .frame(width: 26, height: 26)
                    }
                    .frame(width: 30, height: 30)
                    
                    Text(title)
                        .font(.custom("Montserrat", size: 17))
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
            }
        }
        .frame(height: 50)
        .background(
            LinearGradient(colors: [.white, .white], startPoint: .leading, endPoint: .trailing)
        )
    }
}




