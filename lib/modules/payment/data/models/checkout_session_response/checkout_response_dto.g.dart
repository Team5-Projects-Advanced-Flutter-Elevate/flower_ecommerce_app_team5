// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutResponseDto _$CheckoutResponseDtoFromJson(Map<String, dynamic> json) =>
    CheckoutResponseDto(
      message: json['message'] as String?,
      session:
          json['session'] == null ? null : SessionDto.fromJson(json['session']),
    );

SessionDto _$SessionDtoFromJson(Map<String, dynamic> json) => SessionDto(
      id: json['id'] as String?,
      object: json['object'] as String?,
      adaptivePricing: json['adaptive_pricing'] == null
          ? null
          : AdaptivePricingDto.fromJson(json['adaptive_pricing']),
      afterExpiration: json['after_expiration'],
      allowPromotionCodes: json['allow_promotion_codes'],
      amountSubtotal: json['amount_subtotal'] as num?,
      amountTotal: json['amount_total'] as num?,
      automaticTax: json['automatic_tax'] == null
          ? null
          : AutomaticTaxDto.fromJson(json['automatic_tax']),
      billingAddressCollection: json['billing_address_collection'],
      cancelUrl: json['cancel_url'] as String?,
      clientReferenceId: json['client_reference_id'] as String?,
      clientSecret: json['client_secret'],
      collectedInformation: json['collected_information'] == null
          ? null
          : CollectedInformationDto.fromJson(json['collected_information']),
      consent: json['consent'],
      consentCollection: json['consent_collection'],
      created: json['created'] as num?,
      currency: json['currency'] as String?,
      currencyConversion: json['currency_conversion'],
      customFields: json['custom_fields'] as List<dynamic>?,
      customText: json['custom_text'] == null
          ? null
          : CustomTextDto.fromJson(json['custom_text']),
      customer: json['customer'],
      customerCreation: json['customer_creation'] as String?,
      customerDetails: json['customer_details'] == null
          ? null
          : CustomerDetailsDto.fromJson(json['customer_details']),
      customerEmail: json['customer_email'] as String?,
      discounts: json['discounts'] as List<dynamic>?,
      expiresAt: json['expires_at'] as num?,
      invoice: json['invoice'],
      invoiceCreation: json['invoice_creation'] == null
          ? null
          : InvoiceCreationDto.fromJson(json['invoice_creation']),
      liveMode: json['livemode'] as bool?,
      locale: json['locale'],
      metadata: json['metadata'] == null
          ? null
          : AddressInfoDto.fromJson(json['metadata']),
      mode: json['mode'] as String?,
      paymentIntent: json['payment_intent'],
      paymentLink: json['payment_link'],
      paymentMethodCollection: json['payment_method_collection'] as String?,
      paymentMethodConfigurationDetails:
          json['payment_method_configuration_details'] == null
              ? null
              : PaymentMethodConfigurationDetailsDto.fromJson(
                  json['payment_method_configuration_details']),
      paymentMethodOptions: json['payment_method_options'] == null
          ? null
          : PaymentMethodOptionsDto.fromJson(json['payment_method_options']),
      paymentMethodTypes: (json['payment_method_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      paymentStatus: json['payment_status'] as String?,
      permissions: json['permissions'],
      phoneNumberCollection: json['phone_number_collection'] == null
          ? null
          : PhoneNumberCollectionDto.fromJson(json['phone_number_collection']),
      recoveredFrom: json['recovered_from'],
      savedPaymentMethodOptions: json['saved_payment_method_options'],
      setupIntent: json['setup_intent'],
      shippingAddressCollection: json['shipping_address_collection'],
      shippingCost: json['shipping_cost'],
      shippingDetails: json['shipping_details'],
      shippingOptions: json['shipping_options'] as List<dynamic>?,
      status: json['status'] as String?,
      submitType: json['submit_type'],
      subscription: json['subscription'],
      successUrl: json['success_url'] as String?,
      totalDetails: json['total_details'] == null
          ? null
          : TotalDetailsDto.fromJson(json['total_details']),
      uiMode: json['ui_mode'] as String?,
      url: json['url'] as String?,
      walletOptions: json['wallet_options'],
    );

TotalDetailsDto _$TotalDetailsDtoFromJson(Map<String, dynamic> json) =>
    TotalDetailsDto(
      amountDiscount: json['amount_discount'] as num?,
      amountShipping: json['amount_shipping'] as num?,
      amountTax: json['amount_tax'] as num?,
    );

PhoneNumberCollectionDto _$PhoneNumberCollectionDtoFromJson(
        Map<String, dynamic> json) =>
    PhoneNumberCollectionDto(
      enabled: json['enabled'] as bool?,
    );

PaymentMethodOptionsDto _$PaymentMethodOptionsDtoFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodOptionsDto(
      card: json['card'] == null ? null : CardDto.fromJson(json['card']),
    );

CardDto _$CardDtoFromJson(Map<String, dynamic> json) => CardDto(
      requestThreeDSecure: json['request_three_d_secure'] as String?,
    );

PaymentMethodConfigurationDetailsDto
    _$PaymentMethodConfigurationDetailsDtoFromJson(Map<String, dynamic> json) =>
        PaymentMethodConfigurationDetailsDto(
          id: json['id'] as String?,
          parent: json['parent'],
        );

AddressInfoDto _$AddressInfoDtoFromJson(Map<String, dynamic> json) =>
    AddressInfoDto(
      city: json['city'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      phone: json['phone'] as String?,
      street: json['street'] as String?,
    );

InvoiceCreationDto _$InvoiceCreationDtoFromJson(Map<String, dynamic> json) =>
    InvoiceCreationDto(
      enabled: json['enabled'] as bool?,
      invoiceData: json['invoice_data'] == null
          ? null
          : InvoiceDataDto.fromJson(json['invoice_data']),
    );

InvoiceDataDto _$InvoiceDataDtoFromJson(Map<String, dynamic> json) =>
    InvoiceDataDto(
      accountTaxIds: json['account_tax_ids'],
      customFields: json['custom_fields'],
      description: json['description'],
      footer: json['footer'],
      issuer: json['issuer'],
      metadata: json['metadata'],
      renderingOptions: json['rendering_options'],
    );

CustomerDetailsDto _$CustomerDetailsDtoFromJson(Map<String, dynamic> json) =>
    CustomerDetailsDto(
      address: json['address'],
      email: json['email'] as String?,
      name: json['name'],
      phone: json['phone'],
      taxExempt: json['tax_exempt'] as String?,
      taxIds: json['tax_ids'],
    );

CustomTextDto _$CustomTextDtoFromJson(Map<String, dynamic> json) =>
    CustomTextDto(
      afterSubmit: json['after_submit'],
      shippingAddress: json['shipping_address'],
      submit: json['submit'],
      termsOfServiceAcceptance: json['terms_of_service_acceptance'],
    );

CollectedInformationDto _$CollectedInformationDtoFromJson(
        Map<String, dynamic> json) =>
    CollectedInformationDto(
      shippingDetails: json['shipping_details'],
    );

AutomaticTaxDto _$AutomaticTaxDtoFromJson(Map<String, dynamic> json) =>
    AutomaticTaxDto(
      enabled: json['enabled'] as bool?,
      liability: json['liability'],
      provider: json['provider'],
      status: json['status'],
    );

AdaptivePricingDto _$AdaptivePricingDtoFromJson(Map<String, dynamic> json) =>
    AdaptivePricingDto(
      enabled: json['enabled'] as bool?,
    );
