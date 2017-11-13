//
//
//

import UIKit

class IntroPageCell: UICollectionViewCell {
	
	let color = UIColor(white: 0.2, alpha: 1)
	
	let imageView: UIImageView = {
		let iv = UIImageView()
		iv.contentMode = .scaleAspectFill
		iv.clipsToBounds = true
		iv.translatesAutoresizingMaskIntoConstraints = false
		return iv
	}()
	
	let textView: UITextView = {
		let tv = UITextView()
		tv.isEditable = false
		tv.translatesAutoresizingMaskIntoConstraints = false
		return tv
	}()
	
	let lineSeparatorView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(white: 0.9, alpha: 1)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	var page: IntroPage? {
		didSet {
			guard let page = page else {
				return
			}
			
			let imageName = page.imageName
			imageView.image = UIImage(named: imageName)
			
			let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 24) as Any, NSAttributedStringKey.foregroundColor: color])
			attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17) as Any, NSAttributedStringKey.foregroundColor: color]))
			
			let paragraphStyle = NSMutableParagraphStyle()
			paragraphStyle.alignment = .center
			let length = attributedText.string.count
			attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
			
			textView.attributedText = attributedText
		}
	}
	
	func setupConstraints() {
		addSubview(imageView)
		addSubview(textView)
		addSubview(lineSeparatorView)
		
		NSLayoutConstraint.activate([
			textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
			textView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			textView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			textView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
			])
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			imageView.bottomAnchor.constraint(equalTo: textView.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
			])
		NSLayoutConstraint.activate([
			lineSeparatorView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			lineSeparatorView.bottomAnchor.constraint(equalTo: textView.topAnchor),
			lineSeparatorView.heightAnchor.constraint(equalToConstant: 1)
			])
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
