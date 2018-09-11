class Potepan::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.find(params[:id])
    @taxonomies = Spree::Taxonomy.all.includes(root: :children)
    @products = Spree::Product.in_taxon(@taxon).includes(master: [:default_price, :images])
  end
end
