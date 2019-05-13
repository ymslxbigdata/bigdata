package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.FurnitureHotSaleProductData;

@Repository
public interface FurnitureHotSaleProductDataRepository extends JpaRepository<FurnitureHotSaleProductData, String> {
	
	public List<FurnitureHotSaleProductData> findByBrandIdContainingAndBrandNmContaining(String brandId, String brandNm);
}