import 'package:flower_ecommerce_app_team5/modules/payment/data/models/checkout_session_response/checkout_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    "Testing convertIntoEntity() functions related to CheckoutResponseDto",
    () {
      AdaptivePricingDto adaptivePricingDto =
          const AdaptivePricingDto(enabled: true);
      AutomaticTaxDto automaticTaxDto = const AutomaticTaxDto(enabled: true);
      CustomerDetailsDto customerDetailsDto = const CustomerDetailsDto(
          name: "name1",
          taxIds: "13443245",
          phone: "+20",
          email: "custom321@gmail.com");
      AddressInfoDto addressInfoDto = const AddressInfoDto(
          phone: "+20",
          street: "street",
          long: "long",
          lat: "lat",
          city: "city");
      TotalDetailsDto totalDetailsDto = const TotalDetailsDto(
          amountTax: 20, amountShipping: 10, amountDiscount: 30);
      SessionDto dummySession = const SessionDto(
        id: 'session_123456789',
        object: 'checkout.session',
        adaptivePricing: AdaptivePricingDto(enabled: true), // Mock
        amountSubtotal: 2999, // $29.99 in cents
        amountTotal: 3299, // $32.99 (includes tax/shipping)
        automaticTax:
            AutomaticTaxDto(enabled: true, status: 'complete'), // Mock
        billingAddressCollection: 'required',
        cancelUrl: 'https://your-app.com/cancel',
        clientReferenceId: 'client_123',
        clientSecret: 'sk_test_123456', // Mock Stripe secret
        collectedInformation: CollectedInformationDto(shippingDetails: null),
        consent: null, // Mock
        created: 1678901234, // Unix timestamp
        currency: 'usd',
        customer: 'cus_123456789', // Stripe customer ID
        customerCreation: 'always',
        customerDetails: CustomerDetailsDto(
          email: 'user@example.com',
          name: 'John Doe',
          phone: '+1234567890',
        ),
        customerEmail: 'user@example.com',
        discounts: [
          {'coupon': 'SUMMER2023', 'amount_off': 500}, // $5 off
        ],
        expiresAt: 1678987634, // Unix timestamp (24h later)
        invoice: 'in_123456789', // Stripe invoice ID
        invoiceCreation: InvoiceCreationDto(enabled: true),
        liveMode: false, // Test mode
        locale: 'en-US',
        metadata: AddressInfoDto(
          phone: "+20",
          street: "street",
          city: "city",
          lat: "lat",
          long: "long",
        ),
        mode: 'payment',
        paymentIntent: 'pi_123456789', // Stripe PaymentIntent ID
        paymentMethodCollection: 'always',
        paymentMethodTypes: ['card', 'paypal'],
        paymentStatus: 'paid',
        phoneNumberCollection: PhoneNumberCollectionDto(enabled: true),
        shippingCost: null,
        shippingDetails: null,
        shippingOptions: [
          {'id': 'express', 'label': 'Express Shipping'},
        ],
        status: 'complete',
        successUrl:
            'https://your-app.com/success?session_id={CHECKOUT_SESSION_ID}',
        totalDetails: TotalDetailsDto(
          amountDiscount: 500,
          amountTax: 200,
          amountShipping: 300,
        ),
        uiMode: 'embedded',
        url: 'https://checkout.stripe.com/pay/session_123456789',
      );
      test(
        "When calling convertIntoEntity() function of AdaptivePricingDto, it should return the right entity",
        () {
          // act
          var result = adaptivePricingDto.convertIntoEntity();
          // assert
          expect(result.enabled, adaptivePricingDto.enabled);
        },
      );
      test(
        "When calling convertIntoEntity() function of AutomaticTaxDto, it should return the right entity",
        () {
          // act
          var result = automaticTaxDto.convertIntoEntity();
          // assert
          expect(result.enabled, automaticTaxDto.enabled);
          expect(result.liability, automaticTaxDto.liability);
          expect(result.provider, automaticTaxDto.provider);
          expect(result.status, automaticTaxDto.status);
        },
      );
      test(
        "When calling convertIntoEntity() function of CustomerDetailsDto, it should return the right entity",
        () {
          // act
          var result = customerDetailsDto.convertIntoEntity();
          // assert
          expect(result.address, customerDetailsDto.address);
          expect(result.email, customerDetailsDto.email);
          expect(result.name, customerDetailsDto.name);
          expect(result.phone, customerDetailsDto.phone);
          expect(result.taxExempt, customerDetailsDto.taxExempt);
          expect(result.taxIds, customerDetailsDto.taxIds);
        },
      );
      test(
        "When calling convertIntoEntity() function of AddressInfoDto, it should return the right entity",
        () {
          // act
          var result = addressInfoDto.convertIntoEntity();
          // assert
          expect(result.city, addressInfoDto.city);
          expect(result.lat, addressInfoDto.lat);
          expect(result.long, addressInfoDto.long);
          expect(result.phone, addressInfoDto.phone);
          expect(result.street, addressInfoDto.street);
        },
      );
      test(
        "When calling convertIntoEntity() function of TotalDetailsDto, it should return the right entity",
        () {
          // act
          var result = totalDetailsDto.convertIntoEntity();
          // assert
          expect(result.amountDiscount, totalDetailsDto.amountDiscount);
          expect(result.amountShipping, totalDetailsDto.amountShipping);
          expect(result.amountTax, totalDetailsDto.amountTax);
        },
      );
      test(
        "When calling convertIntoEntity() function of SessionDto, it should return the right entity",
        () {
          // act
          var result = dummySession.convertIntoEntity();
          // assert
          expect(result.id, dummySession.id);
          expect(result.object, dummySession.object);
          expect(result.adaptivePricing, dummySession.adaptivePricing?.convertIntoEntity());
          expect(result.afterExpiration, dummySession.afterExpiration);
          expect(result.allowPromotionCodes, dummySession.allowPromotionCodes);
          expect(result.amountSubtotal, dummySession.amountSubtotal);
          expect(result.amountTotal, dummySession.amountTotal);
          expect(result.automaticTax, dummySession.automaticTax?.convertIntoEntity());
          expect(result.billingAddressCollection,
              dummySession.billingAddressCollection);
          expect(result.cancelUrl, dummySession.cancelUrl);
          expect(result.clientReferenceId, dummySession.clientReferenceId);
          expect(result.clientSecret, dummySession.clientSecret);
          expect(
              result.collectedInformation, dummySession.collectedInformation?.convertIntoEntity());
          expect(result.consent, dummySession.consent);
          expect(result.created, dummySession.created);
          expect(result.currency, dummySession.currency);
          expect(result.currencyConversion, dummySession.currencyConversion);
          expect(result.customText, dummySession.customText);
          expect(result.customer, dummySession.customer);
          expect(result.customerCreation, dummySession.customerCreation);
          expect(result.customerDetails, dummySession.customerDetails?.convertIntoEntity());
          expect(result.customerEmail, dummySession.customerEmail);
          expect(result.discounts, dummySession.discounts);
          expect(result.expiresAt, dummySession.expiresAt);
          expect(result.invoice, dummySession.invoice);
          expect(result.invoiceCreation, dummySession.invoiceCreation?.convertIntoEntity());
          expect(result.liveMode, dummySession.liveMode);
          expect(result.locale, dummySession.locale);
          expect(result.metadata, dummySession.metadata?.convertIntoEntity());
          expect(result.mode, dummySession.mode);
          expect(result.paymentIntent, dummySession.paymentIntent);
          expect(result.paymentLink, dummySession.paymentLink);
          expect(result.paymentMethodCollection,
              dummySession.paymentMethodCollection);
          expect(result.paymentMethodConfigurationDetails,
              dummySession.paymentMethodConfigurationDetails);
          expect(
              result.paymentMethodOptions, dummySession.paymentMethodOptions);
          expect(result.paymentMethodTypes, dummySession.paymentMethodTypes);
          expect(result.paymentStatus, dummySession.paymentStatus);
          expect(result.permissions, dummySession.permissions);
          expect(
              result.phoneNumberCollection, dummySession.phoneNumberCollection?.convertIntoEntity());
          expect(result.recoveredFrom, dummySession.recoveredFrom);
          expect(result.savedPaymentMethodOptions,
              dummySession.savedPaymentMethodOptions);
          expect(result.setupIntent, dummySession.setupIntent);
          expect(result.shippingAddressCollection,
              dummySession.shippingAddressCollection);
          expect(result.shippingCost, dummySession.shippingCost);
          expect(result.shippingDetails, dummySession.shippingDetails);
          expect(result.shippingOptions, dummySession.shippingOptions);
          expect(result.status, dummySession.status);
          expect(result.submitType, dummySession.submitType);
          expect(result.subscription, dummySession.subscription);
          expect(result.successUrl, dummySession.successUrl);
          expect(result.totalDetails, dummySession.totalDetails?.convertIntoEntity());
          expect(result.uiMode, dummySession.uiMode);
          expect(result.url, dummySession.url);
          expect(result.walletOptions, dummySession.walletOptions);
        },
      );
    },
  );
}
