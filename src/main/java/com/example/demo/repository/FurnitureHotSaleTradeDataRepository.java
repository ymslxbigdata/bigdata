package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.FurnitureHotSaleTradeData;

@Repository
public interface FurnitureHotSaleTradeDataRepository extends JpaRepository<FurnitureHotSaleTradeData, String> {
	
	public List<FurnitureHotSaleTradeData> findByTypeNmContainingAndProductNmContaining(String typeNm, String productNm);
}