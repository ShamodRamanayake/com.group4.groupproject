package com.group4.groupproject.entity;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
 

@Entity
public class CustomerDetail {

	private int n_id;
	private String v_customer_name;
	private char n_contact;
	private char v_status;
	
	   public CustomerDetail() {}

	    public CustomerDetail(Integer n_id, String v_customer_name ,char n_contact,char v_status){
	        this.n_id = n_id;
	        this.v_customer_name = v_customer_name;
	        this.n_contact = n_contact;
	        this.v_status = v_status;
	    }
	   
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
		public int getN_id() {
			return n_id;
		}

		public void setN_id(int n_id) {
			this.n_id = n_id;
		}

		public String getV_customer_name() {
			return v_customer_name;
		}

		public void setV_customer_name(String v_customer_name) {
			this.v_customer_name = v_customer_name;
		}

		public char getN_contact() {
			return n_contact;
		}

		public void setN_contact(char n_contact) {
			this.n_contact = n_contact;
		}

		public char getV_status() {
			return v_status;
		}

		public void setV_status(char v_status) {
			this.v_status = v_status;
		}
}
