package com.group4.groupproject.entity;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
 

@Entity
public class SupplierDetail {

	private int n_id;
	private String v_supplier_name;
	private char n_contact;
	private String v_email;
	private char v_status;
	
	   public SupplierDetail() {}

	    public SupplierDetail(Integer n_id, String v_supplier_name ,char n_contact,String v_email,char v_status){
	        this.n_id = n_id;
	        this.v_supplier_name = v_supplier_name;
	        this.n_contact = n_contact;
	        this.v_email = v_email;
	        this.v_status = v_status;
	    }
	   
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
		public int getN_id() {
			return n_id;
		}

		public String getV_supplier_name() {
			return v_supplier_name;
		}

		public void setV_supplier_name(String v_supplier_name) {
			this.v_supplier_name = v_supplier_name;
		}

		public char getN_contact() {
			return n_contact;
		}

		public void setN_contact(char n_contact) {
			this.n_contact = n_contact;
		}

		public String getV_email() {
			return v_email;
		}

		public void setV_email(String v_email) {
			this.v_email = v_email;
		}

		public char getV_status() {
			return v_status;
		}

		public void setV_status(char v_status) {
			this.v_status = v_status;
		}

		public void setN_id(int n_id) {
			this.n_id = n_id;
		}

}
