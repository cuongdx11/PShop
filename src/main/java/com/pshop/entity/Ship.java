package com.pshop.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Ships")
public class Ship {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	Integer shippingStatus;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	Date shipingDate;
	Integer deliveryMethod;
	@ManyToOne
	@JoinColumn(name="orderId")
	Order order;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getShippingStatus() {
		return shippingStatus;
	}
	public void setShippingStatus(Integer shippingStatus) {
		this.shippingStatus = shippingStatus;
	}
	public Date getShipingDate() {
		return shipingDate;
	}
	public void setShipingDate(Date shipingDate) {
		this.shipingDate = shipingDate;
	}
	public Integer getDeliveryMethod() {
		return deliveryMethod;
	}
	public void setDeliveryMethod(Integer deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	
}
