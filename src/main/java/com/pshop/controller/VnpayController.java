package com.pshop.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

//import com.google.gson.Gson;
//import com.google.gson.JsonObject;
import com.pshop.VnpayConfig;

@RestController
@RequestMapping("/api/vnpay")
public class VnpayController {
	@GetMapping("/pay")
	public String pay (@RequestParam("amount") String amountValue,
			@RequestParam("userId") String userId,
		    @RequestParam("orderDate") String orderDate,
		    @RequestParam("telephone") String telephone,
		    @RequestParam("address") String address,
		    @RequestParam("status") String status,
		    @RequestParam("description") String description) throws UnsupportedEncodingException{
			long amountt = Long.parseLong(amountValue);
			String vnp_Version = "2.1.0";
	        String vnp_Command = "pay";
	        String orderType = "other";
	        long amount = amountt/10;
	        String bankCode = "NCB";
	        
	        String vnp_TxnRef = VnpayConfig.getRandomNumber(8);
	        String vnp_IpAddr = "127.0.0.1";

	        String vnp_TmnCode = VnpayConfig.vnp_TmnCode;
	        String vnp_ReturnUrl = "http://localhost:8080/order/vnpay?userId="+userId +
	                "&orderDate=" + orderDate +
	                "&telephone=" + telephone +
	                "&address=" + address +
	                "&status="+ status +
	                "&amount=" + amountValue +
	                "&description=" + description;
	      
	        Map<String, String> vnp_Params = new HashMap<>();
	        vnp_Params.put("vnp_Version", vnp_Version);
	        vnp_Params.put("vnp_Command", vnp_Command);
	        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
	        vnp_Params.put("vnp_Amount", String.valueOf(amount));
	        vnp_Params.put("vnp_CurrCode", "VND");
	        
	        vnp_Params.put("vnp_BankCode", bankCode);
	        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
	        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
	        vnp_Params.put("vnp_OrderType", orderType);

	        vnp_Params.put("vnp_Locale", "vn");
	        vnp_Params.put("vnp_ReturnUrl", vnp_ReturnUrl);
	        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

	        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	        String vnp_CreateDate = formatter.format(cld.getTime());
	        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
	        
	        cld.add(Calendar.MINUTE, 15);
	        String vnp_ExpireDate = formatter.format(cld.getTime());
	        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
	        
	        List fieldNames = new ArrayList(vnp_Params.keySet());
	        Collections.sort(fieldNames);
	        StringBuilder hashData = new StringBuilder();
	        StringBuilder query = new StringBuilder();
	        Iterator itr = fieldNames.iterator();
	        while (itr.hasNext()) {
	            String fieldName = (String) itr.next();
	            String fieldValue = (String) vnp_Params.get(fieldName);
	            if ((fieldValue != null) && (fieldValue.length() > 0)) {
	                //Build hash data
	                hashData.append(fieldName);
	                hashData.append('=');
	                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
	                //Build query
	                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
	                query.append('=');
	                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
	                if (itr.hasNext()) {
	                    query.append('&');
	                    hashData.append('&');
	                }
	            }
	        }
	        String queryUrl = query.toString();
	        String vnp_SecureHash = VnpayConfig.hmacSHA512(VnpayConfig.secretKey, hashData.toString());
	        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
	        String paymentUrl = VnpayConfig.vnp_PayUrl + "?" + queryUrl;
			
			return paymentUrl;

        
	}
}

