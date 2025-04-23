import 'package:equatable/equatable.dart';

class CheckoutResponseEntity extends Equatable {
  CheckoutResponseEntity({
    this.message,
    this.session,
  });

  String? message;
  SessionEntity? session;

  @override
  List<Object?> get props => [message, session];
}

class SessionEntity extends Equatable {
  SessionEntity({
    this.id,
    this.object,
    this.adaptivePricing,
    this.afterExpiration,
    this.allowPromotionCodes,
    this.amountSubtotal,
    this.amountTotal,
    this.automaticTax,
    this.billingAddressCollection,
    this.cancelUrl,
    this.clientReferenceId,
    this.clientSecret,
    this.collectedInformation,
    this.consent,
    this.consentCollection,
    this.created,
    this.currency,
    this.currencyConversion,
    this.customFields,
    this.customText,
    this.customer,
    this.customerCreation,
    this.customerDetails,
    this.customerEmail,
    this.discounts,
    this.expiresAt,
    this.invoice,
    this.invoiceCreation,
    this.liveMode,
    this.locale,
    this.metadata,
    this.mode,
    this.paymentIntent,
    this.paymentLink,
    this.paymentMethodCollection,
    this.paymentMethodConfigurationDetails,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.paymentStatus,
    this.permissions,
    this.phoneNumberCollection,
    this.recoveredFrom,
    this.savedPaymentMethodOptions,
    this.setupIntent,
    this.shippingAddressCollection,
    this.shippingCost,
    this.shippingDetails,
    this.shippingOptions,
    this.status,
    this.submitType,
    this.subscription,
    this.successUrl,
    this.totalDetails,
    this.uiMode,
    this.url,
    this.walletOptions,
  });

  String? id;
  String? object;
  AdaptivePricingEntity? adaptivePricing;
  dynamic afterExpiration;
  dynamic allowPromotionCodes;
  num? amountSubtotal;
  num? amountTotal;
  AutomaticTaxEntity? automaticTax;
  dynamic billingAddressCollection;
  String? cancelUrl;
  String? clientReferenceId;
  dynamic clientSecret;
  CollectedInformationEntity? collectedInformation;
  dynamic consent;
  dynamic consentCollection;
  num? created;
  String? currency;
  dynamic currencyConversion;
  List<dynamic>? customFields;
  CustomTextEntity? customText;
  dynamic customer;
  String? customerCreation;
  CustomerDetailsEntity? customerDetails;
  String? customerEmail;
  List<dynamic>? discounts;
  num? expiresAt;
  dynamic invoice;
  InvoiceCreationEntity? invoiceCreation;
  bool? liveMode;
  dynamic locale;
  AddressInfoEntity? metadata;
  String? mode;
  dynamic paymentIntent;
  dynamic paymentLink;
  String? paymentMethodCollection;
  PaymentMethodConfigurationDetailsEntity? paymentMethodConfigurationDetails;
  PaymentMethodOptionsEntity? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  String? paymentStatus;
  dynamic permissions;
  PhoneNumberCollectionEntity? phoneNumberCollection;
  dynamic recoveredFrom;
  dynamic savedPaymentMethodOptions;
  dynamic setupIntent;
  dynamic shippingAddressCollection;
  dynamic shippingCost;
  dynamic shippingDetails;
  List<dynamic>? shippingOptions;
  String? status;
  dynamic submitType;
  dynamic subscription;
  String? successUrl;
  TotalDetailsEntity? totalDetails;
  String? uiMode;
  String? url;
  dynamic walletOptions;
  @override
  List<Object?> get props => [
        id,
        object,
        adaptivePricing,
        afterExpiration,
        allowPromotionCodes,
        amountSubtotal,
        amountTotal,
        automaticTax,
        billingAddressCollection,
        cancelUrl,
        clientReferenceId,
        clientSecret,
        collectedInformation,
        consent,
        consentCollection,
        created,
        currency,
        currencyConversion,
        customFields,
        customText,
        customer,
        customerCreation,
        customerDetails,
        customerEmail,
        discounts,
        expiresAt,
        invoice,
        invoiceCreation,
        liveMode,
        locale,
        metadata,
        mode,
        paymentIntent,
        paymentLink,
        paymentMethodCollection,
        paymentMethodConfigurationDetails,
        paymentMethodOptions,
        paymentMethodTypes,
        paymentStatus,
        permissions,
        phoneNumberCollection,
        recoveredFrom,
        savedPaymentMethodOptions,
        setupIntent,
        shippingAddressCollection,
        shippingCost,
        shippingDetails,
        shippingOptions,
        status,
        submitType,
        subscription,
        successUrl,
        totalDetails,
        uiMode,
        url,
        walletOptions,
      ];
}

class TotalDetailsEntity extends Equatable {
  TotalDetailsEntity({
    this.amountDiscount,
    this.amountShipping,
    this.amountTax,
  });

  num? amountDiscount;
  num? amountShipping;
  num? amountTax;

  @override
  List<Object?> get props => [
        amountDiscount,
        amountShipping,
        amountTax,
      ];
}

class PhoneNumberCollectionEntity extends Equatable {
  PhoneNumberCollectionEntity({
    this.enabled,
  });

  bool? enabled;
  @override
  List<Object?> get props => [enabled];
}

class PaymentMethodOptionsEntity extends Equatable {
  PaymentMethodOptionsEntity({
    this.card,
  });

  CardEntity? card;

  @override
  List<Object?> get props => [card];
}

class CardEntity extends Equatable {
  CardEntity({
    this.requestThreeDSecure,
  });

  String? requestThreeDSecure;

  @override
  List<Object?> get props => [requestThreeDSecure];
}

class PaymentMethodConfigurationDetailsEntity extends Equatable {
  PaymentMethodConfigurationDetailsEntity({
    this.id,
    this.parent,
  });

  String? id;
  dynamic parent;

  @override
  List<Object?> get props => [id, parent];
}

class AddressInfoEntity extends Equatable {
  AddressInfoEntity({
    this.city,
    this.lat,
    this.long,
    this.phone,
    this.street,
  });

  String? city;
  String? lat;
  String? long;
  String? phone;
  String? street;

  @override
  List<Object?> get props => [
        city,
        lat,
        long,
        phone,
        street,
      ];
}

class InvoiceCreationEntity extends Equatable{
  InvoiceCreationEntity({
    this.enabled,
    this.invoiceData,
  });

  bool? enabled;
  InvoiceDataEntity? invoiceData;

  @override
  List<Object?> get props => [enabled,invoiceData];
}

class InvoiceDataEntity extends Equatable{
  InvoiceDataEntity({
    this.accountTaxIds,
    this.customFields,
    this.description,
    this.footer,
    this.issuer,
    this.metadata,
    this.renderingOptions,
  });

  dynamic accountTaxIds;
  dynamic customFields;
  dynamic description;
  dynamic footer;
  dynamic issuer;
  dynamic metadata;
  dynamic renderingOptions;

  @override
  List<Object?> get props => [
    accountTaxIds,
    customFields,
    description,
    footer,
    issuer,
    metadata,
    renderingOptions
  ];
}

class CustomerDetailsEntity extends Equatable{
  CustomerDetailsEntity({
    this.address,
    this.email,
    this.name,
    this.phone,
    this.taxExempt,
    this.taxIds,
  });

  dynamic address;
  String? email;
  dynamic name;
  dynamic phone;
  String? taxExempt;
  dynamic taxIds;

  @override
  List<Object?> get props => [address, email, name, phone, taxExempt, taxIds];
}

class CustomTextEntity extends Equatable{
  CustomTextEntity({
    this.afterSubmit,
    this.shippingAddress,
    this.submit,
    this.termsOfServiceAcceptance,
  });

  dynamic afterSubmit;
  dynamic shippingAddress;
  dynamic submit;
  dynamic termsOfServiceAcceptance;

  @override
  List<Object?> get props =>
      [afterSubmit, shippingAddress, submit, termsOfServiceAcceptance];
}

class CollectedInformationEntity extends Equatable{
  CollectedInformationEntity({
    this.shippingDetails,
  });

  dynamic shippingDetails;

  @override
  List<Object?> get props => [shippingDetails];
}

class AutomaticTaxEntity extends Equatable {
  AutomaticTaxEntity({
    this.enabled,
    this.liability,
    this.provider,
    this.status,
  });

  bool? enabled;
  dynamic liability;
  dynamic provider;
  dynamic status;

  @override
  List<Object?> get props => [enabled, liability, provider, status];
}

class AdaptivePricingEntity extends Equatable{
  AdaptivePricingEntity({
    this.enabled,
  });

  bool? enabled;

  @override
  List<Object?> get props => [enabled];
}
