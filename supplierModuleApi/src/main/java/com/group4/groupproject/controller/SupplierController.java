package com.group4.groupproject.controller;
import java.util.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import com.group4.groupproject.entity.SupplierDetail;
import com.group4.groupproject.service.SupplierService;

@RestController
public class SupplierController {


	@GetMapping("SupplierDetail")
	public List<SupplierDetail> list() {
	    return SupplierService.listAll();
	}
	@GetMapping("/SupplierDetail/{n_id}")
	public ResponseEntity<SupplierDetail> get(@PathVariable Integer n_id) {
	    try {
	        SupplierDetail supplierDetail = SupplierService.get(n_id);
	        return new ResponseEntity<SupplierDetail>(supplierDetail, HttpStatus.OK);
	    } catch (NoSuchElementException e) {
	        return new ResponseEntity<SupplierDetail>(HttpStatus.NOT_FOUND);
	    }      
	}
	@PostMapping("/SupplierDetail")
	public void add(@RequestBody SupplierDetail supplierDetail) {
	    SupplierService.save(supplierDetail);
	}
	@PutMapping("/SupplierDetail/{id}")
	public ResponseEntity<?> update(@RequestBody SupplierDetail supplierDetail, @PathVariable Integer n_id) {
	    try {
	    	SupplierDetail existProduct = SupplierService.get(n_id);
	        SupplierService.save(supplierDetail);
	        return new ResponseEntity<>(HttpStatus.OK);
	    } catch (NoSuchElementException e) {
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }      
	}
	
}
