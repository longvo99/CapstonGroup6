package edu.group6.capston.utils;

import java.util.ArrayList;
import java.util.List;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import edu.group6.capston.dtos.OrderDetailDTO;

public class PaymentServices {
	private static final String CLIENT_ID = "AQN3vRpv0AE934mshcbQoIzOykgigch9wDv2ctD5xD1jdq-iES5pQBdsWbPaSQuzPf0hdWN8aQeXEIFB";
	private static final String CLIENT_SECRET = "EPXEf8_t4SVVDX-oDJscgHwp9FcwWCyeFRBRuS5xupF8Ql-3uhCQivvTxDFnhmz9ENO64GEhLrUj0TQE";
	private static final String MODE = "sandbox";

	public String authorizePayment(OrderDetailDTO orderDetail) throws PayPalRESTException {

		Payer payer = getPayerInformation();
		RedirectUrls redirectUrls = getRedirectURLs();
		List<Transaction> listTransaction = getTransactionInformation(orderDetail);

		Payment requestPayment = new Payment();
		requestPayment.setTransactions(listTransaction);
		requestPayment.setRedirectUrls(redirectUrls);
		requestPayment.setPayer(payer);
		requestPayment.setIntent("authorize");

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		Payment approvedPayment = requestPayment.create(apiContext);

		return getApprovalLink(approvedPayment);

	}

	private Payer getPayerInformation() {
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");
		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName("Vo").setLastName("Long").setEmail("longnguyen040201@gmail.com");
		payer.setPayerInfo(payerInfo);
		return payer;
	}

	private RedirectUrls getRedirectURLs() {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8080/PaypalTest/cancel.html");
		redirectUrls.setReturnUrl("http://localhost:8080/Capston.Group6/public/orderdetails");
		return redirectUrls;
	}

	private List<Transaction> getTransactionInformation(OrderDetailDTO orderDetail) {
		Details details = new Details();
	    details.setShipping(orderDetail.getShipping());
	    details.setSubtotal(orderDetail.getSubtotal());
	    details.setTax(orderDetail.getTax());
	 
	    Amount amount = new Amount();
	    amount.setCurrency("USD");
	    amount.setTotal(orderDetail.getTotal());
	    amount.setDetails(details);
	 
	    Transaction transaction = new Transaction();
	    transaction.setAmount(amount);
	    transaction.setDescription(orderDetail.getProductName());
	     
	    ItemList itemList = new ItemList();
	    List<Item> items = new ArrayList<>();
	     
	    Item item = new Item();
	    item.setCurrency("USD");
	    item.setName("Đơn hàng");
	    item.setPrice(orderDetail.getSubtotal());
	    item.setTax(orderDetail.getTax());
	    item.setQuantity("1");
	     
	    items.add(item);
	    itemList.setItems(items);
	    transaction.setItemList(itemList);
	 
	    List<Transaction> listTransaction = new ArrayList<>();
	    listTransaction.add(transaction);  
	     
	    return listTransaction;
	}

	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
		String approvalLink = null;

		for (Links link : links) {
			if (link.getRel().equalsIgnoreCase("approval_url")) {
				approvalLink = link.getHref();
				break;
			}
		}
		return approvalLink;
	}
	
	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
	    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
	    return Payment.get(apiContext, paymentId);
	}
}