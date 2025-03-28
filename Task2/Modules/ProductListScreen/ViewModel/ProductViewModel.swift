

class ProductViewModel {
    private var products: [Product] = []
    
    func fetchProducts() {
      
        products = [
            Product(imageName: "macImage", badge: "Official Warranty", rating: 4.9, reviewsCount: 16,isSponserdLabel: true, productNameLabel: "Aplle MackBook Air", productDetailsabel: "M2 chip with 8-core GPU, 256GB", discountedPrice: "23,999", originalPrice: "26,499", discountPercentage: "9% OFF", rankingLabel: "# 19 in Tablets and Express", deliveryInfo: nil, isExpress: true, isFavorite: true),
                  
            Product(imageName: "HUAWEI MatePad", badge: "Best Celler", rating: 4.4, reviewsCount: 669,isSponserdLabel: true, productNameLabel: "HUAWEI MatePad SE 11-Inch", productDetailsabel: "Tablet Nebula Gray 8GB Middle East Version", discountedPrice: "9,999", originalPrice: "11,499", discountPercentage:"9% OFF", rankingLabel: nil, deliveryInfo: "Free Delivery", isExpress: true, isFavorite: true  ),
            
          
            Product(imageName: "macImage", badge: "Official Warranty", rating: 4.9, reviewsCount: 16,isSponserdLabel: true, productNameLabel: "Aplle MackBook Air", productDetailsabel: "M2 chip with 8-core GPU, 256GB", discountedPrice: "23,999", originalPrice: "26,499", discountPercentage: "9% OFF", rankingLabel: "# 19 in Tablets and Express", deliveryInfo: nil, isExpress: true, isFavorite: true),
                  
            Product(imageName: "HUAWEI MatePad", badge: "Best Celler", rating: 4.4, reviewsCount: 669,isSponserdLabel: true, productNameLabel: "HUAWEI MatePad SE 11-Inch", productDetailsabel: "Tablet Nebula Gray 8GB Middle East Version", discountedPrice: "9,999", originalPrice: "11,499", discountPercentage:"9% OFF", rankingLabel: nil, deliveryInfo: "Free Delivery", isExpress: true, isFavorite: true  ),
            
          
            Product(imageName: "macImage", badge: "Official Warranty", rating: 4.9, reviewsCount: 16,isSponserdLabel: true, productNameLabel: "Aplle MackBook Air", productDetailsabel: "M2 chip with 8-core GPU, 256GB", discountedPrice: "23,999", originalPrice: "26,499", discountPercentage: "9% OFF", rankingLabel: "# 19 in Tablets and Express", deliveryInfo: nil, isExpress: true, isFavorite: true),
                  
            Product(imageName: "HUAWEI MatePad", badge: "Best Celler", rating: 4.4, reviewsCount: 669,isSponserdLabel: true, productNameLabel: "HUAWEI MatePad SE 11-Inch", productDetailsabel: "Tablet Nebula Gray 8GB Middle East Version", discountedPrice: "9,999", originalPrice: "11,499", discountPercentage:"9% OFF", rankingLabel: nil, deliveryInfo: "Free Delivery", isExpress: true, isFavorite: true  ),
            
            
            Product(imageName: "macImage", badge: "Official Warranty", rating: 4.9, reviewsCount: 16,isSponserdLabel: true, productNameLabel: "Aplle MackBook Air", productDetailsabel: "M2 chip with 8-core GPU, 256GB", discountedPrice: "23,999", originalPrice: "26,499", discountPercentage: "9% OFF", rankingLabel: "# 19 in Tablets and Express", deliveryInfo: nil, isExpress: true, isFavorite: true),
                  
            Product(imageName: "HUAWEI MatePad", badge: "Best Celler", rating: 4.4, reviewsCount: 669,isSponserdLabel: true, productNameLabel: "HUAWEI MatePad SE 11-Inch", productDetailsabel: "Tablet Nebula Gray 8GB Middle East Version", discountedPrice: "9,999", originalPrice: "11,499", discountPercentage:"9% OFF", rankingLabel: nil, deliveryInfo: "Free Delivery", isExpress: true, isFavorite: true  ),
            
            Product(imageName: "macImage", badge: "Official Warranty", rating: 4.9, reviewsCount: 16,isSponserdLabel: true, productNameLabel: "Aplle MackBook Air", productDetailsabel: "M2 chip with 8-core GPU, 256GB", discountedPrice: "23,999", originalPrice: "26,499", discountPercentage: "9% OFF", rankingLabel: "# 19 in Tablets and Express", deliveryInfo: nil, isExpress: true, isFavorite: true),
                  
            Product(imageName: "HUAWEI MatePad", badge: "Best Celler", rating: 4.4, reviewsCount: 669,isSponserdLabel: true, productNameLabel: "HUAWEI MatePad SE 11-Inch", productDetailsabel: "Tablet Nebula Gray 8GB Middle East Version", discountedPrice: "9,999", originalPrice: "11,499", discountPercentage:"9% OFF", rankingLabel: nil, deliveryInfo: "Free Delivery", isExpress: true, isFavorite: true  ),
            
            
            Product(imageName: "macImage", badge: "Official Warranty", rating: 4.9, reviewsCount: 16,isSponserdLabel: true, productNameLabel: "Aplle MackBook Air", productDetailsabel: "M2 chip with 8-core GPU, 256GB", discountedPrice: "23,999", originalPrice: "26,499", discountPercentage: "9% OFF", rankingLabel: "# 19 in Tablets and Express", deliveryInfo: nil, isExpress: true, isFavorite: true),
                  
            Product(imageName: "HUAWEI MatePad", badge: "Best Celler", rating: 4.4, reviewsCount: 669,isSponserdLabel: true, productNameLabel: "HUAWEI MatePad SE 11-Inch", productDetailsabel: "Tablet Nebula Gray 8GB Middle East Version", discountedPrice: "9,999", originalPrice: "11,499", discountPercentage:"9% OFF", rankingLabel: nil, deliveryInfo: "Free Delivery", isExpress: true, isFavorite: true  ),
            
          
            Product(imageName: "macImage", badge: "Official Warranty", rating: 4.9, reviewsCount: 16,isSponserdLabel: true, productNameLabel: "Aplle MackBook Air", productDetailsabel: "M2 chip with 8-core GPU, 256GB", discountedPrice: "23,999", originalPrice: "26,499", discountPercentage: "9% OFF", rankingLabel: "# 19 in Tablets and Express", deliveryInfo: nil, isExpress: true, isFavorite: true),
                  
            Product(imageName: "HUAWEI MatePad", badge: "Best Celler", rating: 4.4, reviewsCount: 669,isSponserdLabel: true, productNameLabel: "HUAWEI MatePad SE 11-Inch", productDetailsabel: "Tablet Nebula Gray 8GB Middle East Version", discountedPrice: "9,999", originalPrice: "11,499", discountPercentage:"9% OFF", rankingLabel: nil, deliveryInfo: "Free Delivery", isExpress: true, isFavorite: true  ),
            
          

            Product(imageName: "macImage", badge: "Official Warranty", rating: 4.9, reviewsCount: 16,isSponserdLabel: true, productNameLabel: "Aplle MackBook Air", productDetailsabel: "M2 chip with 8-core GPU, 256GB", discountedPrice: "23,999", originalPrice: "26,499", discountPercentage: "9% OFF", rankingLabel: "# 19 in Tablets and Express", deliveryInfo: nil, isExpress: true, isFavorite: true),
                  
            Product(imageName: "HUAWEI MatePad", badge: "Best Celler", rating: 4.4, reviewsCount: 669,isSponserdLabel: true, productNameLabel: "HUAWEI MatePad SE 11-Inch", productDetailsabel: "Tablet Nebula Gray 8GB Middle East Version", discountedPrice: "9,999", originalPrice: "11,499", discountPercentage:"9% OFF", rankingLabel: nil, deliveryInfo: "Free Delivery", isExpress: true, isFavorite: true  ),
            
          

            Product(imageName: "macImage", badge: "Official Warranty", rating: 4.9, reviewsCount: 16,isSponserdLabel: true, productNameLabel: "Aplle MackBook Air", productDetailsabel: "M2 chip with 8-core GPU, 256GB", discountedPrice: "23,999", originalPrice: "26,499", discountPercentage: "9% OFF", rankingLabel: "# 19 in Tablets and Express", deliveryInfo: nil, isExpress: true, isFavorite: true),
                  
            Product(imageName: "HUAWEI MatePad", badge: "Best Celler", rating: 4.4, reviewsCount: 669,isSponserdLabel: true, productNameLabel: "HUAWEI MatePad SE 11-Inch", productDetailsabel: "Tablet Nebula Gray 8GB Middle East Version", discountedPrice: "9,999", originalPrice: "11,499", discountPercentage:"9% OFF", rankingLabel: nil, deliveryInfo: "Free Delivery", isExpress: true, isFavorite: true  ),
            
          

            
        ]
    }
    
    func numberOfItems() -> Int {
        return products.count
    }
    
    func product(at index: Int) -> Product {
        return products[index]
    }
}
