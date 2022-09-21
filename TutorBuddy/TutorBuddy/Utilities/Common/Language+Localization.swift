//
//  Language.swift
//  TutorBuddy
//

import Foundation

enum Language: String, CaseIterable, Codable {
    case english = "English (EN)", french = "French (FR)"
    
    var code: String {
        switch self {
        case .english:
            return "en"
        case .french:
            return "fr"
        }
    }
}

extension String {
    
    var localized: String {
        let path = Bundle.main.path(forResource: preference.language.code, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
    static var WELCOME: String { "WelcomeKey".localized }
    static var LOREM_IPSUM: String { "LoremIpsumKey".localized }
    static var LOGIN: String { "LoginKey".localized }
    static var EMAIL: String { "EmailKey".localized }
    static var ENTER_EMAIL: String { "EnterEmailKey".localized }
    static var ENTER_PASSWORD: String { "EnterPasswordKey".localized }
    static var TITLE: String { "TitleKey".localized }
    static var WHAT_WOULD_YOU_LIKE_TO_LEARN_TODAY: String { "WhatWouldYouLikeToLearnTodayKey".localized }
    static var SEARCH: String { "SearchKey".localized }
    static var FORGOT_PASSWORD: String { "ForgotPasswordKey".localized }
    static var DONT_HAVE_AN_ACCOUNT: String { "DontHaveAnAccountKey".localized }
    static var SIGN_UP: String { "SignUpKey".localized }
    static var CREATE_AN_ACCOUNT: String { "CreateAnAccountKey".localized }
    static var CREATE_AN_ACCOUNT_SO_THAT_YOUR_LEARNING_AND_PROGRESS_ARE_NEVER_LOST: String { "CreateAnAccountSoThatYourLearningAndProgressAreNeverLostKey".localized }
    static var YOUR_FULL_NAME: String { "YourFullNameKey".localized }
    static var YOUR_EMAIL_ADDRESS: String { "YourEmailAddressKey".localized }
    static var YOUR_PASSWORD: String { "YourPasswordKey".localized }
    static var ALREADY_HAVE_AN_ACCOUNT: String { "AlreadyHaveAnAccountKey".localized }
    static var CREATE_YOUR_ACCOUNT_TO_CONNECT_WITH_STUDENTS: String { "CreateYourAccountToConnectWithStudentsKey".localized }
    static var TELL_US_ABOUT_YOURSELF: String { "TellUsAboutYourselfKey".localized }
    static var SELECT: String { "SelectKey".localized }
    static var UPLOAD_PROFILE_PICTURE: String { "UploadProfilePictureKey".localized }
    static var CHOOSE: String { "ChooseKey".localized }
    static var AVAILABILITY: String { "AvailabilityKey".localized }
    static var SUBJECTS: String { "SubjectsKey".localized }
    static var WELCOME_TO: String { "WelcomeToKey".localized }
    static var WE_CREATED_A_PERSONAL_ACCOUNT_FOR_YOU: String { "WeCreatedAPersonalAccountForYouKey".localized }
    static var LETS_GO: String { "LetsGoKey".localized }
    static var RESET_PASSWORD: String { "ResetPasswordKey".localized }
    static var ENTER_THE_EMAIL_ASSOCIATED_WITH_YOUR_ACCOUNT: String { "EnterTheEmailAssociatedWithYourAccountKey".localized }
    static var ENTER_YOUR_EMAIL: String { "EnterYourEmailKey".localized }
    static var CHECK_YOUR_MAIL: String { "CheckYourMailKey".localized }
    static var WE_HAVE_SENT_PASSWORD_RECOVERY_INSTRUCTIONS: String { "WeHaveSentPasswordRecoveryInstructionsKey".localized }
    static var OPEN_EMAIL_APP: String { "OpenEmailAppKey".localized }
    static var CREATE_NEW_PASSWORD: String { "CreateNewPasswordKey".localized }
    static var NEW_PASSWORD: String { "NewPasswordKey".localized }
    static var CONFIRM_PASSWORD: String { "ConfirmPasswordKey".localized }
    static var HOW_WOULD_YOU_WANT_TO_USE_THIS_APP : String { "HowWouldYouWantToUseThisAppKey".localized }
    static var PLEASE_SELECT_AN_OPTION: String { "PleaseSelectAnOptionKey".localized }
    static var EXPLORE: String { "ExploreKey".localized }
    static var STUDENT: String { "StudentKey".localized }
    static var TUTOR: String { "TutorKey".localized }
    static var TUTOR_BUDDY: String { "TutorBuddyKey".localized }
    static var AREA_OF_INTEREST: String { "AreaOfInterestKey".localized }
    static var USER_TYPE: String { "UserTypeKey".localized }
    static var NO_FEATURED_TUTORS_FOUND: String { "NoFeaturedTutorsFoundKey".localized }
    static var NO_RECOMMENDED_COURSES_FOUND: String { "NoRecommendedCoursesFoundKey".localized }
    
    
    
    
    
    static var ALL_CARS: String { "AllCarsKey".localized }
    static var ONLINE: String { "OnlineKey".localized }
    static var OFFLINE: String { "OfflineKey".localized }
    static var SEARCH_INVENTORY: String { "SearchInventoryKey".localized }
    static var CAR_LOAN_AVAILABLE: String { "CarLoanAvailableKey".localized }
    static var CAR_LOAN_NOT_AVAILABLE: String { "CarLoanNotAvailableKey".localized }
    static var APPLY_FOR_CAR_LOAN: String { "ApplyForCarLoanKey".localized }
    static var OTHER_OPTIONS: String { "OtherOptionsKey".localized }
    static var INSPECT_CAR: String { "InspectCarKey".localized }
    static var LIST: String { "ListKey".localized }
    static var DASHBOARD: String { "DashboardKey".localized }
    static var MY_INVENTORY: String { "MyInventoryKey".localized }
    static var INVENTORY: String { "InventoryKey".localized }
    static var MY_INSPECTION_REQUESTS: String { "MyInspectionRequestsKey".localized }
    static var CAR_REQUESTS: String { "CarRequestsKey".localized }
    static var LOANS: String { "LoansKey".localized }
    static var NOTIFICATIONS: String { "NotificationsKey".localized }
    static var SIGN_OUT: String { "SignOutKey".localized }
    static var HELP_SUPPORT: String { "HelpSupportKey".localized }
    static var AUCTION: String { "AuctionKey".localized }
    static var CAR_MAKE_MODEL: String { "CarMakeModelKey".localized }
    static var CAR_YEAR: String { "CarYearKey".localized }
    static var MAKE_MODEL: String { "MakeModelKey".localized }
    static var BY_CATEGORIES: String { "ByCategoriesKey".localized }
    static var CARS_CREATED_BY_ME: String { "CarsCreatedByMeKey".localized }
    static var CARS_OWNED_BY_ME: String { "CarsOwnedByMeKey".localized }
    static var CARS_WITH_LOAN: String { "CarsWithLoanKey".localized }
    static var CARS_WITHOUT_LOAN: String { "CarsWithoutLoanKey".localized }
    static var PENDING_INSPECTION: String { "PendingInspectionKey".localized }
    static var FILTERS: String { "FiltersKey".localized }
    static var APPLY_FILTERS: String { "ApplyFiltersKey".localized }
    static var UNABLE_TO_GET_MAKES: String { "UnableToGetMakesKey".localized }
    static var INVALID_YEAR: String { "InvalidYearKey".localized }
    static var APPLIED_FILTER: String { "AppliedFilterKey".localized }
    static var OPEN_REQUESTS: String { "OpenRequestsKey".localized }
    static var REQUEST_STATUS: String { "RequestStatusKey".localized }
    static var NO_CAR_REQUESTS_FOUND: String { "NoCarRequestsFoundKey".localized }
    static var UNABLE_TO_GET_STATES: String { "UnableToGetStatesKey".localized }
    static var UNABLE_TO_GET_CITIES: String { "UnableToGetCitiesKey".localized }
    static var REQUEST_DETAILS: String { "RequestDetailsKey".localized }
    static var KINDLY_FILL_DETAILS: String { "KindlyFillDetailsKey".localized }
    static var REQUESTED_ON: String { "RequestedOnKey".localized }
    static var PRICE: String { "PriceKey".localized }
    static var COLOUR: String { "ColourKey".localized }
    static var ADD_CAR: String { "AddCarKey".localized }
    static var SUBMIT: String { "SubmitKey".localized }
    static var VIN_FULL: String { "VinKey".localized }
    static var CAR_EXTERIOR_COLOUR: String { "CarExteriorColourKey".localized }
    static var YOUR_PRICE: String { "YourPriceKey".localized }
    static var UPLOAD_MULTIPLE_EXTERIOR_IMAGES: String { "UploadMultipleExteriorImagesKey".localized }
    static var APPLIED_FILTERS: String { "AppliedFiltersKey".localized }
    static var AN_ERROR_OCCURRED_TRY_AGAIN: String { "AnErrorOccurredTryAgainKey".localized }
    static var EXPECTATION: String { "ExpectationKey".localized }
    static var START_BID_PRICE: String { "StartBidPriceKey".localized }
    static var BID_ENDS_IN: String { "BidEndsInKey".localized }
    static var BID_ENDED: String { "BidEndedKey".localized }
    static var AGO: String { "AgoKey".localized }
    static var HIGHEST_BID: String { "HighestBidKey".localized }
    static var BIDS: String { "BidsKey".localized }
    static var NO_DATA_FOUND: String { "NoDataFoundKey".localized }
    static var AUCTION_DETAILS: String { "AuctionDetailsKey".localized }
    static var NEW_AUCTUION_CAR: String { "NewAuctionCarKey".localized }
    static var YOUR_EXPECTATION: String { "YourExpectationKey".localized }
    static var PROCEED_TO_AUCTION: String { "ProceedToAuctionKey".localized }
    static var CUSTOMER_INFORMATION: String { "CustomerInformationKey".localized }
    static var FIRST_NAME: String { "FirstNameKey".localized }
    static var LAST_NAME: String { "LastNameKey".localized }
    static var EMAIL_ADDRESS: String { "EmailAddressKey".localized }
    static var PHONE_NUMBER: String { "PhoneNumberKey".localized }
    static var ADDRESS: String { "AddressKey".localized }
    static var CAR_DETAILS: String { "CarDetailsKey".localized }
    static var YEAR: String { "YearKey".localized }
    static var CAR_ID: String { "CarIDKey".localized }
    static var EDIT_CAR_DETAILS: String { "EditCarDetailsKey".localized }
    static var EDIT_CAR_MEDIA: String { "EditCarMediaKey".localized }
    static var DELIST_CAR: String { "DelistCarKey".localized }
    static var EDIT_CAR: String { "EditCarKey".localized }
    static var OVERVIEW: String { "OverviewKey".localized }
    static var INSPECTION: String { "InspectionKey".localized }
    static var CAR_DESCRIPTION: String { "CarDescriptionKey".localized }
    static var KEY_FEATURES: String { "KeyFeaturesKey".localized }
    static var MARKET_VALUE: String { "MarketValueKey".localized }
    static var MILEAGE: String { "MileageKey".localized }
    static var VIEWS: String { "ViewsKey".localized }
    static var LEADS: String { "LeadsKey".localized }
    static var ENGINE_TYPE: String { "EngineTypeKey".localized }
    static var VIN: String { "VINKey".localized }
    static var TRANSMISSION: String { "TransmisionKey".localized }
    static var FUEL_TYPE: String { "FuelTypeKey".localized }
    static var DAMAGES: String { "DamagesKey".localized }
    static var ADD_INVENTORY: String { "AddInventoryKey".localized }
    static var COMPLETE_STEPS_TO_CREATE_CAR: String { "CompleteStepsToCreateCarKey".localized }
    static var CHOOSE_CUSTOMER: String { "ChooseCustomerKey".localized }
    static var CREATE_CAR: String { "CreateCarKey".localized }
    static var UPLOAD_CAR_PICTURES: String { "UploadCarPicturesKey".localized }
    static var UPLOAD_DOCUMENTS: String { "UploadDocumentsKey".localized }
    static var DONE: String { "DoneKey".localized }
    static var SEARCH_CUSTOMER: String { "SearchCustomerKey".localized }
    static var USE_CUSTOMER: String { "UseCustomerKey".localized }
    static var MARITAL_STATUS: String { "MaritalStatusKey".localized }
    static var CUSTOMER_TYPE: String { "CustomerTypeKey".localized }
    static var SINGLE: String { "SingleKey".localized }
    static var MARRIED: String { "MarriedKey".localized }
    static var INDIVIDUAL: String { "IndividualKey".localized }
    static var CORPORATE: String { "CorporateKey".localized }
    static var HOUSE_NUMBER_STREET: String { "HouseNumberAndStreetKey".localized }
    static var STATE: String { "StateKey".localized }
    static var CITY: String { "CityKey".localized }
    static var SAVE: String { "SaveKey".localized }
    static var CREATE_CUSTOMER: String { "CreateCustomerKey".localized }
    static var DEALER: String { "DealerKey".localized }
    static var INSPECTION_CENTER: String { "InspectionCenterKey".localized }
    static var REASON_FOR_SELLING: String { "ReasonForSellingCarKey".localized }
    static var CHANGE_FRANCHISE_OWNER: String { "ChangeFranchiseOwnerKey".localized }
    static var THIRD_PARTY: String { "ThirdPartyKey".localized }
    static var FRANCHISE: String { "FranchiseKey".localized }
    static var WHO_OWNS_CAR: String { "WhoOwnsCarKey".localized }
    static var CAR_PICKUP_CITY: String { "CarPickupCityKey".localized }
    static var CAR_PICKUP_LOCATION: String { "CarPickupLocationKey".localized }
    static var NO: String { "NoKey".localized }
    static var YES: String { "YesKey".localized }
    static var FIRST_OWNER: String { "FirstOwnerKey".localized }
    static var ENTER_CAR_REGISTRATION_CITY: String { "EnterCarRegistrationCityKey".localized }
    static var CAR_REGISTRATION_CITY: String { "CarRegistrationCityKey".localized }
    static var ENTER_LICENSE_PLATE: String { "EnterLicensePlateKey".localized }
    static var LICENSE_PLATE: String { "LicensePlateKey".localized }
    static var REGISTRATION_STATUS: String { "RegistrationStatusKey".localized }
    static var ENTER_CAR_IDENTIFICATION_NUMBER: String { "EnterCarIdentificationNumberKey".localized }
    static var CAR_IDENTIFICATION_NUMBER: String { "CarIdentificationNumberKey".localized }
    static var ENTER_VIN: String { "EnterVINKey".localized }
    static var ENTER_MILEAGE: String { "EnterMileageKey".localized }
    static var NEXT: String { "NextKey".localized }
    static var DIESEL: String { "DieselKey".localized }
    static var PETROL: String { "PetrolKey".localized }
    static var FOREIGN: String { "ForeignUsedKey".localized }
    static var LOCALLY_USED: String { "LocallyUsedKey".localized }
    static var BRAND_NEW: String { "BrandNewKey".localized }
    static var CAR_TYPE: String { "CarTypeKey".localized }
    static var CAR_EXTERIOR_COLOR: String { "CarExteriorColourKey".localized }
    static var CAR_INTERIOR_COLOR: String { "CarInteriorColourKey".localized }
    static var AUTOMATIC: String { "AutomaticKey".localized }
    static var MANUAL: String { "ManualKey".localized }
    static var CAR_TRIM: String { "CarTrimKey".localized }
    static var CAR_BODY_TYPE: String { "CarBodyTypeKey".localized }
    static var CAR_ENGINE_TYPE: String { "CarEngineTypeKey".localized }
    static var CHOOSE_CAR: String { "ChooseCarKey".localized }
    static var CAR_INSPECTION: String { "CarInspectionKey".localized }
    static var UPLOAD_NEW: String { "UploadNewKey".localized }
    static var UPLOAD: String { "UploadKey".localized }
    static var CAMERA: String { "CameraKey".localized }
    static var OTHER_IMAGES: String { "OtherImagesKey".localized }
    static var CAR_INTERIOR: String { "CarInteriorKey".localized }
    static var TYRES: String { "TyresKey".localized }
    static var ENGINE: String { "EngineKey".localized }
    static var CAR_RIGHT: String { "CarRightKey".localized }
    static var CAR_LEFT: String { "CarLeftKey".localized }
    static var CAR_LEFT_BACK: String { "CarLeftBackKey".localized }
    static var CAR_RIGHT_BACK: String { "CarRightBackKey".localized }
    static var CAR_BACK: String { "CarBackKey".localized }
    static var CAR_LEFT_FRONT: String { "CarLeftFrontKey".localized }
    static var CAR_RIGHT_FRONT: String { "CarRightFrontKey".localized }
    static var CAR_FRONT: String { "CarFrontKey".localized }
    static var VIN_PICTURES: String { "VINPicturesKey".localized }
    static var PROOF_OF_OWNERSHIP: String { "ProofOfOwnershipKey".localized }
    static var ADR_PURCHASE_RECEIPT: String { "ADRPurchaseReceiptKey".localized }
    static var VEHICLE_LICENSE: String { "VehicleLicenseKey".localized }
    static var CUSTOM_DOCUMENTS: String { "CustomDocumentsKey".localized }
    static var ROAD_WORTHINESS: String { "RoadWorthinessKey".localized }
    static var TINT_PERMIT: String { "TintPermitKey".localized }
    static var TRANSFER_OF_OWNERSHIP: String { "TransferOfOwnershipKey".localized }
    static var ALLOCATION_OF_PLATE_NUMBER: String { "AllocationOfPlateNumberKey".localized }
    static var SELLER_LIVE_PICTURE: String { "SellerLivePictureKey".localized }
    static var LETTER_OF_AUTHORITY: String { "LetterOfAuthorityKey".localized }
    static var LEASE_RELEASE_NOTE_AUTHORIZATION: String { "LeaseReleaseNoteAuthorizationKey".localized }
    static var INSURANCE_INS: String { "InsuranceINSKey".localized }
    static var NUMBER_PLATE: String { "NumberPlateKey".localized }
    static var REGULAR_DEALER_RECEIPT: String { "RegularDealerReceiptKey".localized }
    static var EDIT_INVENTORY: String { "EditInventoryKey".localized }
    static var PHONE_NO: String { "PhoneNoKey".localized }
    static var CREATE_NEW: String { "CreateNewKey".localized }
    static var NAME: String { "NameKey".localized }
    static var OCCUPATION: String { "OccupationKey".localized }
    static var PLEASE_CHOOSE_STATE: String { "PleaseChooseStateKey".localized }
    static var CHOOSE_STATE: String { "ChooseStateKey".localized }
    static var CHOOSE_CITY: String { "ChooseCityKey".localized }
    static var STEP: String { "StepKey".localized }
    static var OF: String { "OfKey".localized }
    static var VEHICLE_IDENTIFICATION_NUMBER: String { "VehicleIdentificationNumberKey".localized }
    static var ENGINE_CAPACITY_CC: String { "EngineCapacityKey".localized }
    static var DUPLEX: String { "DuplexKey".localized }
    static var NEW: String { "NewKey".localized }
    static var FROM: String { "FromKey".localized }
    static var TO: String { "ToKey".localized }
    static var MILES: String { "MilesKey".localized }
    static var KILOMETERS: String { "KilometersKey".localized }
    static var CUSTOMER: String { "CustomerKey".localized }
    static var TARGET: String { "TargetKey".localized }
    static var COMPLETED: String { "CompletedKey".localized }
    static var CONDITIONS: String { "ConditionsKey".localized }
    static var PASSED_PPI: String { "PassedPpiKey".localized }
    static var FAILED_PPI: String { "FailedPpiKey".localized }
    static var TYPE: String { "TypeKey".localized }
    static var OWNER: String { "OwnerKey".localized }
    static var VEHICLE_PRICE: String { "VehiclePriceKey".localized }
    static var ADD_VEHICLE: String { "AddVehicleKey".localized }
    static var SEARCH_FRANCHISE: String { "SearchFranchiseKey".localized }
    static var UPLOAD_CAR_DOCUMENTS: String { "UploadCarDocumentsKey".localized }
    static var ATTACH_A_FILE: String { "AttachAFileKey".localized }
    static var CHOOSE_OPTION: String { "ChooseOptionKey".localized }
    static var VEHICLE_UPGRADED: String { "VehicleUpgradedKey".localized }
    static var OPTIONAL: String { "OptionalKey".localized }
    static var ENGINE_DISPLACEMENT: String { "EngineDisplacementKey".localized }
    static var REGISTRATION_SERIES: String { "RegistrationSeriesKey".localized }
    static var ENSURE_ALL_STEPS_COMPLETED: String { "EnsureAllStepsCompletedKey".localized }
    static var TYRES_AT_LEAST_FOUR_IMAGES: String { "TyresAtLeastFourImagesKey".localized }
    static var ARE_YOU_SURE_TO_PERFORM_ACTION: String { "AreYouSureToPerformActionKey".localized }
    static var NO_FILES_SELECTED: String { "NoFilesSelectedKey".localized }
    static var FILES_UPLOADED_SUCCESSFULLY: String { "FilesUploadedSuccessfullyKey".localized }
    static var SOLD: String { "SoldKey".localized }
    static var SOLD_OUTSIDE_AUTOCHEK: String { "SoldOutsideAutochekKey".localized }
    static var OUT_OF_STOCK: String { "OutOfStockKey".localized }
    static var NOT_AVAILABLE: String { "NotAvailableKey".localized }
    static var OTHERS: String { "OthersKey".localized }
    static var DELIST_REASON: String { "DelistReasonKey".localized }
    static var CAR_DELISTED_MESSAGE: String { "CarDelistedMessageKey".localized }
    static var CAR_LISTED_MESSAGE: String { "CarListedMessageKey".localized }
    static var LIST_CAR: String { "ListCarKey".localized }
    static var PENDING: String { "PendingKey".localized }
    static var IN_PROGRESS: String { "InProgressKey".localized }
    static var OFFER_ACCEPTED: String { "OfferAcceptedKey".localized }
    static var SEARCH_LOAN_APPLICATIONS: String { "SearchLoanApplicationsKey".localized }
    static var LOAN_DETAILS: String { "LoanDetailsKey".localized }
    static var LOAN_STATUS: String { "LoanStatusKey".localized }
    static var COMPLETED_APPLICATION: String { "CompletedApplicationKey".localized }
    static var LOAN_OFFERS: String { "LoanOffersKey".localized }
    static var IN_REVIEW: String { "InReviewKey".localized }
    static var DRAFT: String { "DraftKey".localized }
    static var DISBURSED: String { "DisbursedKey".localized }
    static var VIEW: String { "ViewKey".localized }
    static var ACTIVE: String { "ActiveKey".localized }
    static var UPCOMING: String { "UpcomingKey".localized }
    static var PAST: String { "PastKey".localized }
    static var SEARCH_AUCTION: String { "SearchAuctionKey".localized }
    static var AUTHENTICATION_ERROR: String { "AuthenticationErrorKey".localized }
    static var AUTHENTICATION_ROLES_ERROR: String { "AuthenticationRolesErrorKey".localized }
    static var AUTHENTICATION_COMPANY_ERROR: String { "AuthenticationCompanyErrorKey".localized }
    static var LOGOUT_CONFIRMATION_MESSAGE: String { "LogoutConfirmationMessageKey".localized }
    static var BUY_NOW: String { "BuyNowKey".localized }
    static var PLACE_BID: String { "PlaceBidKey".localized }
    static var CAR_MAKE: String { "CarMakeKey".localized }
    static var CAR_MODEL: String { "CarModelKey".localized }
    static var PLEASE_CHOOSE_MAKE: String { "ChooseMakeMessagKey".localized }
    static var CLEAR: String { "ClearKey".localized }
    static var SCHEDULED: String { "ScheduledKey".localized }
    static var _COMPLETED: String { "CompletedKey:".localized }
    static var CANCEL_REQUEST: String { "CancelRequestKey".localized }
    static var VIEW_REPORT: String { "ViewReportKey".localized }
    static var FILL_DETAILS_TO_REQUEST_INSPECTION: String { "FillDetailsToRequestInspectionKey".localized }
    static var REQUEST_INSPECTION: String { "RequestInspectionKey".localized }
    static var INSPECTION_REQUESTS: String { "InspectionRequestsKey".localized }
    static var CAR_VIN_NUMBER: String { "CarVINNumberKey".localized }
    static var INSPECTION_REPORT: String { "InspectionReportKey".localized }
    static var REQUEST_DATE: String { "RequestDateKey".localized }
    static var TIME: String { "TimeKey".localized }
    static var SEARCH_REQUESTS: String { "SearchRequestsKey".localized }
    static var NEW_REQUEST: String { "NewRequestKey".localized }
    static var SOURCING: String { "SourcingKey".localized }
    static var SKIP: String { "SkipKey".localized }
    static var GET_STARTED: String { "GetStartedKey".localized }
    static var FINANCING_WITH_AUTOCHEK: String { "FinancingWithAutoChekKey".localized }
    static var DIRECT_ACCESS_TO_TRACK: String { "DirectAccessToTrackKey".localized }
    static var TAKE_PART_IN_DAILY_AUCTIONS: String { "TakePartInKey".localized }
    static var NEVER_W0RRY_ABOUT_CUSTOMERS: String { "NeverWorryAboutCustomersKey".localized }
    static var NEVER_WORRY_ABOUT_BUYERS: String { "NeverWorryAboutBuyersKey".localized }
    static var EASILY_REQUEST_FOR_FINANCE: String { "EasilyRequestForFinanceKey".localized }
    static var EMAIL_US: String { "EmailUsKey".localized }
    static var WELCOME_BACK: String { "WelcomeBackKey".localized }
    static var SIGN_IN_TO_CONTINUE: String { "SignInToContinueKey".localized }
    static var EMAIL_OR_PHONENUMBER: String { "EmailOrPhoneKey".localized }
    static var PASSWORD: String { "PasswordKey".localized }
    static var SIGN_IN: String { "SignInKey".localized }
    static var ENTER_YOUR_EMAIL_ADDRESS_BELOW: String { "EnterYourEmailAddressBelowKey".localized }
    static var ENTER_OTP: String { "EnterOtpKey".localized }
    static var AN_OTP_HAS_BEEN_SENT: String { "AnOtpHasBeenSentKey".localized }
    static var THIS_CODE_WILL_EXPIRE: String { "ThisCodeWillExpireKey".localized }
    static var DIDNT_RECEIVE: String { "DidntReceiveKey".localized }
    static var CLICK_HERE: String { "ClickHereKey".localized }
    static var OTP_IS_REQUIRED: String { "OtpIsRequiredKey".localized }
    static var KINDLY_ENTER_NEW_PASSWORD: String { "KindlyEnterNewPasswordKey".localized }
    static var RESET: String { "ResetKey".localized }
    static var RESET_SUCCESSFUL: String { "ResetSuccessfulKey".localized }
    static var YOU_HAVE_RESET_PASSWORD: String { "YouHaveResetPasswordKey".localized }
    static var BACK_TO_SIGN_IN: String { "BackToSignInKey".localized }
    static var REQUEST_CANCELED: String { "RequestCanceledKey".localized }
    static var CONTACT_US: String { "ContactUsKey".localized }
    static var NEED_HELP_OR_SUPPORT: String { "NeedHelpOrSupportKey".localized }
    static var CENTER: String { "CenterKey".localized }
    static var CAR_ADDED_SUCCESSFULLY: String { "CarAddedSuccessfullyKey"}
    static var SOURCING_OVERVIEW: String { "SourcingOverviewKey".localized }
    static var GENERATE_LEAD: String { "GenerateLeadKey".localized }
    static var INTRODUCE_GENERATE_LEAD: String { "IntroduceGenerateLeadKey".localized }
    static var SELECT_LEAD_CATEGORY: String { "SelectLeadCategoryKey".localized }
    static var _SELL_CAR: String { "SellCarKey".localized }
    static var CREATE_SELL_CAR_LEAD: String { "CreateSellCarLeadKey".localized }
    static var LEAD_SUBMITTED: String { "LeadSubmittedSuccessfullyKey".localized }
    static var SOURCE: String { "SourceKey".localized }
    static var YEAR_OF_MANUFACTURE: String { "YearOfManufactureKey".localized }
    static var CAR_NAME: String { "CarNameKey".localized }
    static var _BUY_CAR: String { "BuyCarKey".localized }
    static var SELECT_SERVICE: String { "SelectServiceKey".localized }
    static var PICKUP_FROM_MY_LOCATION: String { "PickUpFromMyLocationKey".localized }
    static var DROPOFF_AT_AUTOCHEK_CENTER: String { "DropOffAutochekCenterKey".localized }
    static var YOU_CANT_SUBMIT: String { "YouCantSubmitKey".localized }
    static var PICK_DATE: String { "PickDateKey".localized }
    static var PICK_TIME: String { "PickTimeKey".localized }
    static var NO_AUTOCHEK_CENTERS_FOUND: String { "NoAutochekCentersFoundKey".localized }
    static var VIEWING_ALL_LOCATIONS: String { "ViewingAllLocationsKey".localized }
    static var YOUR_APPOINTMENT_HAS_BEEN_BOOKED: String { "YourAppointmentHasBeenBookedKey".localized }
    static var CONGRATS_YOUR_APPOINTMENT_HAS_BEEN_BOOKED: String { "CongratulationsYourAppointmentHasBeenBookedKey".localized }
    static var _FIX_CAR: String { "FixCarKey".localized }
    static var DELETE: String { "DeleteKey".localized }
    static var CHANGE: String { "ChangeKey".localized }
    static var DROPOFF_AT_INSPECTION_CENTER: String { "DropOffAtInspectionCenterKey".localized }
    static var DROPOFF_LOCATION: String { "DropoffLocationKey".localized }
    static var CONTINUE: String { "ContinueKey".localized }
    static var OKAY: String { "OkayKey".localized }
}
