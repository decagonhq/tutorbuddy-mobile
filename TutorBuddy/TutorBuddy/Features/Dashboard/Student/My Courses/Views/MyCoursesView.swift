//
//  MyCoursesView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 20/09/2022.
//

import UIKit

class MyCoursesView: BaseView {
    
    var viewModel: IDashBoardViewModel?
    fileprivate var myCourses: [MyCourse] {
        viewModel?.myCourses ?? []
    }
    
    lazy var myCoursesTableView = UITableView(cell: MyCourseTableViewCell.self, delegate: self, datasource: self)
    
    override func setup() {
        super.setup()
        setBackgroundColor(.clear)
        addSubview(myCoursesTableView)
        myCoursesTableView.fillSuperview(padding: ._init(allEdges: 20))
        setupBindings()
    }
    
    func setupBindings() {
        viewModel?.showMyCourses.bind { [weak self] show in
            if show {
                self?.showMyCourses()
            }
        }.disposed(by: disposeBag)
    }
    
    fileprivate func showMyCourses() {
        with(myCoursesTableView) {
            if myCourses.isEmpty {
                $0.setEmptyMessage(.NO_DATA_FOUND)
            } else {
                $0.restore()
            }
            $0.setContentOffset(.zero, animated: true)
            $0.reloadData()
        }
    }
}

extension MyCoursesView: UITableViewConformable {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = myCourses[indexPath.row]
        return tableView.deque(cell: MyCourseTableViewCell.self, at: indexPath).apply {
            $0.configure(with: course, status: .inProgress, action: nil)
        }
//        return tableView.deque(cell: MyCourseTableViewCell.self, at: indexPath).apply {
//            $0.configure(with:
//                            RecommendedSubject(
//                                id: nil,
//                                subject: "Chemistry for beginners: 30 days perfection",
//                                thumbnail: "https://res.cloudinary.com/djrjrb0a4/image/upload/v1659757360/iOS-Apple_kans4s.jpg", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. At nibh quam odio sit vestibulum sagittis urna.",
//                                tutorSubjectId: nil,
//                                tutor: "Kolawole Folahanmi",
//                                tutorImage: "",
//                                rating: 5,
//                                userCount: 10
//                            ),
//                         status: .inProgress,
//                         action: nil
//            )
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        330
    }
}
