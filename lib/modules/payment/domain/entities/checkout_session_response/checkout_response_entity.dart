import 'package:equatable/equatable.dart';

class CheckoutResponseEntity extends Equatable {
  const CheckoutResponseEntity({
    this.message,
    this.session,
  });

  final String? message;
  final SessionEntity? session;

  @override
  List<Object?> get props => [message, session];
}

class SessionEntity extends Equatable {
  const SessionEntity({
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

  final String? id;
  final String? object;
  final AdaptivePricingEntity? adaptivePricing;
  final dynamic afterExpiration;
  final dynamic allowPromotionCodes;
  final num? amountSubtotal;
  final num? amountTotal;
  final AutomaticTaxEntity? automaticTax;
  final dynamic billingAddressCollection;
  final String? cancelUrl;
  final String? clientReferenceId;
  final dynamic clientSecret;
  final CollectedInformationEntity? collectedInformation;
  final dynamic consent;
  final dynamic consentCollection;
  final num? created;
  final String? currency;
  final dynamic currencyConversion;
  final List<dynamic>? customFields;
  final CustomTextEntity? customText;
  final dynamic customer;
  final String? customerCreation;
  final CustomerDetailsEntity? customerDetails;
  final String? customerEmail;
  final List<dynamic>? discounts;
  final num? expiresAt;
  final dynamic invoice;
  final InvoiceCreationEntity? invoiceCreation;
  final bool? liveMode;
  final dynamic locale;
  final AddressInfoEntity? metadata;
  final String? mode;
  final dynamic paymentIntent;
  final dynamic paymentLink;
  final String? paymentMethodCollection;
  final PaymentMethodConfigurationDetailsEntity? paymentMethodConfigurationDetails;
  final PaymentMethodOptionsEntity? paymentMethodOptions;
  final List<String>? paymentMethodTypes;
  final String? paymentStatus;
  final dynamic permissions;
  final PhoneNumberCollectionEntity? phoneNumberCollection;
  final dynamic recoveredFrom;
  final dynamic savedPaymentMethodOptions;
  final dynamic setupIntent;
  final dynamic shippingAddressCollection;
  final dynamic shippingCost;
  final dynamic shippingDetails;
  final List<dynamic>? shippingOptions;
  final String? status;
  final dynamic submitType;
  final dynamic subscription;
  final String? successUrl;
  final TotalDetailsEntity? totalDetails;
  final String? uiMode;
  final String? url;
  final dynamic walletOptions;
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
  const TotalDetailsEntity({
    this.amountDiscount,
    this.amountShipping,
    this.amountTax,
  });

  final num? amountDiscount;
  final num? amountShipping;
  final num? amountTax;

  @override
  List<Object?> get props => [
        amountDiscount,
        amountShipping,
        amountTax,
      ];
}

class PhoneNumberCollectionEntity extends Equatable {
  const PhoneNumberCollectionEntity({
    this.enabled,
  });

  final bool? enabled;
  @override
  List<Object?> get props => [enabled];
}

class PaymentMethodOptionsEntity extends Equatable {
  const PaymentMethodOptionsEntity({
    this.card,
  });

  final CardEntity? card;

  @override
  List<Object?> get props => [card];
}

class CardEntity extends Equatable {
  const CardEntity({
    this.requestThreeDSecure,
  });

  final String? requestThreeDSecure;

  @override
  List<Object?> get props => [requestThreeDSecure];
}

class PaymentMethodConfigurationDetailsEntity extends Equatable {
  const PaymentMethodConfigurationDetailsEntity({
    this.id,
    this.parent,
  });

  final String? id;
  final dynamic parent;

  @override
  List<Object?> get props => [id, parent];
}

class AddressInfoEntity extends Equatable {
  const AddressInfoEntity({
    this.city,
    this.lat,
    this.long,
    this.phone,
    this.street,
  });

  final String? city;
  final String? lat;
  final String? long;
  final String? phone;
  final String? street;

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
  const InvoiceCreationEntity({
    this.enabled,
    this.invoiceData,
  });

  final bool? enabled;
  final InvoiceDataEntity? invoiceData;

  @override
  List<Object?> get props => [enabled,invoiceData];
}

class InvoiceDataEntity extends Equatable{
  const InvoiceDataEntity({
    this.accountTaxIds,
    this.customFields,
    this.description,
    this.footer,
    this.issuer,
    this.metadata,
    this.renderingOptions,
  });

  final dynamic accountTaxIds;
  final dynamic customFields;
  final dynamic description;
  final dynamic footer;
  final dynamic issuer;
  final dynamic metadata;
  final dynamic renderingOptions;

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
 const CustomerDetailsEntity({
    this.address,
    this.email,
    this.name,
    this.phone,
    this.taxExempt,
    this.taxIds,
  });

  final dynamic address;
  final String? email;
  final dynamic name;
  final dynamic phone;
  final String? taxExempt;
  final dynamic taxIds;

  @override
  List<Object?> get props => [address, email, name, phone, taxExempt, taxIds];
}

class CustomTextEntity extends Equatable{
  const CustomTextEntity({
    this.afterSubmit,
    this.shippingAddress,
    this.submit,
    this.termsOfServiceAcceptance,
  });

  final dynamic afterSubmit;
  final dynamic shippingAddress;
  final dynamic submit;
  final dynamic termsOfServiceAcceptance;

  @override
  List<Object?> get props =>
      [afterSubmit, shippingAddress, submit, termsOfServiceAcceptance];
}

class CollectedInformationEntity extends Equatable{
  const CollectedInformationEntity({
    this.shippingDetails,
  });

  final dynamic shippingDetails;

  @override
  List<Object?> get props => [shippingDetails];
}

class AutomaticTaxEntity extends Equatable {
  const AutomaticTaxEntity({
    this.enabled,
    this.liability,
    this.provider,
    this.status,
  });

  final bool? enabled;
  final dynamic liability;
  final dynamic provider;
  final dynamic status;

  @override
  List<Object?> get props => [enabled, liability, provider, status];
}

class AdaptivePricingEntity extends Equatable{
  const AdaptivePricingEntity({
    this.enabled,
  });

  final bool? enabled;

  @override
  List<Object?> get props => [enabled];
}
