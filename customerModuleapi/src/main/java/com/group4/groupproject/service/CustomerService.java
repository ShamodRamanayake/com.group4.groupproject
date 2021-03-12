package com.group4.groupproject.service;
import java.util.List;
import javax.transaction.Transactional; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.group4.groupproject.repository.CustomerDao;
import com.group4.groupproject.entity.CustomerDetail;

@Service
@Transactional
public class CustomerService {

	  @Autowired
	    private static CustomerDao customerDao;
	     
	    public static List<CustomerDetail> listAll() {
	        return customerDao.findAll();
	    }
	     
	    public static void save(CustomerDetail  customerdetail) {
	    	customerDao.save(customerdetail);
	    }
	     
	    public static CustomerDetail get(Integer n_id) {
	        return customerDao.findById(n_id).get();
	    }
	     
	    public void delete(Integer n_id) {
	    	customerDao.deleteById(n_id);
	    }
}
