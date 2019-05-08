package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.GlobalCountryInfo;

@Repository
public interface GlobalCountryInfoRepository extends JpaRepository<GlobalCountryInfo, String> {
	
}