class PricingService
  def initialize()
  end


  def updatePrice(updated_price, supplierItemPriceID)
    supplierItemPrice = SupplierItemPricing.find(supplierItemPriceID)
    supplierPricing = supplierItemPrice.pricing
    old_price = supplierPricing.new_purchase_price
    supplierPricing.new_purchase_price = updated_price
    supplierPricing.old_purchase_price = old_price

    if supplierPricing.save 
      return true;
    else
      return false;
    end

  end

  def updateApproval(mainItemPriceID, customerItemPriceID)
    mainItemPrice = MainItemPricing.find(mainItemPriceID)
    mainPricing = mainItemPrice.pricing
    main_old_price = mainPricing.new_purchase_price
    mainPricing.new_purchase_price = @priceSaved
    mainPricing.old_purchase_price = main_old_price
    mainPricing.save
    
    
    customerItemPrice = CustomerItemPricing.find(customerItemPriceID)
    customerPricing = customerItemPrice.pricing
    customer_old_price = customerPricing.new_retail_price
    customerPricing.new_retail_price = @priceSaved
    customerPricing.old_retail_price = customer_old_price
    customerPricing.save
  end
end