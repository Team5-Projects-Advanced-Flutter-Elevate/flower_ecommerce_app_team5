import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'checkout_response_dto.g.dart';

/// message : "success"
/// session : {"id":"cs_test_a1nGElwRVMJbfLVHSP1GnYH47Tbj1s0Aboyk2o8ctPAKAg2Lb9PXyIHb9x","object":"checkout.session","adaptive_pricing":{"enabled":true},"after_expiration":null,"allow_promotion_codes":null,"amount_subtotal":22000,"amount_total":22000,"automatic_tax":{"enabled":false,"liability":null,"provider":null,"status":null},"billing_address_collection":null,"cancel_url":"http://localhost:3000/cart","client_reference_id":"6804f8bda9832d8359e54bfa","client_secret":null,"collected_information":{"shipping_details":null},"consent":null,"consent_collection":null,"created":1745156304,"currency":"egp","currency_conversion":null,"custom_fields":[],"custom_text":{"after_submit":null,"shipping_address":null,"submit":null,"terms_of_service_acceptance":null},"customer":null,"customer_creation":"if_required","customer_details":{"address":null,"email":"klilmohammed9@gmail.com","name":null,"phone":null,"tax_exempt":"none","tax_ids":null},"customer_email":"klilmohammed9@gmail.com","discounts":[],"expires_at":1745242704,"invoice":null,"invoice_creation":{"enabled":false,"invoice_data":{"account_tax_ids":null,"custom_fields":null,"description":null,"footer":null,"issuer":null,"metadata":{},"rendering_options":null}},"livemode":false,"locale":null,"metadata":{"city":"Cairo","lat":"String","long":"String","phone":"01010700999","street":"details"},"mode":"payment","payment_intent":null,"payment_link":null,"payment_method_collection":"if_required","payment_method_configuration_details":{"id":"pmc_1MphffE0S7VoKZmPNNp2G77I","parent":null},"payment_method_options":{"card":{"request_three_d_secure":"automatic"}},"payment_method_types":["card","link"],"payment_status":"unpaid","permissions":null,"phone_number_collection":{"enabled":false},"recovered_from":null,"saved_payment_method_options":null,"setup_intent":null,"shipping_address_collection":null,"shipping_cost":null,"shipping_details":null,"shipping_options":[],"status":"open","submit_type":null,"subscription":null,"success_url":"http://localhost:3000/allOrders","total_details":{"amount_discount":0,"amount_shipping":0,"amount_tax":0},"ui_mode":"hosted","url":"https://checkout.stripe.com/c/pay/cs_test_a1nGElwRVMJbfLVHSP1GnYH47Tbj1s0Aboyk2o8ctPAKAg2Lb9PXyIHb9x#fidkdWxOYHwnPyd1blpxYHZxWjA0SHViYl1ANVYyU2pOX2hVVW9ASmZBUElpa2FLVnBUQGo2UFduUEhIXHx9aEhjanBGZ1NxZ3RKNVVtXWxcSTJ8Qzx2aWZkUEBpMXJCXVRHTkIxZzBSZmhENTUxYHVKMUpQVycpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl","wallet_options":null}

@JsonSerializable(createToJson: false)
class CheckoutResponseDto extends Equatable {
  CheckoutResponseDto({
    this.message,
    this.session,
  });

  factory CheckoutResponseDto.fromJson(dynamic json) =>
      _$CheckoutResponseDtoFromJson(json);
  String? message;
  SessionDto? session;
  CheckoutResponseEntity convertIntoEntity() {
    return CheckoutResponseEntity(
        message: message, session: session?.convertIntoEntity());
  }

  @override
  List<Object?> get props => [message, session];
}

/// id : "cs_test_a1nGElwRVMJbfLVHSP1GnYH47Tbj1s0Aboyk2o8ctPAKAg2Lb9PXyIHb9x"
/// object : "checkout.session"
/// adaptive_pricing : {"enabled":true}
/// after_expiration : null
/// allow_promotion_codes : null
/// amount_subtotal : 22000
/// amount_total : 22000
/// automatic_tax : {"enabled":false,"liability":null,"provider":null,"status":null}
/// billing_address_collection : null
/// cancel_url : "http://localhost:3000/cart"
/// client_reference_id : "6804f8bda9832d8359e54bfa"
/// client_secret : null
/// collected_information : {"shipping_details":null}
/// consent : null
/// consent_collection : null
/// created : 1745156304
/// currency : "egp"
/// currency_conversion : null
/// custom_fields : []
/// custom_text : {"after_submit":null,"shipping_address":null,"submit":null,"terms_of_service_acceptance":null}
/// customer : null
/// customer_creation : "if_required"
/// customer_details : {"address":null,"email":"klilmohammed9@gmail.com","name":null,"phone":null,"tax_exempt":"none","tax_ids":null}
/// customer_email : "klilmohammed9@gmail.com"
/// discounts : []
/// expires_at : 1745242704
/// invoice : null
/// invoice_creation : {"enabled":false,"invoice_data":{"account_tax_ids":null,"custom_fields":null,"description":null,"footer":null,"issuer":null,"metadata":{},"rendering_options":null}}
/// livemode : false
/// locale : null
/// metadata : {"city":"Cairo","lat":"String","long":"String","phone":"01010700999","street":"details"}
/// mode : "payment"
/// payment_intent : null
/// payment_link : null
/// payment_method_collection : "if_required"
/// payment_method_configuration_details : {"id":"pmc_1MphffE0S7VoKZmPNNp2G77I","parent":null}
/// payment_method_options : {"card":{"request_three_d_secure":"automatic"}}
/// payment_method_types : ["card","link"]
/// payment_status : "unpaid"
/// permissions : null
/// phone_number_collection : {"enabled":false}
/// recovered_from : null
/// saved_payment_method_options : null
/// setup_intent : null
/// shipping_address_collection : null
/// shipping_cost : null
/// shipping_details : null
/// shipping_options : []
/// status : "open"
/// submit_type : null
/// subscription : null
/// success_url : "http://localhost:3000/allOrders"
/// total_details : {"amount_discount":0,"amount_shipping":0,"amount_tax":0}
/// ui_mode : "hosted"
/// url : "https://checkout.stripe.com/c/pay/cs_test_a1nGElwRVMJbfLVHSP1GnYH47Tbj1s0Aboyk2o8ctPAKAg2Lb9PXyIHb9x#fidkdWxOYHwnPyd1blpxYHZxWjA0SHViYl1ANVYyU2pOX2hVVW9ASmZBUElpa2FLVnBUQGo2UFduUEhIXHx9aEhjanBGZ1NxZ3RKNVVtXWxcSTJ8Qzx2aWZkUEBpMXJCXVRHTkIxZzBSZmhENTUxYHVKMUpQVycpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl"
/// wallet_options : null

@JsonSerializable(createToJson: false)
class SessionDto extends Equatable {
  SessionDto({
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

  factory SessionDto.fromJson(dynamic json) => _$SessionDtoFromJson(json);
  String? id;
  String? object;
  @JsonKey(name: 'adaptive_pricing')
  AdaptivePricingDto? adaptivePricing;
  @JsonKey(name: 'after_expiration')
  dynamic afterExpiration;
  @JsonKey(name: 'allow_promotion_codes')
  dynamic allowPromotionCodes;
  @JsonKey(name: 'amount_subtotal')
  num? amountSubtotal;
  @JsonKey(name: 'amount_total')
  num? amountTotal;
  @JsonKey(name: 'automatic_tax')
  AutomaticTaxDto? automaticTax;
  @JsonKey(name: 'billing_address_collection')
  dynamic billingAddressCollection;
  @JsonKey(name: 'cancel_url')
  String? cancelUrl;
  @JsonKey(name: 'client_reference_id')
  String? clientReferenceId;
  @JsonKey(name: 'client_secret')
  dynamic clientSecret;
  @JsonKey(name: 'collected_information')
  CollectedInformationDto? collectedInformation;
  dynamic consent;
  @JsonKey(name: 'consent_collection')
  dynamic consentCollection;
  num? created;
  String? currency;
  @JsonKey(name: 'currency_conversion')
  dynamic currencyConversion;

  @JsonKey(name: 'custom_fields')
  List<dynamic>? customFields;
  @JsonKey(name: 'custom_text')
  CustomTextDto? customText;
  dynamic customer;
  @JsonKey(name: 'customer_creation')
  String? customerCreation;
  @JsonKey(name: 'customer_details')
  CustomerDetailsDto? customerDetails;
  @JsonKey(name: 'customer_email')
  String? customerEmail;
  List<dynamic>? discounts;
  @JsonKey(name: 'expires_at')
  num? expiresAt;
  dynamic invoice;
  @JsonKey(name: 'invoice_creation')
  InvoiceCreationDto? invoiceCreation;
  @JsonKey(name: 'livemode')
  bool? liveMode;
  dynamic locale;
  AddressInfoDto? metadata;
  String? mode;
  @JsonKey(name: 'payment_intent')
  dynamic paymentIntent;
  @JsonKey(name: 'payment_link')
  dynamic paymentLink;
  @JsonKey(name: 'payment_method_collection')
  String? paymentMethodCollection;
  @JsonKey(name: 'payment_method_configuration_details')
  PaymentMethodConfigurationDetailsDto? paymentMethodConfigurationDetails;
  @JsonKey(name: 'payment_method_options')
  PaymentMethodOptionsDto? paymentMethodOptions;
  @JsonKey(name: 'payment_method_types')
  List<String>? paymentMethodTypes;
  @JsonKey(name: 'payment_status')
  String? paymentStatus;
  dynamic permissions;
  @JsonKey(name: 'phone_number_collection')
  PhoneNumberCollectionDto? phoneNumberCollection;
  @JsonKey(name: 'recovered_from')
  dynamic recoveredFrom;
  @JsonKey(name: 'saved_payment_method_options')
  dynamic savedPaymentMethodOptions;
  @JsonKey(name: 'setup_intent')
  dynamic setupIntent;
  @JsonKey(name: 'shipping_address_collection')
  dynamic shippingAddressCollection;
  @JsonKey(name: 'shipping_cost')
  dynamic shippingCost;
  @JsonKey(name: 'shipping_details')
  dynamic shippingDetails;
  @JsonKey(name: 'shipping_options')
  List<dynamic>? shippingOptions;
  String? status;
  @JsonKey(name: 'submit_type')
  dynamic submitType;
  dynamic subscription;
  @JsonKey(name: 'success_url')
  String? successUrl;
  @JsonKey(name: 'total_details')
  TotalDetailsDto? totalDetails;
  @JsonKey(name: 'ui_mode')
  String? uiMode;
  String? url;
  @JsonKey(name: 'wallet_options')
  dynamic walletOptions;

  SessionEntity convertIntoEntity() {
    return SessionEntity(
        id: id,
        metadata: metadata?.convertIntoEntity(),
        adaptivePricing: adaptivePricing?.convertIntoEntity(),
        afterExpiration: afterExpiration,
        allowPromotionCodes: allowPromotionCodes,
        amountSubtotal: amountSubtotal,
        amountTotal: amountTotal,
        automaticTax: automaticTax?.convertIntoEntity(),
        billingAddressCollection: billingAddressCollection,
        cancelUrl: cancelUrl,
        clientReferenceId: clientReferenceId,
        clientSecret: clientSecret,
        collectedInformation: collectedInformation?.convertIntoEntity(),
        consent: consent,
        consentCollection: consentCollection,
        created: created,
        currency: currency,
        currencyConversion: currencyConversion,
        customer: customer,
        customerCreation: customerCreation,
        customerDetails: customerDetails?.convertIntoEntity(),
        customerEmail: customerEmail,
        customFields: customFields,
        customText: customText?.convertIntoEntity(),
        discounts: discounts,
        expiresAt: expiresAt,
        invoice: invoice,
        invoiceCreation: invoiceCreation?.convertIntoEntity(),
        liveMode: liveMode,
        locale: locale,
        mode: mode,
        object: object,
        paymentIntent: paymentIntent,
        paymentLink: paymentLink,
        paymentMethodCollection: paymentMethodCollection,
        paymentMethodConfigurationDetails:
            paymentMethodConfigurationDetails?.convertIntoEntity(),
        paymentMethodOptions: paymentMethodOptions?.convertIntoEntity(),
        paymentMethodTypes: paymentMethodTypes,
        paymentStatus: paymentStatus,
        permissions: permissions,
        phoneNumberCollection: phoneNumberCollection?.convertIntoEntity(),
        recoveredFrom: recoveredFrom,
        savedPaymentMethodOptions: savedPaymentMethodOptions,
        setupIntent: setupIntent,
        shippingAddressCollection: shippingAddressCollection,
        shippingCost: shippingCost,
        shippingDetails: shippingDetails,
        shippingOptions: shippingOptions,
        status: status,
        submitType: submitType,
        subscription: subscription,
        successUrl: successUrl,
        totalDetails: totalDetails?.convertIntoEntity(),
        uiMode: uiMode,
        url: url,
        walletOptions: walletOptions);
  }

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

/// amount_discount : 0
/// amount_shipping : 0
/// amount_tax : 0
@JsonSerializable(createToJson: false)
class TotalDetailsDto extends Equatable {
  TotalDetailsDto({
    this.amountDiscount,
    this.amountShipping,
    this.amountTax,
  });

  factory TotalDetailsDto.fromJson(dynamic json) =>
      _$TotalDetailsDtoFromJson(json);
  @JsonKey(name: 'amount_discount')
  num? amountDiscount;
  @JsonKey(name: 'amount_shipping')
  num? amountShipping;
  @JsonKey(name: 'amount_tax')
  num? amountTax;
  TotalDetailsEntity convertIntoEntity() {
    return TotalDetailsEntity(
        amountDiscount: amountDiscount,
        amountShipping: amountShipping,
        amountTax: amountTax);
  }

  @override
  List<Object?> get props => [
        amountDiscount,
        amountShipping,
        amountTax,
      ];
}

/// enabled : false
@JsonSerializable(createToJson: false)
class PhoneNumberCollectionDto extends Equatable {
  PhoneNumberCollectionDto({
    this.enabled,
  });

  factory PhoneNumberCollectionDto.fromJson(dynamic json) =>
      _$PhoneNumberCollectionDtoFromJson(json);
  bool? enabled;
  PhoneNumberCollectionEntity convertIntoEntity() {
    return PhoneNumberCollectionEntity(enabled: enabled);
  }

  @override
  List<Object?> get props => [enabled];
}

/// card : {"request_three_d_secure":"automatic"}
@JsonSerializable(createToJson: false)
class PaymentMethodOptionsDto extends Equatable {
  PaymentMethodOptionsDto({
    this.card,
  });

  factory PaymentMethodOptionsDto.fromJson(dynamic json) =>
      _$PaymentMethodOptionsDtoFromJson(json);
  CardDto? card;
  PaymentMethodOptionsEntity convertIntoEntity() {
    return PaymentMethodOptionsEntity(card: card?.convertIntoEntity());
  }

  @override
  List<Object?> get props => [card];
}

/// request_three_d_secure : "automatic"
@JsonSerializable(createToJson: false)
class CardDto extends Equatable {
  CardDto({
    this.requestThreeDSecure,
  });

  factory CardDto.fromJson(dynamic json) => _$CardDtoFromJson(json);
  @JsonKey(name: 'request_three_d_secure')
  String? requestThreeDSecure;
  CardEntity convertIntoEntity() {
    return CardEntity(requestThreeDSecure: requestThreeDSecure);
  }

  @override
  List<Object?> get props => [requestThreeDSecure];
}

/// id : "pmc_1MphffE0S7VoKZmPNNp2G77I"
/// parent : null
@JsonSerializable(createToJson: false)
class PaymentMethodConfigurationDetailsDto extends Equatable {
  PaymentMethodConfigurationDetailsDto({
    this.id,
    this.parent,
  });

  factory PaymentMethodConfigurationDetailsDto.fromJson(dynamic json) =>
      _$PaymentMethodConfigurationDetailsDtoFromJson(json);
  String? id;
  dynamic parent;
  PaymentMethodConfigurationDetailsEntity convertIntoEntity() {
    return PaymentMethodConfigurationDetailsEntity(id: id, parent: parent);
  }

  @override
  List<Object?> get props => [id, parent];
}

/// city : "Cairo"
/// lat : "String"
/// long : "String"
/// phone : "01010700999"
/// street : "details"
@JsonSerializable(createToJson: false)
class AddressInfoDto extends Equatable {
  AddressInfoDto({
    this.city,
    this.lat,
    this.long,
    this.phone,
    this.street,
  });

  factory AddressInfoDto.fromJson(dynamic json) =>
      _$AddressInfoDtoFromJson(json);
  String? city;
  String? lat;
  String? long;
  String? phone;
  String? street;
  AddressInfoEntity convertIntoEntity() {
    return AddressInfoEntity(
        city: city, lat: lat, long: long, phone: phone, street: street);
  }

  @override
  List<Object?> get props => [
        city,
        lat,
        long,
        phone,
        street,
      ];
}

/// enabled : false
/// invoice_data : {"account_tax_ids":null,"custom_fields":null,"description":null,"footer":null,"issuer":null,"metadata":{},"rendering_options":null}
@JsonSerializable(createToJson: false)
class InvoiceCreationDto extends Equatable {
  InvoiceCreationDto({
    this.enabled,
    this.invoiceData,
  });

  factory InvoiceCreationDto.fromJson(dynamic json) =>
      _$InvoiceCreationDtoFromJson(json);
  bool? enabled;
  @JsonKey(name: 'invoice_data')
  InvoiceDataDto? invoiceData;

  InvoiceCreationEntity convertIntoEntity() {
    return InvoiceCreationEntity(
      enabled: enabled,
      invoiceData: invoiceData?.convertIntoEntity(),
    );
  }

  @override
  List<Object?> get props => [enabled, invoiceData];
}

/// account_tax_ids : null
/// custom_fields : null
/// description : null
/// footer : null
/// issuer : null
/// metadata : {}
/// rendering_options : null
@JsonSerializable(createToJson: false)
class InvoiceDataDto extends Equatable {
  InvoiceDataDto({
    this.accountTaxIds,
    this.customFields,
    this.description,
    this.footer,
    this.issuer,
    this.metadata,
    this.renderingOptions,
  });

  factory InvoiceDataDto.fromJson(dynamic json) =>
      _$InvoiceDataDtoFromJson(json);

  @JsonKey(name: 'account_tax_ids')
  dynamic accountTaxIds;
  @JsonKey(name: 'custom_fields')
  dynamic customFields;
  dynamic description;
  dynamic footer;
  dynamic issuer;
  dynamic metadata;
  @JsonKey(name: 'rendering_options')
  dynamic renderingOptions;
  InvoiceDataEntity convertIntoEntity() {
    return InvoiceDataEntity(
      customFields: customFields,
      description: description,
      footer: footer,
      issuer: issuer,
      metadata: metadata,
      accountTaxIds: accountTaxIds,
      renderingOptions: renderingOptions,
    );
  }

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

/// address : null
/// email : "klilmohammed9@gmail.com"
/// name : null
/// phone : null
/// tax_exempt : "none"
/// tax_ids : null
@JsonSerializable(createToJson: false)
class CustomerDetailsDto extends Equatable {
  CustomerDetailsDto({
    this.address,
    this.email,
    this.name,
    this.phone,
    this.taxExempt,
    this.taxIds,
  });

  factory CustomerDetailsDto.fromJson(dynamic json) =>
      _$CustomerDetailsDtoFromJson(json);
  dynamic address;
  String? email;
  dynamic name;
  dynamic phone;
  @JsonKey(name: 'tax_exempt')
  String? taxExempt;
  @JsonKey(name: 'tax_ids')
  dynamic taxIds;
  CustomerDetailsEntity convertIntoEntity() {
    return CustomerDetailsEntity(
      address: address,
      email: email,
      phone: phone,
      taxExempt: taxExempt,
      taxIds: taxIds,
      name: name,
    );
  }

  @override
  List<Object?> get props => [address, email, name, phone, taxExempt, taxIds];
}

/// after_submit : null
/// shipping_address : null
/// submit : null
/// terms_of_service_acceptance : null
@JsonSerializable(createToJson: false)
class CustomTextDto extends Equatable {
  CustomTextDto({
    this.afterSubmit,
    this.shippingAddress,
    this.submit,
    this.termsOfServiceAcceptance,
  });

  factory CustomTextDto.fromJson(dynamic json) => _$CustomTextDtoFromJson(json);
  @JsonKey(name: 'after_submit')
  dynamic afterSubmit;
  @JsonKey(name: 'shipping_address')
  dynamic shippingAddress;
  dynamic submit;
  @JsonKey(name: 'terms_of_service_acceptance')
  dynamic termsOfServiceAcceptance;

  CustomTextEntity convertIntoEntity() {
    return CustomTextEntity(
      afterSubmit: afterSubmit,
      shippingAddress: shippingAddress,
      submit: submit,
      termsOfServiceAcceptance: termsOfServiceAcceptance,
    );
  }

  @override
  List<Object?> get props =>
      [afterSubmit, shippingAddress, submit, termsOfServiceAcceptance];
}

/// shipping_details : null
@JsonSerializable(createToJson: false)
class CollectedInformationDto extends Equatable {
  CollectedInformationDto({
    this.shippingDetails,
  });

  factory CollectedInformationDto.fromJson(dynamic json) =>
      _$CollectedInformationDtoFromJson(json);

  @JsonKey(name: 'shipping_details')
  dynamic shippingDetails;
  CollectedInformationEntity convertIntoEntity() {
    return CollectedInformationEntity(shippingDetails: shippingDetails);
  }

  @override
  List<Object?> get props => [shippingDetails];
}

/// enabled : false
/// liability : null
/// provider : null
/// status : null
@JsonSerializable(createToJson: false)
class AutomaticTaxDto extends Equatable {
  AutomaticTaxDto({
    this.enabled,
    this.liability,
    this.provider,
    this.status,
  });

  factory AutomaticTaxDto.fromJson(dynamic json) =>
      _$AutomaticTaxDtoFromJson(json);
  bool? enabled;
  dynamic liability;
  dynamic provider;
  dynamic status;
  AutomaticTaxEntity convertIntoEntity() {
    return AutomaticTaxEntity(
        enabled: enabled,
        liability: liability,
        provider: provider,
        status: status);
  }

  @override
  List<Object?> get props => [enabled, liability, provider, status];
}

/// enabled : true
@JsonSerializable(createToJson: false)
class AdaptivePricingDto extends Equatable {
  AdaptivePricingDto({
    this.enabled,
  });

  factory AdaptivePricingDto.fromJson(dynamic json) =>
      _$AdaptivePricingDtoFromJson(json);
  bool? enabled;

  AdaptivePricingEntity convertIntoEntity() {
    return AdaptivePricingEntity(enabled: enabled);
  }

  @override
  List<Object?> get props => [enabled];
}
