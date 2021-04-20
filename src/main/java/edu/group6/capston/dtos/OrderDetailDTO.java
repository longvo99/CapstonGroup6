package edu.group6.capston.dtos;

public class OrderDetailDTO {
    private String productName;
    private float subtotal;
    private float shipping;
    private float tax;
    private float total;
 
    public OrderDetailDTO(String productName, String subtotal,
            String shipping, String tax, String total) {
        this.productName = productName;
        this.subtotal = Float.parseFloat(subtotal);
        this.shipping = Float.parseFloat(shipping);
        this.tax = Float.parseFloat(tax);
        this.total = Float.parseFloat(total);
    }
 
    public OrderDetailDTO(float subtotal, float shipping, float tax, float total) {
		super();
		this.subtotal = subtotal;
		this.shipping = shipping;
		this.tax = tax;
		this.total = total;
	}

	public String getProductName() {
        return productName;
    }
 
    public String getSubtotal() {
        return String.format("%.2f", subtotal);
    }
 
    public String getShipping() {
        return String.format("%.2f", shipping);
    }
 
    public String getTax() {
        return String.format("%.2f", tax);
    }
     
    public String getTotal() {
        return String.format("%.2f", total);
    }

	@Override
	public String toString() {
		return "OrderDetailDTO [productName=" + productName + ", subtotal=" + subtotal + ", shipping=" + shipping
				+ ", tax=" + tax + ", total=" + total + "]";
	}
    
}