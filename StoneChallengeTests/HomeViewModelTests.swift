//
//  HomeViewModelTests.swift
//  StoneChallengeTests
//
//  Created by Júlio Garavelli on 02/07/23.
//

import XCTest
@testable import StoneChallenge

class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel?
    
    override func setUp() {
        let service = MockCharacterService()
        viewModel = HomeViewModel(service: service)
    }
    
    override func tearDown() {
        viewModel = nil
    }

    func testGetCharacterInWillAppear() {
        XCTAssertEqual(viewModel?.character.count, 0)
        viewModel?.viewWillAppear()
        XCTAssertEqual(viewModel?.character.count, 20)
    }
    
    func testDidTapFilterAlive() {
        viewModel?.viewWillAppear()

        XCTAssertEqual(viewModel?.character.count, 20)
        XCTAssertEqual(viewModel?.filteredCharacter.count, 20)

        // Filter alive
        viewModel?.didTapButton(1)

        XCTAssertEqual(viewModel?.character.count, 20)
        XCTAssertEqual(viewModel?.filteredCharacter.count, 8)
    }

    func testDidTapFilterDead() {
        viewModel?.viewWillAppear()

        XCTAssertEqual(viewModel?.character.count, 20)
        XCTAssertEqual(viewModel?.filteredCharacter.count, 20)

        // Filter Dead
        viewModel?.didTapButton(2)

        XCTAssertEqual(viewModel?.character.count, 20)
        XCTAssertEqual(viewModel?.filteredCharacter.count, 6)
    }

    func testDidTapFilterUnknown() {
        viewModel?.viewWillAppear()

        XCTAssertEqual(viewModel?.character.count, 20)
        XCTAssertEqual(viewModel?.filteredCharacter.count, 20)

        // Filter Unknown
        viewModel?.didTapButton(3)

        XCTAssertEqual(viewModel?.character.count, 20)
        XCTAssertEqual(viewModel?.filteredCharacter.count, 6)
    }

    func testDidTapFilterInvalidFilter() {
        viewModel?.viewWillAppear()

        XCTAssertEqual(viewModel?.character.count, 20)
        XCTAssertEqual(viewModel?.filteredCharacter.count, 20)

        // Filter Dead
        viewModel?.didTapButton(0)

        XCTAssertEqual(viewModel?.character.count, 20)
        XCTAssertEqual(viewModel?.filteredCharacter.count, 20)
    }
    
    func testSearchFilterName() {
        viewModel?.viewWillAppear()

        viewModel?.searchBar(UISearchBar(), textDidChange: "rick")
        
        XCTAssertEqual(viewModel?.filterName, "rick")
        XCTAssertEqual(viewModel?.filteredCharacter.count, 4)
    }
    
    func testReloadCollectionViewCalled() {
        let expectation = expectation(description: "reloadCollectionView called")

        viewModel?.reloadCollectionView = {
            expectation.fulfill()
        }

        viewModel?.filter = .alive

        wait(for: [expectation], timeout: 0.1)
    }

    func testPageRefreshingCalled() {
        let expectation = expectation(description: "pageRefreshing called")

        viewModel?.pageRefreshing = {
            expectation.fulfill()
        }

        viewModel?.scrollViewDidScroll(UIScrollView())

        wait(for: [expectation], timeout: 0.1)
    }

    func testHideKeyboardCalled() {
        let expectation = expectation(description: "hideKeyboard called")

        viewModel?.hideKeyboard = {
            expectation.fulfill()
        }

        viewModel?.searchBarSearchButtonClicked(UISearchBar())

        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGoToDetail() {
        let coordinator = MockHomeCoordinator()

        viewModel?.coordinatorDelegate = coordinator

        viewModel?.viewWillAppear()

        viewModel?.collectionView(UICollectionView(frame: .zero,
                                                   collectionViewLayout: UICollectionViewFlowLayout()),
                                  didSelectItemAt: IndexPath(row: 0, section: 0))

        XCTAssertNotNil(coordinator.characterDetail)
        XCTAssertEqual(coordinator.characterDetail, viewModel?.filteredCharacter[0])
    }
}

class MockHomeCoordinator: HomeCoordinatorDelegate {

    var characterDetail: CharacterModel?

    func goToDetail(with characterDetail: CharacterModel) {
        self.characterDetail = characterDetail
    }
}
