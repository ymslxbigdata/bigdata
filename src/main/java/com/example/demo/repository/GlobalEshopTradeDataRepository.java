package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.GlobalEshopTradeData;

@Repository
public interface GlobalEshopTradeDataRepository extends JpaRepository<GlobalEshopTradeData, String> {
	
	List<GlobalEshopTradeData> findByEshopId(String eshopId);
	List<GlobalEshopTradeData> findByTradeMonth(String tradeMonth);
	List<GlobalEshopTradeData> findByEshopIdAndTradeMonth(String eshopId,String tradeMonth);
}