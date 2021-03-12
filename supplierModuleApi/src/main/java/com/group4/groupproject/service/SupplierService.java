package com.group4.groupproject.service;
import java.util.List;
import javax.transaction.Transactional; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.group4.groupproject.repository.SupplierDao;
import com.group4.groupproject.entity.SupplierDetail;

@Service
@Transactional
public class SupplierService {

	  @Autowired
	    private static SupplierDao supplierDao;
	     
	    public static List<SupplierDetail> listAll() {
	        return supplierDao.findAll();
	    }
	     
	    public static void save(SupplierDetail supplierdetail) {
	    	supplierDao.save(supplierdetail);
	    }
	     
	    public static SupplierDetail get(Integer n_id) {
	        return supplierDao.findById(n_id).get();
	    }
	     
	    public void delete(Integer n_id) {
	    	supplierDao.deleteById(n_id);
	    }
}
