package com.prjct.emarket.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.prjct.emarket.dto.ShoppingCart;

public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Integer>
{

}
