class CheckoutResponseEntity {
  CheckoutResponseEntity({
    this.message,
    this.session,
  });

  String? message;
  SessionEntity? session;
}

class SessionEntity {
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
    this.livemode,
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
  bool? livemode;
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
}

class TotalDetailsEntity {
  TotalDetailsEntity({
    this.amountDiscount,
    this.amountShipping,
    this.amountTax,
  });

  num? amountDiscount;
  num? amountShipping;
  num? amountTax;
}

class PhoneNumberCollectionEntity {
  PhoneNumberCollectionEntity({
    this.enabled,
  });

  bool? enabled;
}

class PaymentMethodOptionsEntity {
  PaymentMethodOptionsEntity({
    this.card,
  });

  CardEntity? card;
}

class CardEntity {
  CardEntity({
    this.requestThreeDSecure,
  });

  String? requestThreeDSecure;
}

class PaymentMethodConfigurationDetailsEntity {
  PaymentMethodConfigurationDetailsEntity({
    this.id,
    this.parent,
  });

  String? id;
  dynamic parent;
}

class AddressInfoEntity {
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
}

class InvoiceCreationEntity {
  InvoiceCreationEntity({
    this.enabled,
    this.invoiceData,
  });

  bool? enabled;
  InvoiceDataEntity? invoiceData;
}

class InvoiceDataEntity {
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
}

class CustomerDetailsEntity {
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
}

class CustomTextEntity {
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
}

class CollectedInformationEntity {
  CollectedInformationEntity({
    this.shippingDetails,
  });

  dynamic shippingDetails;
}

class AutomaticTaxEntity {
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
}

class AdaptivePricingEntity {
  AdaptivePricingEntity({
    this.enabled,
  });

  bool? enabled;
}
