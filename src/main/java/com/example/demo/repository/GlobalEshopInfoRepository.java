package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.GlobalEshopInfo;

@Repository
public interface GlobalEshopInfoRepository extends JpaRepository<GlobalEshopInfo, String> {
	
}