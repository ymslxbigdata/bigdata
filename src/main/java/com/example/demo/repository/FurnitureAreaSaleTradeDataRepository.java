package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.FurnitureAreaSaleTradeData;

@Repository
public interface FurnitureAreaSaleTradeDataRepository extends JpaRepository<FurnitureAreaSaleTradeData, String> {
	
	List<FurnitureAreaSaleTradeData> findByTradeDate(String tradeDate);
}