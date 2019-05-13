package com.example.demo.repository;

import com.example.demo.entity.FurnitureHotSaleTradeData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FurnitureHotSaleTradeDataRepository extends JpaRepository<FurnitureHotSaleTradeData, String> {
	
	List<FurnitureHotSaleTradeData> findByTypeNmContainingAndProductNmContaining(String typeNm, String productNm);
	List<FurnitureHotSaleTradeData> findAllByTradeDateAndTypeId(String tradeDate, String productTypeId);
	List<FurnitureHotSaleTradeData> findAllByTradeDate(String tradeDate);
}