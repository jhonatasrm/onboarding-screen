//
//
//

import UIKit

class HomeController: UIViewController {
	
	let text: UILabel = {
		let text = UILabel()
		text.text = "Home Page"
		text.textColor = .black
		text.baselineAdjustment = UIBaselineAdjustment.alignCenters
		text.font = UIFont.boldSystemFont(ofSize: 40)
		text.textAlignment = .center
		text.translatesAutoresizingMaskIntoConstraints = false
		return text
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		setupConstraints()
	}
	
	func setupConstraints(){
		view.addSubview(text)
		
		NSLayoutConstraint.activate([
			text.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			text.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			text.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height/3),
			text.widthAnchor.constraint(equalToConstant: view.frame.width),
			text.heightAnchor.constraint(equalToConstant: 100)
			])
	}
}