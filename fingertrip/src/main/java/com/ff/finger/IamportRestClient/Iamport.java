package com.ff.finger.IamportRestClient;

import com.ff.finger.IamportRestClient.request.AuthData;
import com.ff.finger.IamportRestClient.request.CancelData;
import com.ff.finger.IamportRestClient.response.AccessToken;
import com.ff.finger.IamportRestClient.response.IamportResponse;
import com.ff.finger.IamportRestClient.response.PagedDataList;
import com.ff.finger.IamportRestClient.response.Payment;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.Header;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface Iamport {

	@POST("/users/getToken")
	Call<IamportResponse<AccessToken>> token(
		@Body AuthData auth);
	
	@GET("/payments/{imp_uid}")
    Call<IamportResponse<Payment>> payment_by_imp_uid(
    	@Header("Authorization") String token,
        @Path("imp_uid") String imp_uid
    );
	
	@GET("/payments/status/{payment_status}")
    Call<IamportResponse<PagedDataList<Payment>>> payments_by_status(
    	@Header("Authorization") String token,
        @Path("payment_status") String payment_status
    );
	
	@POST("/payments/cancel")
	Call<IamportResponse<Payment>> cancel_payment(
		@Header("Authorization") String token,
		@Body CancelData cancel_data
	);
	
}
