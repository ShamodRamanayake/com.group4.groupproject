package com.group4.groupproject.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.group4.groupproject.entity.SupplierDetail;

public interface SupplierDao extends JpaRepository<SupplierDetail,Integer>{

}