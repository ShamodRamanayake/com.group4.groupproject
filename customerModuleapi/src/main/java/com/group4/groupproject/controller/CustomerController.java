package com.group4.groupproject.controller;
import java.util.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import com.group4.groupproject.entity.CustomerDetail;
import com.group4.groupproject.service.CustomerService;

@RestController
public class CustomerController {


	@GetMapping("CustomerDetail")
	public List<CustomerDetail> list() {
	    return CustomerService.listAll();
	}
	@GetMapping("/CustomerDetail/{n_id}")
	public ResponseEntity<CustomerDetail> get(@PathVariable Integer n_id) {
	    try {
	        CustomerDetail customerdetail = CustomerService.get(n_id);
	        return new ResponseEntity<CustomerDetail>(customerdetail, HttpStatus.OK);
	    } catch (NoSuchElementException e) {
	        return new ResponseEntity<CustomerDetail>(HttpStatus.NOT_FOUND);
	    }      
	}
	@PostMapping("/CustomerDetail")
	public void add(@RequestBody CustomerDetail customerdetail) {
	    CustomerService.save(customerdetail);
	}
	@PutMapping("/CustomerDetail/{n_id}")
	public ResponseEntity<?> update(@RequestBody CustomerDetail customerdetail, @PathVariable Integer n_id) {
	    try {
	    	CustomerDetail existProduct = CustomerService.get(n_id);
	        CustomerService.save(customerdetail);
	        return new ResponseEntity<>(HttpStatus.OK);
	    } catch (NoSuchElementException e) {
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }      
	}
	
}
