//
//  DraftOrderExtentions.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 23/06/2025.
//
import AdminNameSpace
import StoreFrontNameSpace
import Foundation

extension AdminNameSpace.DraftOrderCreateMutation.Data.DraftOrderCreate.DraftOrder: Mappable {
    typealias DomainModel = DraftOrder

    func toDomain() -> DraftOrder {
        return DraftOrder(
                  id: id,
                  name: name,
                  email: email,
                  subtotalPrice: subtotalPrice,
                  note2: note2,
                  totalPrice: totalPrice,
                  lineItems: LineItemConnection(nodes: lineItems.nodes.map { $0.toDomain() })
              )
    }
}


extension AdminNameSpace.DraftOrderCreateMutation.Data.DraftOrderCreate.DraftOrder.LineItems.Node: Mappable {
    func toDomain() -> LineItem {
        return LineItem(
                  quantity: quantity,
                  variant: variant?.toDomain(),
                  product: product?.toDomain()
              )
    }
}

extension AdminNameSpace.DraftOrderCreateMutation.Data.DraftOrderCreate.DraftOrder.LineItems.Node.Variant: Mappable {
    func toDomain() -> OrderVariant {
        return OrderVariant(
                  id: id,
                  price: price,
                  availableForSale: availableForSale,
                  title: title
              )
    }
}

extension AdminNameSpace.DraftOrderCreateMutation.Data.DraftOrderCreate.DraftOrder.LineItems.Node.Product: Mappable {
    func toDomain() ->OrderProduct  {
        return OrderProduct(
                 id: id,
                 priceRangeV2: priceRangeV2.toDomain(),
                 title: title,
                 productType: productType,
                 featuredImage: featuredImage?.toDomain()
             )
    }
}
extension AdminNameSpace.DraftOrderCreateMutation.Data.DraftOrderCreate.DraftOrder.LineItems.Node.Product.PriceRangeV2: Mappable {
    func toDomain() -> PriceRangeV2 {
         return PriceRangeV2(
             maxVariantPrice: Money(
                amount: Double(maxVariantPrice.amount) ?? 0.0,
                 currencyCode: maxVariantPrice.currencyCode.rawValue
             )
         )
     }
}
extension AdminNameSpace.DraftOrderCreateMutation.Data.DraftOrderCreate.DraftOrder.LineItems.Node.Product.FeaturedImage {
    func toDomain() -> ProductImage {
        return ProductImage(url: url)
    }
}
