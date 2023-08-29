import 'dart:ffi';

class ClientsDataResponse {
  List<Data>? data;
  Filter? filter;
  Message? message;

  ClientsDataResponse({this.data, this.filter, this.message});

  ClientsDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    filter =
    json['Filter'] != null ? new Filter.fromJson(json['Filter']) : null;
    message =
    json['Message'] != null ? new Message.fromJson(json['Message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.filter != null) {
      data['Filter'] = this.filter!.toJson();
    }
    if (this.message != null) {
      data['Message'] = this.message!.toJson();
    }
    return data;
  }
}

class Data {
  String? clientFullName;
  String? maidenName;
  String? middleName;
  String? artistName;
  String? alternateName;
  String? formerName;
  int? countryId;
  int? clientRefCurrencyId;
  dynamic? currencyLong;
  dynamic? conversionDecimals;
  double? conversionValue;
  double? totalAssetInOrgCurrency;
  double? totalLiabilityInOrgCurrency;
  String? birthDate;
  String? birthPlace;
  String? foundingDate;
  String? foundingPlace;
  String? telephoneNr;
  String? email;
  String? mobileNr;
  String? lastContactDate;
  int? totalAccounts;
  int? totalTasks;
  String? lastKycReviewDate;
  Null? kycReviewPending;
  String? deceasedDate;
  String? clientSignature;
  String? generalComments;
  int? languageId;
  int? rmId;
  String? rmName;
  List<Accounts>? accounts;
  List<Activities>? activities;
  List<Portfolios>? portfolios;
  int? clientId;
  String? clientFirstName;
  String? clientLastName;
  String? clientPicture;
  int? clientTypeId;
  int? clientSubTypeId;

  int? clientQualityId;
  int? clientStatusId;
  bool? isClientDeceased;
  String? cityName;
  String? countryName;
  String? currencyShort;
  double? totalAssetInRefCurrency;
  double? totalLiabilityInRefCurrency;
  String? clientPseudo;
  int? clientUserId;

  Data(
      {this.clientFullName,
        this.maidenName,
        this.middleName,
        this.artistName,
        this.alternateName,
        this.formerName,
        this.countryId,
        this.clientRefCurrencyId,
        this.currencyLong,
        this.conversionDecimals,
        this.conversionValue,
        this.totalAssetInOrgCurrency,
        this.totalLiabilityInOrgCurrency,
        this.birthDate,
        this.birthPlace,
        this.foundingDate,
        this.foundingPlace,
        this.telephoneNr,
        this.email,
        this.mobileNr,
        this.lastContactDate,
        this.totalAccounts,
        this.totalTasks,
        this.lastKycReviewDate,
        this.kycReviewPending,
        this.deceasedDate,
        this.clientSignature,
        this.generalComments,
        this.languageId,
        this.rmId,
        this.rmName,
        this.accounts,
        this.activities,
        this.portfolios,
        this.clientId,
        this.clientFirstName,
        this.clientLastName,
        this.clientPicture,
        this.clientTypeId,
        this.clientSubTypeId,
        this.clientQualityId,
        this.clientStatusId,
        this.isClientDeceased,
        this.cityName,
        this.countryName,
        this.currencyShort,
        this.totalAssetInRefCurrency,
        this.totalLiabilityInRefCurrency,
        this.clientPseudo,
        this.clientUserId});

  Data.fromJson(Map<String, dynamic> json) {
    clientFullName = json['ClientFullName'];
    maidenName = json['MaidenName'];
    middleName = json['MiddleName'];
    artistName = json['ArtistName'];
    alternateName = json['AlternateName'];
    formerName = json['FormerName'];
    countryId = json['CountryId'];
    clientRefCurrencyId = json['ClientRefCurrencyId'];
    currencyLong = json['CurrencyLong'];
    conversionDecimals = json['ConversionDecimals'];
    conversionValue = json['ConversionValue'];
    totalAssetInOrgCurrency = json['TotalAssetInOrgCurrency'];
    totalLiabilityInOrgCurrency = json['TotalLiabilityInOrgCurrency'];
    birthDate = json['BirthDate'];
    birthPlace = json['BirthPlace'];
    foundingDate = json['FoundingDate'];
    foundingPlace = json['FoundingPlace'];
    telephoneNr = json['TelephoneNr'];
    email = json['Email'];
    mobileNr = json['MobileNr'];
    lastContactDate = json['LastContactDate'];
    totalAccounts = json['TotalAccounts'];
    totalTasks = json['TotalTasks'];
    lastKycReviewDate = json['LastKycReviewDate'];
    kycReviewPending = json['KycReviewPending'];
    deceasedDate = json['DeceasedDate'];
    clientSignature = json['ClientSignature'];
    generalComments = json['GeneralComments'];
    languageId = json['LanguageId'];
    rmId = json['RmId'];
    rmName = json['RmName'];
    if (json['Accounts'] != null) {
      accounts = <Accounts>[];
      json['Accounts'].forEach((v) {
        accounts!.add(new Accounts.fromJson(v));
      });
    }
    if (json['Activities'] != null) {
      activities = <Activities>[];
      json['Activities'].forEach((v) {
        activities!.add(new Activities.fromJson(v));
      });
    }
    if (json['Portfolios'] != null) {
      portfolios = <Portfolios>[];
      json['Portfolios'].forEach((v) {
        portfolios!.add(new Portfolios.fromJson(v));
      });
    }
    clientId = json['ClientId'];
    clientFirstName = json['ClientFirstName'];
    clientLastName = json['ClientLastName'];
    clientPicture = json['ClientPicture'];
    clientTypeId = json['ClientTypeId'];
    clientSubTypeId = json['ClientSubTypeId'];
    clientQualityId = json['ClientQualityId'];
    clientStatusId = json['ClientStatusId'];
    isClientDeceased = json['IsClientDeceased'];
    cityName = json['CityName'];
    countryName = json['CountryName'];
    currencyShort = json['CurrencyShort'];
    totalAssetInRefCurrency = json['TotalAssetInRefCurrency'];
    totalLiabilityInRefCurrency = json['TotalLiabilityInRefCurrency'];
    clientPseudo = json['ClientPseudo'];
    clientUserId = json['ClientUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ClientFullName'] = this.clientFullName;
    data['MaidenName'] = this.maidenName;
    data['MiddleName'] = this.middleName;
    data['ArtistName'] = this.artistName;
    data['AlternateName'] = this.alternateName;
    data['FormerName'] = this.formerName;
    data['CountryId'] = this.countryId;
    data['ClientRefCurrencyId'] = this.clientRefCurrencyId;
    data['CurrencyLong'] = this.currencyLong;
    data['ConversionDecimals'] = this.conversionDecimals;
    data['ConversionValue'] = this.conversionValue;
    data['TotalAssetInOrgCurrency'] = this.totalAssetInOrgCurrency;
    data['TotalLiabilityInOrgCurrency'] = this.totalLiabilityInOrgCurrency;
    data['BirthDate'] = this.birthDate;
    data['BirthPlace'] = this.birthPlace;
    data['FoundingDate'] = this.foundingDate;
    data['FoundingPlace'] = this.foundingPlace;
    data['TelephoneNr'] = this.telephoneNr;
    data['Email'] = this.email;
    data['MobileNr'] = this.mobileNr;
    data['LastContactDate'] = this.lastContactDate;
    data['TotalAccounts'] = this.totalAccounts;
    data['TotalTasks'] = this.totalTasks;
    data['LastKycReviewDate'] = this.lastKycReviewDate;
    data['KycReviewPending'] = this.kycReviewPending;
    data['DeceasedDate'] = this.deceasedDate;
    data['ClientSignature'] = this.clientSignature;
    data['GeneralComments'] = this.generalComments;
    data['LanguageId'] = this.languageId;
    data['RmId'] = this.rmId;
    data['RmName'] = this.rmName;
    if (this.accounts != null) {
      data['Accounts'] = this.accounts!.map((v) => v.toJson()).toList();
    }
    if (this.activities != null) {
      data['Activities'] = this.activities!.map((v) => v.toJson()).toList();
    }
    if (this.portfolios != null) {
      data['Portfolios'] = this.portfolios!.map((v) => v.toJson()).toList();
    }
    data['ClientId'] = this.clientId;
    data['ClientFirstName'] = this.clientFirstName;
    data['ClientLastName'] = this.clientLastName;
    data['ClientPicture'] = this.clientPicture;
    data['ClientTypeId'] = this.clientTypeId;
    data['ClientSubTypeId'] = this.clientSubTypeId;
    data['ClientQualityId'] = this.clientQualityId;
    data['ClientStatusId'] = this.clientStatusId;
    data['IsClientDeceased'] = this.isClientDeceased;
    data['CityName'] = this.cityName;
    data['CountryName'] = this.countryName;
    data['CurrencyShort'] = this.currencyShort;
    data['TotalAssetInRefCurrency'] = this.totalAssetInRefCurrency;
    data['TotalLiabilityInRefCurrency'] = this.totalLiabilityInRefCurrency;
    data['ClientPseudo'] = this.clientPseudo;
    data['ClientUserId'] = this.clientUserId;
    return data;
  }
}

class Accounts {
  int? accountId;
  int? clientId;
  double? totalAssetInRefCurrency;
  double? totalAssetInOrgCurrency;
  String? openingDate;
  dynamic? accountRefCurrency;
  String? accountRefCurrencyShort;
  Null? documentId;
  Null? documentTypeId;
  String? accountName;
  String? accountNr;
  int? bookingCenterId;
  int? cityId;
  int? countryId;
  String? bookingCenterShort;
  String? bookingCenterLogo;
  int? bankId;
  String? bankShortName;

  Accounts(
      {this.accountId,
        this.clientId,
        this.totalAssetInRefCurrency,
        this.totalAssetInOrgCurrency,
        this.openingDate,
        this.accountRefCurrency,
        this.accountRefCurrencyShort,
        this.documentId,
        this.documentTypeId,
        this.accountName,
        this.accountNr,
        this.bookingCenterId,
        this.cityId,
        this.countryId,
        this.bookingCenterShort,
        this.bookingCenterLogo,
        this.bankId,
        this.bankShortName});

  Accounts.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    clientId = json['ClientId'];
    totalAssetInRefCurrency = json['TotalAssetInRefCurrency'];
    totalAssetInOrgCurrency = json['TotalAssetInOrgCurrency'];
    openingDate = json['OpeningDate'];
    accountRefCurrency = json['AccountRefCurrency'];
    accountRefCurrencyShort = json['AccountRefCurrencyShort'];
    documentId = json['DocumentId'];
    documentTypeId = json['DocumentTypeId'];
    accountName = json['AccountName'];
    accountNr = json['AccountNr'];
    bookingCenterId = json['BookingCenterId'];
    cityId = json['CityId'];
    countryId = json['CountryId'];
    bookingCenterShort = json['BookingCenterShort'];
    bookingCenterLogo = json['BookingCenterLogo'];
    bankId = json['BankId'];
    bankShortName = json['BankShortName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['ClientId'] = this.clientId;
    data['TotalAssetInRefCurrency'] = this.totalAssetInRefCurrency;
    data['TotalAssetInOrgCurrency'] = this.totalAssetInOrgCurrency;
    data['OpeningDate'] = this.openingDate;
    data['AccountRefCurrency'] = this.accountRefCurrency;
    data['AccountRefCurrencyShort'] = this.accountRefCurrencyShort;
    data['DocumentId'] = this.documentId;
    data['DocumentTypeId'] = this.documentTypeId;
    data['AccountName'] = this.accountName;
    data['AccountNr'] = this.accountNr;
    data['BookingCenterId'] = this.bookingCenterId;
    data['CityId'] = this.cityId;
    data['CountryId'] = this.countryId;
    data['BookingCenterShort'] = this.bookingCenterShort;
    data['BookingCenterLogo'] = this.bookingCenterLogo;
    data['BankId'] = this.bankId;
    data['BankShortName'] = this.bankShortName;
    return data;
  }
}

class Activities {
  int? activityId;
  int? clientId;
  String? activityDate;
  String? activityText;
  int? activityTypeId;
  String? activityTypeDesc;
  String? activityTypeIcon;
  String? createTime;
  int? contactMediumId;
  String? contactMediumDesc;

  Activities(
      {this.activityId,
        this.clientId,
        this.activityDate,
        this.activityText,
        this.activityTypeId,
        this.activityTypeDesc,
        this.activityTypeIcon,
        this.createTime,
        this.contactMediumId,
        this.contactMediumDesc});

  Activities.fromJson(Map<String, dynamic> json) {
    activityId = json['ActivityId'];
    clientId = json['ClientId'];
    activityDate = json['ActivityDate'];
    activityText = json['ActivityText'];
    activityTypeId = json['ActivityTypeId'];
    activityTypeDesc = json['ActivityTypeDesc'];
    activityTypeIcon = json['ActivityTypeIcon'];
    createTime = json['CreateTime'];
    contactMediumId = json['ContactMediumId'];
    contactMediumDesc = json['ContactMediumDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ActivityId'] = this.activityId;
    data['ClientId'] = this.clientId;
    data['ActivityDate'] = this.activityDate;
    data['ActivityText'] = this.activityText;
    data['ActivityTypeId'] = this.activityTypeId;
    data['ActivityTypeDesc'] = this.activityTypeDesc;
    data['ActivityTypeIcon'] = this.activityTypeIcon;
    data['CreateTime'] = this.createTime;
    data['ContactMediumId'] = this.contactMediumId;
    data['ContactMediumDesc'] = this.contactMediumDesc;
    return data;
  }
}

class Portfolios {
  Null? pseudo;
  Null? extBusinessKey;
  Null? decimals;
  Null? fxRate;
  Null? fxFactor;
  Null? positionDate;
  Null? maxAsset;
  Null? pcentOfAssetMax;
  Null? liabilityPcentOfAsset;
  Null? assetColor;
  Null? performanceYTD;
  Null? performancePercentage;
  Null? performanceColor;
  Null? riskLevel;
  Null? riskPercentage;
  Null? riskColor;
  Null? volatility;
  Null? volatilityPercentage;
  Null? volatilityColor;
  Null? clientInteractCount;
  Null? clientInteractPercentage;
  Null? clientInteractColor;
  Null? tradingAmountRefCcy;
  Null? tradingPercentage;
  Null? tradingColor;
  Null? profitability;
  Null? profitabilityPercentage;
  Null? profitabilityColor;
  Null? netNewMoneyRefCcy;
  Null? netNewMoneyPercentage;
  Null? netNewMoneyColor;
  Null? ranking;
  Null? taskCount;
  Null? taskCountColor;
  Null? pendings;
  Null? pendingsColor;
  Null? availableCashRefCcy;
  Null? availableCashColor;
  Null? restrictionCount;
  Null? investmentAlerts;
  Null? investmentAlertsColor;
  Null? investmentConstraints;
  Null? investmentConstraintsColor;
  Null? relationshipManager;
  Null? relationshipManagerShort;
  Null? serviceManager;
  Null? serviceManagerShort;
  Null? serviceModelId;
  Null? serviceModelName;
  Null? investmentStrategyId;
  Null? investmentStrategyName;
  Null? investmentProfileId;
  Null? investmentProfileName;
  Null? mandateSubTypeId;
  Null? mandateSubTypeName;
  double? performanceYTDInRefCurrency;
  Null? generalComments;
  Null? constraintCount;
  int? portfolioTypeId;
  Null? accountTypeDesc;
  Null? benchMarkName;
  Null? relationshipManagerPhone;
  Null? relationshipManagerEmail;
  Null? relationshipManagerPicture;
  Null? relationshipManagerSignature;
  Null? portfolioStatusDesc;
  bool? isActive;
  Null? nationality;
  Null? performanceInception;
  Null? overriddenPerformanceInception;
  int? cityId;
  Null? cityDesc;
  bool? oldPriceIssue;
  bool? reconIssue;
  bool? performanceIssue;
  bool? qualityCheckIssue;
  bool? excessPlIssue;
  bool? positionCheckIssue;
  bool? transactionCheckIssue;
  Null? lastTransactionDate;
  Null? firstPositionDate;
  Null? deputyRelationshipManager;
  Null? deputyRelationshipManagerPhone;
  Null? deputyRelationshipManagerEmail;
  Null? deputyRelationshipManagerPicture;
  Null? deputyRelationshipManagerSignature;
  Null? reportingLanguageId;
  Null? isPaymentAllowed;
  Null? lockRecomputeDate;
  Null? linkAccountIds;
  Null? investmentAdvisor;
  Null? portfolioManager;
  Null? assetByCategories;
  int? portfolioId;
  String? portfolioName;
  String? portfolioNr;
  String? portfolioNr2;
  Null? openingDate;
  Null? closingDate;
  Null? isManual;
  Null? isTransactionBased;
  Null? statusId;
  Null? activeFlag;
  Null? originalAccountId;
  Null? bcId;
  String? bookingCenterShort;
  String? bookingCenterCountry;
  String? bookingCenterLogo;
  String? bankName;
  String? bankShortName;
  int? portfolioRefCcyId;
  String? portfolioRefCcyCode;
  Null? portfolioRefCcyLong;
  Null? orgRefCcyId;
  Null? orgRefCcyCode;
  Null? orgRefCcyLong;
  double? totalAssetInRefCurrency;
  dynamic? totalLiabilityInRefCurrency;
  dynamic? totalAssetInOrgCurrency;
  dynamic? totalLiabilityInOrgCurrency;
  Null? accounts;

  Portfolios(
      {this.pseudo,
        this.extBusinessKey,
        this.decimals,
        this.fxRate,
        this.fxFactor,
        this.positionDate,
        this.maxAsset,
        this.pcentOfAssetMax,
        this.liabilityPcentOfAsset,
        this.assetColor,
        this.performanceYTD,
        this.performancePercentage,
        this.performanceColor,
        this.riskLevel,
        this.riskPercentage,
        this.riskColor,
        this.volatility,
        this.volatilityPercentage,
        this.volatilityColor,
        this.clientInteractCount,
        this.clientInteractPercentage,
        this.clientInteractColor,
        this.tradingAmountRefCcy,
        this.tradingPercentage,
        this.tradingColor,
        this.profitability,
        this.profitabilityPercentage,
        this.profitabilityColor,
        this.netNewMoneyRefCcy,
        this.netNewMoneyPercentage,
        this.netNewMoneyColor,
        this.ranking,
        this.taskCount,
        this.taskCountColor,
        this.pendings,
        this.pendingsColor,
        this.availableCashRefCcy,
        this.availableCashColor,
        this.restrictionCount,
        this.investmentAlerts,
        this.investmentAlertsColor,
        this.investmentConstraints,
        this.investmentConstraintsColor,
        this.relationshipManager,
        this.relationshipManagerShort,
        this.serviceManager,
        this.serviceManagerShort,
        this.serviceModelId,
        this.serviceModelName,
        this.investmentStrategyId,
        this.investmentStrategyName,
        this.investmentProfileId,
        this.investmentProfileName,
        this.mandateSubTypeId,
        this.mandateSubTypeName,
        this.performanceYTDInRefCurrency,
        this.generalComments,
        this.constraintCount,
        this.portfolioTypeId,
        this.accountTypeDesc,
        this.benchMarkName,
        this.relationshipManagerPhone,
        this.relationshipManagerEmail,
        this.relationshipManagerPicture,
        this.relationshipManagerSignature,
        this.portfolioStatusDesc,
        this.isActive,
        this.nationality,
        this.performanceInception,
        this.overriddenPerformanceInception,
        this.cityId,
        this.cityDesc,
        this.oldPriceIssue,
        this.reconIssue,
        this.performanceIssue,
        this.qualityCheckIssue,
        this.excessPlIssue,
        this.positionCheckIssue,
        this.transactionCheckIssue,
        this.lastTransactionDate,
        this.firstPositionDate,
        this.deputyRelationshipManager,
        this.deputyRelationshipManagerPhone,
        this.deputyRelationshipManagerEmail,
        this.deputyRelationshipManagerPicture,
        this.deputyRelationshipManagerSignature,
        this.reportingLanguageId,
        this.isPaymentAllowed,
        this.lockRecomputeDate,
        this.linkAccountIds,
        this.investmentAdvisor,
        this.portfolioManager,
        this.assetByCategories,
        this.portfolioId,
        this.portfolioName,
        this.portfolioNr,
        this.portfolioNr2,
        this.openingDate,
        this.closingDate,
        this.isManual,
        this.isTransactionBased,
        this.statusId,
        this.activeFlag,
        this.originalAccountId,
        this.bcId,
        this.bookingCenterShort,
        this.bookingCenterCountry,
        this.bookingCenterLogo,
        this.bankName,
        this.bankShortName,
        this.portfolioRefCcyId,
        this.portfolioRefCcyCode,
        this.portfolioRefCcyLong,
        this.orgRefCcyId,
        this.orgRefCcyCode,
        this.orgRefCcyLong,
        this.totalAssetInRefCurrency,
        this.totalLiabilityInRefCurrency,
        this.totalAssetInOrgCurrency,
        this.totalLiabilityInOrgCurrency,
        this.accounts});

  Portfolios.fromJson(Map<String, dynamic> json) {
    pseudo = json['Pseudo'];
    extBusinessKey = json['ExtBusinessKey'];
    decimals = json['Decimals'];
    fxRate = json['FxRate'];
    fxFactor = json['FxFactor'];
    positionDate = json['PositionDate'];
    maxAsset = json['MaxAsset'];
    pcentOfAssetMax = json['PcentOfAssetMax'];
    liabilityPcentOfAsset = json['LiabilityPcentOfAsset'];
    assetColor = json['AssetColor'];
    performanceYTD = json['PerformanceYTD'];
    performancePercentage = json['PerformancePercentage'];
    performanceColor = json['PerformanceColor'];
    riskLevel = json['RiskLevel'];
    riskPercentage = json['RiskPercentage'];
    riskColor = json['RiskColor'];
    volatility = json['Volatility'];
    volatilityPercentage = json['VolatilityPercentage'];
    volatilityColor = json['VolatilityColor'];
    clientInteractCount = json['ClientInteractCount'];
    clientInteractPercentage = json['ClientInteractPercentage'];
    clientInteractColor = json['ClientInteractColor'];
    tradingAmountRefCcy = json['TradingAmountRefCcy'];
    tradingPercentage = json['TradingPercentage'];
    tradingColor = json['TradingColor'];
    profitability = json['Profitability'];
    profitabilityPercentage = json['ProfitabilityPercentage'];
    profitabilityColor = json['ProfitabilityColor'];
    netNewMoneyRefCcy = json['NetNewMoneyRefCcy'];
    netNewMoneyPercentage = json['NetNewMoneyPercentage'];
    netNewMoneyColor = json['NetNewMoneyColor'];
    ranking = json['Ranking'];
    taskCount = json['TaskCount'];
    taskCountColor = json['TaskCountColor'];
    pendings = json['Pendings'];
    pendingsColor = json['PendingsColor'];
    availableCashRefCcy = json['AvailableCashRefCcy'];
    availableCashColor = json['AvailableCashColor'];
    restrictionCount = json['RestrictionCount'];
    investmentAlerts = json['InvestmentAlerts'];
    investmentAlertsColor = json['InvestmentAlertsColor'];
    investmentConstraints = json['InvestmentConstraints'];
    investmentConstraintsColor = json['InvestmentConstraintsColor'];
    relationshipManager = json['RelationshipManager'];
    relationshipManagerShort = json['RelationshipManagerShort'];
    serviceManager = json['ServiceManager'];
    serviceManagerShort = json['ServiceManagerShort'];
    serviceModelId = json['ServiceModelId'];
    serviceModelName = json['ServiceModelName'];
    investmentStrategyId = json['InvestmentStrategyId'];
    investmentStrategyName = json['InvestmentStrategyName'];
    investmentProfileId = json['InvestmentProfileId'];
    investmentProfileName = json['InvestmentProfileName'];
    mandateSubTypeId = json['MandateSubTypeId'];
    mandateSubTypeName = json['MandateSubTypeName'];
    performanceYTDInRefCurrency = json['PerformanceYTDInRefCurrency'];
    generalComments = json['GeneralComments'];
    constraintCount = json['ConstraintCount'];
    portfolioTypeId = json['PortfolioTypeId'];
    accountTypeDesc = json['AccountTypeDesc'];
    benchMarkName = json['BenchMarkName'];
    relationshipManagerPhone = json['RelationshipManagerPhone'];
    relationshipManagerEmail = json['RelationshipManagerEmail'];
    relationshipManagerPicture = json['RelationshipManagerPicture'];
    relationshipManagerSignature = json['RelationshipManagerSignature'];
    portfolioStatusDesc = json['PortfolioStatusDesc'];
    isActive = json['IsActive'];
    nationality = json['Nationality'];
    performanceInception = json['PerformanceInception'];
    overriddenPerformanceInception = json['OverriddenPerformanceInception'];
    cityId = json['CityId'];
    cityDesc = json['CityDesc'];
    oldPriceIssue = json['OldPriceIssue'];
    reconIssue = json['ReconIssue'];
    performanceIssue = json['PerformanceIssue'];
    qualityCheckIssue = json['QualityCheckIssue'];
    excessPlIssue = json['ExcessPlIssue'];
    positionCheckIssue = json['PositionCheckIssue'];
    transactionCheckIssue = json['TransactionCheckIssue'];
    lastTransactionDate = json['LastTransactionDate'];
    firstPositionDate = json['FirstPositionDate'];
    deputyRelationshipManager = json['DeputyRelationshipManager'];
    deputyRelationshipManagerPhone = json['DeputyRelationshipManagerPhone'];
    deputyRelationshipManagerEmail = json['DeputyRelationshipManagerEmail'];
    deputyRelationshipManagerPicture = json['DeputyRelationshipManagerPicture'];
    deputyRelationshipManagerSignature =
    json['DeputyRelationshipManagerSignature'];
    reportingLanguageId = json['ReportingLanguageId'];
    isPaymentAllowed = json['IsPaymentAllowed'];
    lockRecomputeDate = json['LockRecomputeDate'];
    linkAccountIds = json['LinkAccountIds'];
    investmentAdvisor = json['InvestmentAdvisor'];
    portfolioManager = json['PortfolioManager'];
    assetByCategories = json['AssetByCategories'];
    portfolioId = json['PortfolioId'];
    portfolioName = json['PortfolioName'];
    portfolioNr = json['PortfolioNr'];
    portfolioNr2 = json['PortfolioNr2'];
    openingDate = json['OpeningDate'];
    closingDate = json['ClosingDate'];
    isManual = json['IsManual'];
    isTransactionBased = json['IsTransactionBased'];
    statusId = json['StatusId'];
    activeFlag = json['ActiveFlag'];
    originalAccountId = json['OriginalAccountId'];
    bcId = json['BcId'];
    bookingCenterShort = json['BookingCenterShort'];
    bookingCenterCountry = json['BookingCenterCountry'];
    bookingCenterLogo = json['BookingCenterLogo'];
    bankName = json['BankName'];
    bankShortName = json['BankShortName'];
    portfolioRefCcyId = json['PortfolioRefCcyId'];
    portfolioRefCcyCode = json['PortfolioRefCcyCode'];
    portfolioRefCcyLong = json['PortfolioRefCcyLong'];
    orgRefCcyId = json['OrgRefCcyId'];
    orgRefCcyCode = json['OrgRefCcyCode'];
    orgRefCcyLong = json['OrgRefCcyLong'];
    totalAssetInRefCurrency = json['TotalAssetInRefCurrency'];
    totalLiabilityInRefCurrency = json['TotalLiabilityInRefCurrency'];
    totalAssetInOrgCurrency = json['TotalAssetInOrgCurrency'];
    totalLiabilityInOrgCurrency = json['TotalLiabilityInOrgCurrency'];
    accounts = json['Accounts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Pseudo'] = this.pseudo;
    data['ExtBusinessKey'] = this.extBusinessKey;
    data['Decimals'] = this.decimals;
    data['FxRate'] = this.fxRate;
    data['FxFactor'] = this.fxFactor;
    data['PositionDate'] = this.positionDate;
    data['MaxAsset'] = this.maxAsset;
    data['PcentOfAssetMax'] = this.pcentOfAssetMax;
    data['LiabilityPcentOfAsset'] = this.liabilityPcentOfAsset;
    data['AssetColor'] = this.assetColor;
    data['PerformanceYTD'] = this.performanceYTD;
    data['PerformancePercentage'] = this.performancePercentage;
    data['PerformanceColor'] = this.performanceColor;
    data['RiskLevel'] = this.riskLevel;
    data['RiskPercentage'] = this.riskPercentage;
    data['RiskColor'] = this.riskColor;
    data['Volatility'] = this.volatility;
    data['VolatilityPercentage'] = this.volatilityPercentage;
    data['VolatilityColor'] = this.volatilityColor;
    data['ClientInteractCount'] = this.clientInteractCount;
    data['ClientInteractPercentage'] = this.clientInteractPercentage;
    data['ClientInteractColor'] = this.clientInteractColor;
    data['TradingAmountRefCcy'] = this.tradingAmountRefCcy;
    data['TradingPercentage'] = this.tradingPercentage;
    data['TradingColor'] = this.tradingColor;
    data['Profitability'] = this.profitability;
    data['ProfitabilityPercentage'] = this.profitabilityPercentage;
    data['ProfitabilityColor'] = this.profitabilityColor;
    data['NetNewMoneyRefCcy'] = this.netNewMoneyRefCcy;
    data['NetNewMoneyPercentage'] = this.netNewMoneyPercentage;
    data['NetNewMoneyColor'] = this.netNewMoneyColor;
    data['Ranking'] = this.ranking;
    data['TaskCount'] = this.taskCount;
    data['TaskCountColor'] = this.taskCountColor;
    data['Pendings'] = this.pendings;
    data['PendingsColor'] = this.pendingsColor;
    data['AvailableCashRefCcy'] = this.availableCashRefCcy;
    data['AvailableCashColor'] = this.availableCashColor;
    data['RestrictionCount'] = this.restrictionCount;
    data['InvestmentAlerts'] = this.investmentAlerts;
    data['InvestmentAlertsColor'] = this.investmentAlertsColor;
    data['InvestmentConstraints'] = this.investmentConstraints;
    data['InvestmentConstraintsColor'] = this.investmentConstraintsColor;
    data['RelationshipManager'] = this.relationshipManager;
    data['RelationshipManagerShort'] = this.relationshipManagerShort;
    data['ServiceManager'] = this.serviceManager;
    data['ServiceManagerShort'] = this.serviceManagerShort;
    data['ServiceModelId'] = this.serviceModelId;
    data['ServiceModelName'] = this.serviceModelName;
    data['InvestmentStrategyId'] = this.investmentStrategyId;
    data['InvestmentStrategyName'] = this.investmentStrategyName;
    data['InvestmentProfileId'] = this.investmentProfileId;
    data['InvestmentProfileName'] = this.investmentProfileName;
    data['MandateSubTypeId'] = this.mandateSubTypeId;
    data['MandateSubTypeName'] = this.mandateSubTypeName;
    data['PerformanceYTDInRefCurrency'] = this.performanceYTDInRefCurrency;
    data['GeneralComments'] = this.generalComments;
    data['ConstraintCount'] = this.constraintCount;
    data['PortfolioTypeId'] = this.portfolioTypeId;
    data['AccountTypeDesc'] = this.accountTypeDesc;
    data['BenchMarkName'] = this.benchMarkName;
    data['RelationshipManagerPhone'] = this.relationshipManagerPhone;
    data['RelationshipManagerEmail'] = this.relationshipManagerEmail;
    data['RelationshipManagerPicture'] = this.relationshipManagerPicture;
    data['RelationshipManagerSignature'] = this.relationshipManagerSignature;
    data['PortfolioStatusDesc'] = this.portfolioStatusDesc;
    data['IsActive'] = this.isActive;
    data['Nationality'] = this.nationality;
    data['PerformanceInception'] = this.performanceInception;
    data['OverriddenPerformanceInception'] =
        this.overriddenPerformanceInception;
    data['CityId'] = this.cityId;
    data['CityDesc'] = this.cityDesc;
    data['OldPriceIssue'] = this.oldPriceIssue;
    data['ReconIssue'] = this.reconIssue;
    data['PerformanceIssue'] = this.performanceIssue;
    data['QualityCheckIssue'] = this.qualityCheckIssue;
    data['ExcessPlIssue'] = this.excessPlIssue;
    data['PositionCheckIssue'] = this.positionCheckIssue;
    data['TransactionCheckIssue'] = this.transactionCheckIssue;
    data['LastTransactionDate'] = this.lastTransactionDate;
    data['FirstPositionDate'] = this.firstPositionDate;
    data['DeputyRelationshipManager'] = this.deputyRelationshipManager;
    data['DeputyRelationshipManagerPhone'] =
        this.deputyRelationshipManagerPhone;
    data['DeputyRelationshipManagerEmail'] =
        this.deputyRelationshipManagerEmail;
    data['DeputyRelationshipManagerPicture'] =
        this.deputyRelationshipManagerPicture;
    data['DeputyRelationshipManagerSignature'] =
        this.deputyRelationshipManagerSignature;
    data['ReportingLanguageId'] = this.reportingLanguageId;
    data['IsPaymentAllowed'] = this.isPaymentAllowed;
    data['LockRecomputeDate'] = this.lockRecomputeDate;
    data['LinkAccountIds'] = this.linkAccountIds;
    data['InvestmentAdvisor'] = this.investmentAdvisor;
    data['PortfolioManager'] = this.portfolioManager;
    data['AssetByCategories'] = this.assetByCategories;
    data['PortfolioId'] = this.portfolioId;
    data['PortfolioName'] = this.portfolioName;
    data['PortfolioNr'] = this.portfolioNr;
    data['PortfolioNr2'] = this.portfolioNr2;
    data['OpeningDate'] = this.openingDate;
    data['ClosingDate'] = this.closingDate;
    data['IsManual'] = this.isManual;
    data['IsTransactionBased'] = this.isTransactionBased;
    data['StatusId'] = this.statusId;
    data['ActiveFlag'] = this.activeFlag;
    data['OriginalAccountId'] = this.originalAccountId;
    data['BcId'] = this.bcId;
    data['BookingCenterShort'] = this.bookingCenterShort;
    data['BookingCenterCountry'] = this.bookingCenterCountry;
    data['BookingCenterLogo'] = this.bookingCenterLogo;
    data['BankName'] = this.bankName;
    data['BankShortName'] = this.bankShortName;
    data['PortfolioRefCcyId'] = this.portfolioRefCcyId;
    data['PortfolioRefCcyCode'] = this.portfolioRefCcyCode;
    data['PortfolioRefCcyLong'] = this.portfolioRefCcyLong;
    data['OrgRefCcyId'] = this.orgRefCcyId;
    data['OrgRefCcyCode'] = this.orgRefCcyCode;
    data['OrgRefCcyLong'] = this.orgRefCcyLong;
    data['TotalAssetInRefCurrency'] = this.totalAssetInRefCurrency;
    data['TotalLiabilityInRefCurrency'] = this.totalLiabilityInRefCurrency;
    data['TotalAssetInOrgCurrency'] = this.totalAssetInOrgCurrency;
    data['TotalLiabilityInOrgCurrency'] = this.totalLiabilityInOrgCurrency;
    data['Accounts'] = this.accounts;
    return data;
  }
}

class Filter {
  Page? page;
  Null? searchText;

  Filter({this.page, this.searchText});

  Filter.fromJson(Map<String, dynamic> json) {
    page = json['Page'] != null ? new Page.fromJson(json['Page']) : null;
    searchText = json['SearchText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.page != null) {
      data['Page'] = this.page!.toJson();
    }
    data['SearchText'] = this.searchText;
    return data;
  }
}

class Page {
  int? pageSize;
  int? pageIndex;
  int? totalRecords;
  int? sortOrder;
  String? orderBy;

  Page(
      {this.pageSize,
        this.pageIndex,
        this.totalRecords,
        this.sortOrder,
        this.orderBy});

  Page.fromJson(Map<String, dynamic> json) {
    pageSize = json['PageSize'];
    pageIndex = json['PageIndex'];
    totalRecords = json['TotalRecords'];
    sortOrder = json['SortOrder'];
    orderBy = json['OrderBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PageSize'] = this.pageSize;
    data['PageIndex'] = this.pageIndex;
    data['TotalRecords'] = this.totalRecords;
    data['SortOrder'] = this.sortOrder;
    data['OrderBy'] = this.orderBy;
    return data;
  }
}

class Message {
  int? messageCode;
  int? messageType;
  String? message;
  String? messageSource;

  Message(
      {this.messageCode, this.messageType, this.message, this.messageSource});

  Message.fromJson(Map<String, dynamic> json) {
    messageCode = json['MessageCode'];
    messageType = json['MessageType'];
    message = json['Message'];
    messageSource = json['MessageSource'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MessageCode'] = this.messageCode;
    data['MessageType'] = this.messageType;
    data['Message'] = this.message;
    data['MessageSource'] = this.messageSource;
    return data;
  }
}