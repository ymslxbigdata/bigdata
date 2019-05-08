package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.GlobalEshopTradeData;

@Repository
public interface GlobalEshopTradeDataRepository extends JpaRepository<GlobalEshopTradeData, String> {
	
}