class ProcessProductJob < ApplicationJob
  queue_as :default

  def perform(product_id)
    product = Product.find(product_id)
    # Simulate processing, e.g., updating inventory
    product.update(processed: true)
  end
end
