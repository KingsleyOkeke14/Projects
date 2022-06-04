//
//  EmployeeDetailVC.swift
//  squareProjectUIKit
//
//  Created by Kingsley Okeke on 2021-07-26.
//

import UIKit
import SwiftUI
import SDWebImage

class EmployeeDetailViewController: UIViewController {

    
    var employee: Employee? {
        didSet { configureEmployee() }
    }
    
    //MARK: - View
    
    private let sfSymbolConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .default)
    
    private let copySymbolConfig = UIImage.SymbolConfiguration(pointSize: 12, weight: .bold, scale: .default)
    
    private lazy var userimageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.setDimensions(width: 200, height: 200)
        iv.layer.cornerRadius = 200 / 2
        iv.backgroundColor = UIColor.gray
        return iv
    }()
     
    private lazy var nameLabel: UILabel = {
       let nl = UILabel()
        nl.font = UIFont.boldSystemFont(ofSize: 26)
        nl.textColor = .white
        return nl
    }()
    
    private lazy var teamSymbol: UIImageView = {
        let ts = UIImageView(image: UIImage(systemName: "person.3.fill", withConfiguration: sfSymbolConfig)!)
        ts.tintColor = .gray
        return ts
    }()
    
    private lazy var teamLabel: PaddingLabel = {
        let tl = PaddingLabel(withInsets: 0, 0, 4, 4)
        tl.font = UIFont.boldSystemFont(ofSize: 20)
        tl.textColor = .white
        tl.backgroundColor = .gray
        tl.layer.cornerRadius = 8
        tl.layer.masksToBounds = true
        
        return tl
    }()
    
    private lazy var employeeTypeLabel: UILabel = {
       let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 20)
        tl.textColor = .white
        return tl
    }()
 
    private lazy var emailLabel: UILabel = {
       let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 20)
        tl.textColor = .white
        return tl
    }()
    
    private lazy var phoneLabel: UILabel = {
       let pl = UILabel()
        pl.font = UIFont.systemFont(ofSize: 20)
        pl.textColor = .white
        return pl
    }()
    
    private lazy var emailButton: UIButton = {
        let eb = UIButton()
        eb.setImage(UIImage(systemName: "envelope", withConfiguration: sfSymbolConfig), for: .normal)
        //eb.backgroundColor = .blue
        return eb
    }()
    
    private lazy var callButton: UIButton = {
        let cb = UIButton()
        cb.setImage(UIImage(systemName: "phone.circle", withConfiguration: sfSymbolConfig), for: .normal)
        return cb
    }()
    
    private lazy var copyImage: UIImage = {
       let ci = UIImage(systemName: "doc.on.doc", withConfiguration: copySymbolConfig)!
        return ci
    }()
    
    private lazy var copyEmailButton: UIButton = {
        let ceb = UIButton()
        ceb.setImage(copyImage, for: .normal)
        ceb.tintColor = .gray
        return ceb
    }()

    private lazy var copyPhoneButton: UIButton = {
        let cpb = UIButton()
        cpb.setImage(copyImage, for: .normal)
        cpb.tintColor = .gray
        return cpb
    }()
    
    private lazy var biographyTextView: UITextView = {
        let bio = UITextView()
        bio.font = UIFont.systemFont(ofSize: 26)
        bio.textColor = .white
        bio.isScrollEnabled = false
        bio.backgroundColor = .clear
        bio.isEditable = false
        return bio
    }()
    
    private lazy var jobInfoStack: UIStackView = {
       let st = UIStackView(arrangedSubviews: [teamSymbol, teamLabel, employeeTypeLabel])
        st.axis = .horizontal
        st.spacing = 8
        return st
    }()
    
    private lazy var emailStack: UIStackView = {
       let es = UIStackView(arrangedSubviews: [emailButton, emailLabel, copyEmailButton])
        es.axis = .horizontal
        es.spacing = 8
        return es
    }()
    
    private lazy var phoneStack: UIStackView = {
       let ps = UIStackView(arrangedSubviews: [callButton, phoneLabel, copyPhoneButton])
        ps.axis = .horizontal
        ps.spacing = 8
        return ps
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        configureViewAndConstraints()
        configureEmployee()
    }
    
    
    
    //MARK: - Helpers
    func configureEmployee() {
        guard let employee = employee else { return }
        nameLabel.text = employee.fullName
        teamLabel.text = employee.team
        employeeTypeLabel.text = employee.employeeType
        emailLabel.text = employee.emailAddress
        phoneLabel.text = employee.phoneNumber
        userimageView.sd_setImage(with: URL(string: employee.photoUrlSmall))
        biographyTextView.text = employee.biography
    }
    
    func configureViewAndConstraints()  {
        let mainStack = UIStackView(arrangedSubviews: [userimageView, nameLabel, jobInfoStack, emailStack, phoneStack, biographyTextView])
        mainStack.axis = .vertical
        mainStack.alignment = .center
        mainStack.distribution = .fill
        mainStack.spacing = 2
        view.addSubview(mainStack)
        mainStack.centerY(inView: view)
        mainStack.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 12, paddingRight: 12)
           
    }
}

#if DEBUG
struct MYTestPreviewViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            EmployeeDetailViewController()
        }
    }
}
#endif
