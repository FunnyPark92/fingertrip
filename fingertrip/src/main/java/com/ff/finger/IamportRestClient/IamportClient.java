package com.ff.finger.IamportRestClient;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import com.ff.finger.IamportRestClient.request.AuthData;
import com.ff.finger.IamportRestClient.request.CancelData;
import com.ff.finger.IamportRestClient.response.AccessToken;
import com.ff.finger.IamportRestClient.response.IamportResponse;
import com.ff.finger.IamportRestClient.response.PagedDataList;
import com.ff.finger.IamportRestClient.response.Payment;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import okhttp3.OkHttpClient;
import retrofit2.Call;
import retrofit2.HttpException;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class IamportClient {
	public static final String API_URL = "https://api.iamport.kr";
	protected String api_key = null;
	protected String api_secret = null;
	protected Iamport iamport = null;
	
	public IamportClient(String api_key, String api_secret) {
		this.api_key = api_key;
		this.api_secret = api_secret;
		this.iamport = this.create();
	}
	
	public IamportResponse<AccessToken> getAuth() {
		Call<IamportResponse<AccessToken>> call = this.iamport.token( new AuthData(this.api_key, this.api_secret) );
		try {
			Response<IamportResponse<AccessToken>> response = call.execute();
			
			if ( !response.isSuccessful() )	throw new HttpException(response); //200이 아닌 경우에는 throw RuntimeException 

			return response.body();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public IamportResponse<Payment> paymentByImpUid(String imp_uid) {
		AccessToken auth = getAuth().getResponse();
		if ( auth != null ) {
			Call<IamportResponse<Payment>> call = this.iamport.payment_by_imp_uid(auth.getToken(), imp_uid);
			
			try {
				Response<IamportResponse<Payment>> response = call.execute();
				if ( response.isSuccessful() ) {
					return response.body();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	public IamportResponse<PagedDataList<Payment>> paymentsByStatus(String status) {
		AccessToken auth = getAuth().getResponse();
		if ( auth != null ) {
			Call<IamportResponse<PagedDataList<Payment>>> call = this.iamport.payments_by_status(auth.getToken(), status);
			
			try {
				Response<IamportResponse<PagedDataList<Payment>>> response = call.execute();
				if ( response.isSuccessful() ) {
					return response.body();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	public IamportResponse<Payment> cancelPaymentByImpUid(CancelData cancel_data) {
		AccessToken auth = getAuth().getResponse();
		if ( auth != null ) {
			Call<IamportResponse<Payment>> call = this.iamport.cancel_payment(auth.getToken(), cancel_data);
			
			try {
				Response<IamportResponse<Payment>> response = call.execute();
				if ( response.isSuccessful() ) {
					return response.body();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	protected Iamport create() {
		OkHttpClient client = new OkHttpClient.Builder()
				.readTimeout(30, TimeUnit.SECONDS)
				.connectTimeout(10, TimeUnit.SECONDS)
				.build();
		
		Retrofit retrofit = new Retrofit.Builder()
								.baseUrl(API_URL)
								.addConverterFactory(buildGsonConverter())
								.client(client)
								.build();
		
		return retrofit.create(Iamport.class);
	}
	
	protected GsonConverterFactory buildGsonConverter() {
        GsonBuilder gsonBuilder = new GsonBuilder();

        // Adding custom deserializers
        //Object escrowInvoiceStrategy = new EscrowInvoiceEntrySerializer();
        
        //gsonBuilder.registerTypeAdapter(ScheduleEntry.class, new ScheduleEntrySerializer());
        //gsonBuilder.registerTypeAdapter(Schedule.class, new ScheduleEntrySerializer());
        //gsonBuilder.registerTypeAdapter(PaymentBalanceEntry.class, new BalanceEntrySerializer());
        //gsonBuilder.registerTypeAdapter(EscrowLogisInvoiceData.class, escrowInvoiceStrategy);
        //gsonBuilder.registerTypeAdapter(EscrowLogisInvoice.class, escrowInvoiceStrategy);
        
        Gson myGson = gsonBuilder.create();

        return GsonConverterFactory.create(myGson);
    }
	
}