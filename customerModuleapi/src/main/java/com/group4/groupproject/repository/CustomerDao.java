package com.group4.groupproject.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.group4.groupproject.entity.CustomerDetail;

public interface CustomerDao extends JpaRepository<CustomerDetail,Integer>{

}
